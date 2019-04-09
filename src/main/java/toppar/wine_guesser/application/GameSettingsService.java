package toppar.wine_guesser.application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.GameSettings;
import toppar.wine_guesser.domain.GameSettingsDTO;
import toppar.wine_guesser.domain.GameSetup;
import toppar.wine_guesser.domain.GameSetupDTO;
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

    public List<String> getQrCodesByGameHost(String username){
        GameSetupDTO gameSetupDTO  = gameSetupService.getGameSetupByGameHost(username);
        List<GameSettings> gameSettingsDTOS = gameSettingsRepository.findAllByGameId(gameSetupDTO.getGameId());
        List<String> qrCodes = new ArrayList<>();
        for(int i = 0; i < gameSettingsDTOS.size(); i++){
            qrCodes.add(gameSettingsDTOS.get(i).getQrCode());
        }
        return qrCodes;
    }


    public List<String> createGameSettings(List<String> urlList, String gameHost){
        List<String> qrCodes = generateQrCodesFromUrls(urlList);
        List<String> descriptions = retrieveAllDescriptionsFromUrlList(urlList);
        String gameId = gameSetupService.getGameSetupByGameHost(gameHost).getGameId();
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
                gameSettingsRepository.save(new GameSettings(gameId, qrCodes.get(i), urlList.get(i), descriptions.get(i)));
            }
        }
        return wineDescriptionMissing;
    }

    private boolean descriptionContainSentAndTastCheck(String description){
        return description.contains("Smak:") && description.contains("Doft:");
    }

    private List<String> retrieveAllDescriptionsFromUrlList(List<String> urlList){
        UrlScanner urlScanner = new UrlScanner();
        return urlScanner.findDescriptionsForAllUrls(urlList);
    }

    private List<String> generateQrCodesFromUrls(List<String> urlList){
        List<String> qrCodes = new ArrayList<>();
        for(int i = 0; i < urlList.size(); i ++){
            qrCodes.add(ZXingHelper.getQRCodeImage(urlList.get(i), 160, 160));
        }
        return qrCodes;
    }

}
