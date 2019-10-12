package toppar.wine_guesser.application;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import toppar.wine_guesser.domain.*;
import toppar.wine_guesser.repository.GameSettingsRepository;
import toppar.wine_guesser.util.UrlScanner;
import toppar.wine_guesser.util.ZXingHelper;
import java.util.ArrayList;
import java.util.List;

@Transactional(rollbackFor = Exception.class, propagation = Propagation.REQUIRES_NEW, isolation = Isolation.SERIALIZABLE)
@Service
public class GameSettingsService {

    @Autowired
    private GameSettingsRepository gameSettingsRepository;
    @Autowired
    private GameSetupService gameSetupService;
    @Autowired
    private SettingsHistoryService settingsHistoryService;

    public void removeGameSettingsIfGameIdDontMatch(String gameHost, String gameId){
        List<GameSettings> gameSettings = gameSettingsRepository.findAllByGameHost(gameHost);
        if(gameSettings != null){
            for(int i = 0; i < gameSettings.size(); i++) {
                if(!gameSettings.get(i).getGameId().equals(gameId)){
                    removeGameSettingsByGameHost(gameHost);
                    break;
                }
            }
        }
    }

    private void deleteGameSettingsByGameHost(String gameHost){
        gameSettingsRepository.removeAllByGameHost(gameHost);
    }

    public void checkForAuthority(String gameHost) throws AuthorizationException {
        if(gameSettingsRepository.findAllByGameHost(gameHost) == null){
            throw new AuthorizationException("Lobby Authorization denied");
        }
    }

    public void deleteRegionsThatDontMatch(String region, String gameHost){
        List<GameSettings> gameSettingsList = gameSettingsRepository.findAllByGameHost(gameHost);
        for (GameSettings gameSettings : gameSettingsList) {
            if (!gameSettings.getRegion().equals(region)) {
                gameSettings.setRegion(null);
                gameSettingsRepository.save(gameSettings);
            }
        }
    }

    public List<GameSettings> getAllByGameId(String gameId){
        return gameSettingsRepository.findAllByGameId(gameId);
    }

