package toppar.wine_guesser.application;

import com.gargoylesoftware.htmlunit.FailingHttpStatusCodeException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.*;
import toppar.wine_guesser.repository.GameSettingsRepository;
import toppar.wine_guesser.util.UrlScanner;
import toppar.wine_guesser.util.ZXingHelper;
import java.util.ArrayList;
import java.util.List;

@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW)
@Service
public class GameSettingsService {

    @Autowired
    private GameSettingsRepository gameSettingsRepository;
    @Autowired
    private GameSetupService gameSetupService;
    @Autowired
    private SettingsHistoryService settingsHistoryService;

    private void deleteGameSettingsByGameHost(String gameHost){
        gameSettingsRepository.removeAllByGameHost(gameHost);
    }

    public void checkForAuthority(String gameHost) throws AuthorizationException {
        if(gameSettingsRepository.findAllByGameHost(gameHost) == null){
            throw new AuthorizationException("Lobby Authorization denied");
        }
    }

    public List<String> getQrCodesByGameHost(String username){
        GameSetupDTO gameSetupDTO  = gameSetupService.getGameSetupByGameHost(username);
        List<GameSettings> gameSettingsDTOS = gameSettingsRepository.findAllByGameId(gameSetupDTO.getGameId());
        List<String> qrCodes = new ArrayList<>();
        for(int i = 0; i < gameSettingsDTOS.size(); i++){
            qrCodes.add(gameSettingsDTOS.get(i).getQrCode());
        }
        return qrCodes;
    }

    public String getUrlFromWineId(String wineId){
        List<GameSettings> gameSettings = gameSettingsRepository.findAll();
        for(int i = 0; i < gameSettings.size(); i++){
            if(gameSettings.get(i).getUrl().contains(wineId)){
                return gameSettings.get(i).getUrl();
            }
        }
        return null;
    }
    public void setServingOrderByWineId(String wineId, String servingOrder){
        String url = getUrlFromWineId(wineId);
        List<GameSettings> gameSettings = gameSettingsRepository.findAllByUrl(url);
        for(int i = 0; i < gameSettings.size(); i++){
            if(gameSettings.get(i).getServingOrder() == null){
                gameSettings.get(i).setServingOrder(servingOrder);
            }
        }
    }

    public void removeGameSettingsByGameHost(String gameHost) {
        List<GameSettings> gameSettings = gameSettingsRepository.findAllByGameHost(gameHost);
        settingsHistoryService.saveGameSettings(gameSettings);
        gameSettingsRepository.removeAllByGameHost(gameHost);
    }

    public List<String> createGameSettings(List<String> urlList, String gameHost) throws WineryException{
        String gameId = gameSetupService.getGameSetupByGameHost(gameHost).getGameId();
        deleteGameSettingsByGameHost(gameHost);
        List<String> qrCodes = generateQrCodesFromUrls(urlList);
        List<String> descriptions = retrieveAllDescriptionsFromUrlList(urlList);
        List<String> wineDescriptionMissing = new ArrayList<>();
        boolean anyWineMissingDescription = false;
        for(int i = 0; i < urlList.size(); i++){
            if(!descriptionContainSentAndTastCheck(descriptions.get(i))){
                wineDescriptionMissing.add(urlList.get(i));
                anyWineMissingDescription = true;
            }
        }
        if(!anyWineMissingDescription){
            for(int i = 0; i < urlList.size(); i++){
                gameSettingsRepository.save(new GameSettings(gameId, gameHost, qrCodes.get(i), urlList.get(i), descriptions.get(i), null));
            }
        }
        return wineDescriptionMissing;
    }

    private boolean descriptionContainSentAndTastCheck(String description){
        return description.contains("Smak:") && description.contains("Doft:");
    }

    private List<String> retrieveAllDescriptionsFromUrlList(List<String> urlList) throws WineryException {
        UrlScanner urlScanner = new UrlScanner();
        return urlScanner.findDescriptionsForAllUrls(urlList);
    }

    private List<String> generateQrCodesFromUrls(List<String> urlList){
        List<String> qrCodes = new ArrayList<>();
        for(int i = 0; i < urlList.size(); i ++){
            qrCodes.add(ZXingHelper.getQRCodeImage(scrapUrlForWineIdAndAppendToNewUrl(urlList.get(i)), 160, 160));
        }
        return qrCodes;
    }

    private String scrapUrlForWineIdAndAppendToNewUrl(String url){
        StringBuilder sb = new StringBuilder(url);
        sb.reverse();
        for(int i = 0; i < sb.length(); i++){
            if(!Character.isDigit(sb.charAt(i))){
                sb.delete(i, url.length());
                break;
            }
        }
        return "http://192.168.0.100:8080/QR/wine/"+sb.reverse().toString();

    }
}