    public List<String> getQrCodesByGameHost(String username) throws AuthorizationException {
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
    public void setServingOrderByWineId(String wineId, String servingOrder, String gameId) throws ServingOrderExcepetion {
        checkIfServingOrderIsValid(servingOrder, gameId);
        List<GameSettings> gameSettings = gameSettingsRepository.findAllByGameId(gameId);

        for(int i = 0; i < gameSettings.size(); i++){
            if(gameSettings.get(i).getServingOrder() != null){
                if(gameSettings.get(i).getServingOrder().equals(servingOrder)){
                    throw new ServingOrderExcepetion("same order");
                }
            }
        }

        for(int i = 0; i < gameSettings.size(); i++){
            if(gameSettings.get(i).getServingOrder() == null && gameSettings.get(i).getUrl().contains(wineId)){
                gameSettings.get(i).setServingOrder(servingOrder);
                gameSettingsRepository.save(gameSettings.get(i));
                break;
            }
        }
    }

    private void checkIfServingOrderIsValid(String servingOrder, String gameId) throws ServingOrderExcepetion {
        if(servingOrder.isEmpty()){
            throw new ServingOrderExcepetion("servorder nodata");
        }
        List<GameSettings> gameSettings = gameSettingsRepository.findAllByGameId(gameId);
        try {
            if (Integer.valueOf(servingOrder) > gameSettings.size()) {
                throw new ServingOrderExcepetion("servorder big");
            }
            if (Integer.valueOf(servingOrder) < 1) {
                throw new ServingOrderExcepetion("servorder small");
            }
        }catch(NumberFormatException e){
            throw new ServingOrderExcepetion("servorder nodata");
        }
    }

    public void removeGameSettingsByGameHost(String gameHost) {
        List<GameSettings> gameSettings = gameSettingsRepository.findAllByGameHost(gameHost);
        settingsHistoryService.saveGameSettings(gameSettings);
        gameSettingsRepository.removeAllByGameHost(gameHost);
    }

    public String findChosenRegionByGameId(String gameId){
        List<GameSettings> gameSettingsList = gameSettingsRepository.findAllByGameId(gameId);
        String region = null;
        for(int i = 0; i < gameSettingsList.size(); i++){
            if(gameSettingsList.get(i).getRegion() != null){
                region = gameSettingsList.get(i).getRegion();
            }
        }
        return region;
    }

    public List<String> createGameSettings(List<String> urlList, String gameHost) throws WineryException, AuthorizationException {
        removeGameSettingsByGameHost(gameHost);
        String gameId = gameSetupService.getGameSetupByGameHost(gameHost).getGameId();
        List<String> region = retrieveRegionsFromUrlList(urlList);
        List<String> qrCodes = generateQrCodesFromUrls(urlList, gameId);
        List<String> descriptions = retrieveAllDescriptionsFromUrlList(urlList);
        List<String> imgSourceStrings = retrieveImgSourceStringsFromUrl(urlList);
        List<String> wineNames = retrieveWineNamesFromUrl(urlList);
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
                gameSettingsRepository.save(new GameSettings(gameId, gameHost, qrCodes.get(i), urlList.get(i), imgSourceStrings.get(i), wineNames.get(i), region.get(i), descriptions.get(i), null));
            }
        }
        return wineDescriptionMissing;
    }

    public List<GameSettings> getGameSettingsByGameHost(String gameHost){
        return gameSettingsRepository.findAllByGameHost(gameHost);
    }

    private boolean descriptionContainSentAndTastCheck(String description){
        return description.contains("Smak:") && description.contains("Doft:");
    }

    private List<String> retrieveRegionsFromUrlList(List<String> urlList){
        UrlScanner urlScanner = new UrlScanner();
        List<String> regionList = new ArrayList<>();
        urlList.forEach(url -> regionList.add(urlScanner.getRegionFromUrl(url)));
        return regionList;
    }

    private List<String> retrieveWineNamesFromUrl(List<String> urlList){
        List<String> wineNames = new ArrayList<>();
        urlList.forEach(url -> wineNames.add(scrapUrlForWineName(url)));
        return wineNames;
    }

    private List<String> retrieveAllDescriptionsFromUrlList(List<String> urlList) throws WineryException {
        UrlScanner urlScanner = new UrlScanner();
        return urlScanner.findDescriptionsForAllUrls(urlList);
    }

    private List<String> generateQrCodesFromUrls(List<String> urlList, String gameId){
        List<String> qrCodes = new ArrayList<>();
        for (String s : urlList) {
            qrCodes.add(ZXingHelper.getQRCodeImage(scrapUrlForWineIdAndAppendToNewUrl(s, gameId), 160, 160));
        }
        return qrCodes;
    }

    private List<String> retrieveImgSourceStringsFromUrl(List<String> urlList) throws WineryException {
        List<String> imgSourceStrings = new ArrayList<>();
        for (String s : urlList) {
            imgSourceStrings.add(UrlScanner.getImageSourceStringFromUrl(s));
        }
        return imgSourceStrings;
    }

    private String scrapUrlForWineName(String url){
        StringBuilder sb = new StringBuilder(url);
        sb.reverse();
        for(int i = 0; i < sb.length(); i++){
            if(Character.toString(sb.charAt(i)).equals("/")){
                sb.delete(i, url.length());
            }
        }
        sb.reverse();
        for(int i = 0; i < sb.length(); i++){
            if(Character.toString(sb.charAt(i)).equals("-")) {
                sb.deleteCharAt(i);
                sb.replace(i, i, " ");
            }
            if(Character.isDigit(sb.charAt(i))){
                sb.deleteCharAt(i);
            }
        }
        for(int i = 0; i < sb.length(); i++){
            if(Character.isDigit(sb.charAt(i))){
                sb.delete(i, url.length());
                break;
            }
        }
        for(int i = 0; i < sb.length(); i++){
            if(Character.toString(sb.charAt(i)).equals(" ")) {
                if(i < (sb.length() - 1)){
                    sb.setCharAt(i + 1, Character.toString(sb.charAt(i + 1)).toUpperCase().charAt(0));
                }
                if(i == sb.length() - 1){
                    sb.deleteCharAt(i);
                }
            }
            if(i == 0){
                sb.setCharAt(i, Character.toString(sb.charAt(i)).toUpperCase().charAt(0));
            }
        }
        return sb.toString();
    }

    private String scrapUrlForWineIdAndAppendToNewUrl(String url, String gameId){
        StringBuilder sb = new StringBuilder(url);
        sb.reverse();
        for(int i = 0; i < sb.length(); i++){
            if(!Character.isDigit(sb.charAt(i))){
                sb.delete(i, url.length());
                break;
            }
        }
        return "https://wineguesser.herokuapp.com/QR/"+gameId+"/"+sb.reverse().toString();

    }
    public void winesMissingServingOrder(String gameId) throws WineryException {
        List<GameSettings> gameSettings = gameSettingsRepository.findAllByGameId(gameId);
        for (GameSettings gameSetting : gameSettings) {
            if (gameSetting.getServingOrder() == null) {
                throw new WineryException("serving order error");
            }
        }
    }

    public List<String> getDescriptionsByGameId(String gameId){
        List<GameSettings> gameSettings = gameSettingsRepository.findAllByGameId(gameId);
        List<String> descriptions = new ArrayList<>();
        gameSettings.forEach(gameSetting -> descriptions.add(gameSetting.getDescription()));
        return descriptions;
    }

    public String findCorrectDescription(String gameId, int servingOrder){
        GameSettings gameSettings = gameSettingsRepository.findAllByGameIdAndServingOrder(gameId, String.valueOf(servingOrder));
        return gameSettings.getDescription();
    }

    public GameSettings findGameSettingsByServingOrderAndGameId(String servingOrder, String gameId){
        return gameSettingsRepository.findAllByGameIdAndServingOrder(gameId, servingOrder);
    }

    public int getNumberOfWinesWithRegionsForGameId(String gameId) {
        List<GameSettings> gameSettings = gameSettingsRepository.findAllByGameId(gameId);
        return (int) gameSettings.stream().filter(gameSetting -> gameSetting.getRegion() != null).count();
    }

    public boolean checkIfServingOrderAlreadyEntered(String gameId, String id) {
        List<GameSettings> gameSettings = gameSettingsRepository.findAllByGameId(gameId);
        for(int i = 0; i < gameSettings.size(); i++){
            if(gameSettings.get(i).getUrl().contains(id)){
                if(gameSettings.get(i).getServingOrder() != null){
                    return true;
                }
            }
        }
        return false;
    }
}
