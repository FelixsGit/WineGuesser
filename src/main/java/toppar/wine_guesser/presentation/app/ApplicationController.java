package toppar.wine_guesser.presentation.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import toppar.wine_guesser.application.*;
import toppar.wine_guesser.domain.*;
import toppar.wine_guesser.presentation.err.ErrorHandler;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Controller
public class ApplicationController {

    public static final String DEFAULT_PAGE_URL = "/";
    public static final String HOME_PAGE_URL = "home";
    public static final String MENU_PAGE_URL = "menu";
    public static final String ENTER_URL_PAGE_URL = "enterUrl";
    public static final String LOBBY_PAGE_URL = "lobby";
    public static final String LOGIN_PAGE_URL = "login";
    public static final String REGISTER_PAGE_URL = "register";
    public static final String NUMBER_OF_WINES_PAGE_URL = "numberOfWines";
    public static final String PRINT_QR_CODES_PAGE_URL = "printQrCodes";
    public static final String QR_OPTION_PAGE_URL = "QR/wine/qrOption";
    public static final String GAME_BOARD_PAGE_URL = "gameBoard";
    public static final String GAME_BOARD_LOCK_PAGE_URL = "gameBoardLock";
    public static final String GAME_RESULTS_PAGE_URL = "gameResults";
    public static final String PROFILE_PAGE_URL = "profile";
    public static final String ENTER_REGION_PAGE_URL = "enterRegion";

    public static final String REGISTER_OBJ_NAME = "registerForm";
    public static final String LOBBY_OBJ_NAME = "lobbyForm";
    public static final String LOGIN_OBJ_NAME = "loginForm";
    public static final String JOIN_GAME_LOBBY_OBJ_NAME = "joinGameLobbyForm";
    public static final String ENTER_URL_OBJ_NAME = "enterUrlForm";
    public static final String NUMBER_OF_WINES_OBJ_NAME = "numberOfWinesForm";
    public static final String PRINT_QR_CODES_OBJ_NAME = "printQrCodesForm";
    public static final String QR_OPTION_OBJ_NAME = "qrOptionForm";
    public static final String SERVING_ORDER_OBJ_NAME = "servingOrderForm";
    public static final String GAME_BOARD_OBJ_NAME = "gameBoardForm";
    public static final String GAME_BOARD_LOCK_OBJ_NAME = "gameBoardLockForm";
    public static final String GAME_RESULTS_OBJ_NAME = "gameResultsForm";
    public static final String PROFILE_OBJ_NAME = "profileForm";
    public static final String ENTER_REGION_OBJ_NAME = "enterRegionForm";


    //////////////////////////////////////GET MAPPINGS/////////////////////////////////////////////////////

    @Autowired
    private UserService userService;
    @Autowired
    private GameSetupService gameSetupService;
    @Autowired
    private GameSettingsService gameSettingsService;
    @Autowired
    private LobbyService lobbyService;
    @Autowired
    private LobbyDataService lobbyDataService;
    @Autowired
    private UserGuessesService userGuessesService;
    @Autowired
    private GamePointService gamePointService;
    @Autowired
    private GameResultService gameResultService;
    @Autowired
    private ResultDataService resultDataService;
    @Autowired
    private JudgementService judgementService;
    @Autowired
    private MatchHistoryService matchHistoryService;
    @Autowired
    private UserResultsService userResultsService;

    @GetMapping("enterRegion")
    public String showEnterRegionPage(Model model, HttpServletRequest request){
        if(!model.containsAttribute(ENTER_REGION_OBJ_NAME)){
            model.addAttribute(ENTER_REGION_OBJ_NAME);
        }
        List<GameSettings> gameSettings = gameSettingsService.getGameSettingsByGameHost(request.getUserPrincipal().getName());
        List<String> regions = new ArrayList<>();
        gameSettings.forEach(gameSetting -> {
            if(!regions.contains(gameSetting.getRegion())){
                regions.add(gameSetting.getRegion());
            }
        });
        EnterRegionForm enterRegionForm = new EnterRegionForm();
        enterRegionForm.setRegions(regions);
        model.addAttribute(enterRegionForm);
        return ENTER_REGION_PAGE_URL;
    }

    @GetMapping("gameResults"+"/{gameId}"+"/{viewer}")
    public String showOldGameResultsPage(Model model, @PathVariable("gameId") String gameId, @PathVariable String viewer){
        if(!model.containsAttribute(GAME_RESULTS_OBJ_NAME)){
            model.addAttribute(GAME_RESULTS_OBJ_NAME);
        }
        GameResultsForm gameResultsForm = new GameResultsForm();
        gameResultsForm.setGameStats(gameResultService.retrieveGameStatsForGameWithIdAndUsername(gameId, viewer));
        gameResultsForm.setViewer(viewer);
        model.addAttribute(gameResultsForm);
        return GAME_RESULTS_PAGE_URL;
    }

    @GetMapping("gameResults"+"/{gameId}")
    public String showGameResultsPage(Model model, @PathVariable("gameId") String gameId, HttpServletRequest request){
        if(!model.containsAttribute(GAME_RESULTS_OBJ_NAME)){
            model.addAttribute(GAME_RESULTS_OBJ_NAME);
        }
        GameResultsForm gameResultsForm = new GameResultsForm();
        if(matchHistoryService.isOldGame(gameId)){
            gameResultsForm.setGameStats(gameResultService.retrieveGameStatsForGameWithIdAndUsername(gameId, request.getUserPrincipal().getName()));
            gameResultsForm.setViewer(request.getUserPrincipal().getName());
        }else{
            userService.setActiveGameForAllParticipants(lobbyDataService.getParticipantsByGameId(gameId), null);
            lobbyService.setGameStartToFinished(gameId);
            gameResultService.generateGameStatsForGameWithId(gameId);
            gameResultsForm.setGameStats(gameResultService.retrieveGameStatsForGameWithIdAndUsername(gameId, request.getUserPrincipal().getName()));
            gameResultsForm.setViewer(request.getUserPrincipal().getName());
            gameSetupService.removeGameSetupByGameHost(request.getUserPrincipal().getName());
            //gameSettingsService.removeGameSettingsByGameHost(request.getUserPrincipal().getName());
            lobbyDataService.removeAllByGameId(gameId);
            userGuessesService.removeAllByGameId(gameId);
            judgementService.removeAllByGameId(gameId);
        }
        model.addAttribute(gameResultsForm);
        return GAME_RESULTS_PAGE_URL;
    }

    @GetMapping("profile"+"/{username}")
    public String showProfilePage(Model model, @PathVariable String username){
        if(model.containsAttribute(PROFILE_OBJ_NAME)){
            model.addAttribute(PROFILE_OBJ_NAME);
        }
        ProfileForm profileForm = new ProfileForm();
        try {
            ProfileData profileDataForUserWithUsername = userResultsService.getProfileDataForUserWithUsername(username);
            profileDataForUserWithUsername.getUserResultsDTO().setCorrectPercent(profileDataForUserWithUsername.getUserResultsDTO().getCorrectPercent() * 100);
            profileForm.setProfileData(profileDataForUserWithUsername);
        } catch (UserException e) {
            controlErrorHandling(e, model);
            return MENU_PAGE_URL;
        }
        model.addAttribute(profileForm);
        return PROFILE_PAGE_URL;
    }




    @MessageMapping("/chat.regularComs/{gameId}")
    @SendTo("/topic/{gameId}")
    public ChatMessage regularComs(@DestinationVariable String gameId, @Payload ChatMessage chatMessage, SimpMessageHeaderAccessor headerAccessor) {
        printChatMessage(chatMessage, "res");
        if(chatMessage.getType().equals(ChatMessage.MessageType.READY)){
            lobbyDataService.setReadyForParticipant(chatMessage.getSender());
            if(lobbyDataService.checkIfAllParticipantsAreReady(gameId)){
                chatMessage.setContent("ALLREADY");
            }
        }else if(chatMessage.getType().equals(ChatMessage.MessageType.LEAVE)){
            lobbyDataService.setNotReadyForParticipant(chatMessage.getSender());
            chatMessage.setType(ChatMessage.MessageType.LEAVE);
        }else if(chatMessage.getType().equals(ChatMessage.MessageType.DONE)){
            if(chatMessage.getSender().equals(Objects.requireNonNull(headerAccessor.getUser()).getName())) {
                lobbyDataService.setDoneTrueForParticipant(headerAccessor.getUser().getName());
                if (lobbyDataService.checkIfAllParticipantsAreDone(gameId)) {
                    System.out.println("check if all users are done passed");
                    chatMessage.setContent("ALLDONE");
                }else{
                    System.out.println("server concluded user was not done");
                }

            }
        }
        printChatMessage(chatMessage, "send");
        return chatMessage;
    }

    @GetMapping("/about")
    public String showAboutPage(){
        return "about";
    }


    private void printChatMessage(ChatMessage chatMessage, String option){
        if(option.equals("res")){
            System.out.println();
            System.out.println("Server received message");
            System.out.println("{sender: " + chatMessage.getSender());
            System.out.println("content: " + chatMessage.getContent());
            System.out.println("gameId: " + chatMessage.getGameId());
            System.out.println("type: " + chatMessage.getType() + "}");
        }else{
            System.out.println();
            System.out.println("Server sending message");
            System.out.println("{sender: " + chatMessage.getSender());
            System.out.println("content: " + chatMessage.getContent());
            System.out.println("gameId: " + chatMessage.getGameId());
            System.out.println("type: " + chatMessage.getType() + "}");
        }

    }

    @MessageMapping("/chat.determineSocketId")
    @SendTo("/topic/public")
    public ChatMessage determineSocketId(@Payload ChatMessage chatMessage, SimpMessageHeaderAccessor headerAccessor) {
        chatMessage.setContent(Objects.requireNonNull(headerAccessor.getUser()).getName());
        chatMessage.setType(ChatMessage.MessageType.SETUP);
        chatMessage.setGameId(userService.getActiveGame(Objects.requireNonNull(headerAccessor.getUser()).getName()));
        return chatMessage;
    }


    @GetMapping("gameBoard"+"/{gameId}")
    public String showGameBoardPage(Model model, GameBoardForm gameBoardForm, @PathVariable("gameId") String gameId, HttpServletRequest request, BindingResult bindingResult){
        System.out.println("call to game board page");
        if(!model.containsAttribute(GAME_BOARD_OBJ_NAME)){
            model.addAttribute(GAME_BOARD_OBJ_NAME);
        }
        if(userGuessesService.userHasMadeAGuess(gameId, request.getUserPrincipal().getName())){
            return showGameBoardLockPage(model, new GameBoardLockForm(), gameId, request);
        }
        lobbyService.startGameLobbyByGameId(gameId);
        gameBoardForm.setDescriptions(gameSettingsService.getDescriptionsByGameId(gameId));
        int judgementsPassed = judgementService.findNumberOfJudgementsForUserAndGame(request.getUserPrincipal().getName(), gameId);
        int numberOfWines = gameSettingsService.getAllByGameId(gameId).size();
        if(judgementsPassed == 0){
            gameBoardForm.setWineToRate(1);
        }else if(judgementsPassed >= numberOfWines){
            gameBoardForm.setDoneRating("true");
        }
        if(!bindingResult.hasErrors()){
            gameBoardForm.setChosenRegion(gameSettingsService.findChosenRegionByGameId(gameId));
        }
        gameBoardForm.setWineToRate(judgementsPassed + 1);
        gameBoardForm.setNumOfWinesWithRegion(gameSettingsService.getNumberOfWinesWithRegionsForGameId(gameId));
        gameBoardForm.setGameId(gameId);
        model.addAttribute(gameBoardForm);
        return GAME_BOARD_PAGE_URL;
    }

    @GetMapping("gameBoardLock"+"/{gameId}")
    public String showGameBoardLockPage(Model model, GameBoardLockForm gameBoardLockForm, @PathVariable("gameId") String gameId, HttpServletRequest request){
        System.out.println("call to game board lock page");
        if(!model.containsAttribute(GAME_BOARD_LOCK_OBJ_NAME)){
            model.addAttribute(GAME_BOARD_LOCK_OBJ_NAME);
        }
        gameBoardLockForm.setParticipantsDone(lobbyDataService.getUsersDoneByGameId(gameId));
        gameBoardLockForm.setParticipantsNotDone(lobbyDataService.getUsersNotDoneByGameId(gameId));
        gameBoardLockForm.setGuessNum(userGuessesService.getServingOrderGuessesByUsername(request.getUserPrincipal().getName()));
        gameBoardLockForm.setDescriptions(userGuessesService.getDescriptionGuessesByUsername(request.getUserPrincipal().getName()));
        gameBoardLockForm.setGameId(gameId);
        if(lobbyDataService.checkIfAllParticipantsAreDone(gameId)){
            gameBoardLockForm.setAllDone("true");
        }
        if(lobbyDataService.isGameHost(request.getUserPrincipal().getName(), gameId)){
            gameBoardLockForm.setGameHost(request.getUserPrincipal().getName());
        }
        model.addAttribute(gameBoardLockForm);
        return GAME_BOARD_LOCK_PAGE_URL;
    }



    @GetMapping("generateLobby"+"/{gameId}")
    public String generateLobby(Model model, HttpServletRequest request, @PathVariable("gameId") String gameId){
        try {
            gameSettingsService.checkForAuthority(request.getUserPrincipal().getName());
        } catch (AuthorizationException e) {
            //controlErrorHandling(e, model);
            return MENU_PAGE_URL;
        }
        lobbyDataService.openNewLobby(request.getUserPrincipal().getName(), gameId);
        userService.setActiveGameForUser(request.getUserPrincipal().getName(), gameId);
        return showLobbyPage(model, request, gameId);
    }


    @GetMapping(LOBBY_PAGE_URL+"/{gameId}")
    public String showLobbyPage(Model model, HttpServletRequest request, @PathVariable("gameId") String gameId){
        if(!model.containsAttribute(LOBBY_OBJ_NAME)){
            model.addAttribute(LOBBY_OBJ_NAME);
        }
        try {
            lobbyService.checkAuthorizationByGameId(gameId);
        } catch (AuthorizationException e) {
            controlErrorHandling(e, model);
            return MENU_PAGE_URL;
        }
        LobbyForm lobbyForm = new LobbyForm();
        System.out.println("participants not ready: "+lobbyDataService.getUsersNotReadyByGameId(gameId).toString());
        System.out.println("participants ready: "+lobbyDataService.getUsersReadyByGameId(gameId).toString());
        lobbyForm.setParticipantsNotReady(lobbyDataService.getUsersNotReadyByGameId(gameId));
        lobbyForm.setParticipantsReady(lobbyDataService.getUsersReadyByGameId(gameId));
        lobbyForm.setGameId(lobbyService.getLobbyByGameId(gameId).getGameId());
        lobbyForm.setUsername(request.getUserPrincipal().getName());
        if(lobbyDataService.isGameHost(request.getUserPrincipal().getName(), gameId)){
            lobbyForm.setGameHost(request.getUserPrincipal().getName());
        }
        model.addAttribute(lobbyForm);
        return LOBBY_PAGE_URL;
    }

    @GetMapping("QR/wine/{id}")
    public String showQrOptionPage(Model model, @PathVariable("id") String id){
        if(!model.containsAttribute(QR_OPTION_OBJ_NAME) || !model.containsAttribute(SERVING_ORDER_OBJ_NAME)){
            QrOptionForm qrOptionForm = new QrOptionForm();
            qrOptionForm.setId(id);
            model.addAttribute(qrOptionForm);
        }
        QrOptionForm qrOptionForm = new QrOptionForm();
        qrOptionForm.setId(id);
        String url = gameSettingsService.getUrlFromWineId(id);
        System.out.println(url);
        String parsedUrl = "Klicka Här För Att Kolla På Vinet På Webben";
        qrOptionForm.setUrl(url);
        qrOptionForm.setParsedUrl(parsedUrl);
        model.addAttribute(qrOptionForm);
        return "qrOption";
    }

    @GetMapping(DEFAULT_PAGE_URL)
    public String showDefaultPage() {
        return "redirect:" + HOME_PAGE_URL;
    }

    @GetMapping(HOME_PAGE_URL)
    public String showHomePage(){
        return HOME_PAGE_URL;
    }

    @GetMapping(PRINT_QR_CODES_PAGE_URL)
    public String showPrintQrCodesPage(Model model, HttpServletRequest request){
        if(!model.containsAttribute(PRINT_QR_CODES_OBJ_NAME)){
            model.addAttribute(new PrintQrCodesForm());
        }
        PrintQrCodesForm printQrCodesForm = new PrintQrCodesForm();
        List<String> qrCodes = gameSettingsService.getQrCodesByGameHost(request.getUserPrincipal().getName());
        GameSetupDTO gameSetupDTO = gameSetupService.getGameSetupByGameHost(request.getUserPrincipal().getName());
        printQrCodesForm.setGameId(gameSetupDTO.getGameId());
        printQrCodesForm.setQrCodes(qrCodes);
        model.addAttribute(printQrCodesForm);
        return PRINT_QR_CODES_PAGE_URL;
    }

    @GetMapping(LOGIN_PAGE_URL)
    public String showLoginPage(Model model){
        if(!model.containsAttribute(LOGIN_OBJ_NAME)){
            model.addAttribute(new LoginForm());
        }
        return LOGIN_PAGE_URL;
    }

    @GetMapping(REGISTER_PAGE_URL)
    public String showRegisterPage(Model model){
        if(!model.containsAttribute(REGISTER_OBJ_NAME)){
            model.addAttribute(new RegisterForm());
        }
        return REGISTER_PAGE_URL;
    }

    @GetMapping(NUMBER_OF_WINES_PAGE_URL)
    public String showNumberOfWinesPage(Model model){
        if(!model.containsAttribute(NUMBER_OF_WINES_OBJ_NAME)){
            model.addAttribute(new NumberOfWinesForm());
        }
        return NUMBER_OF_WINES_PAGE_URL;
    }

    @GetMapping("lobby/{gameId}/command/{action}")
    public String lobbyCommandRedirect(Model model, @PathVariable("action") String action, @PathVariable String gameId, HttpServletRequest request) {
        if(!model.containsAttribute(JOIN_GAME_LOBBY_OBJ_NAME)){
            model.addAttribute(JOIN_GAME_LOBBY_OBJ_NAME);
        }
        if(action.equals("quit")){
            if(lobbyDataService.isGameHost(request.getUserPrincipal().getName(), gameId)){
                System.out.println("user: " + request.getUserPrincipal().getName() +" is closing the lobby down");
                gameSetupService.removeGameSetupByGameHost(request.getUserPrincipal().getName());
                gameSettingsService.removeGameSettingsByGameHost(request.getUserPrincipal().getName());
                lobbyService.cancelGameLobbyByGameId(gameId);
                lobbyDataService.removeAllParticipantsFromLobbyWithGameId(gameId);
                userService.cancelActiveGamesForAllUsersWithGameId(gameId);
            }
        }
        if(action.equals("leave")){
            lobbyDataService.removeParticipantFromLobby(request.getUserPrincipal().getName());
            userService.removeActiveGameFromUserWithUsername(request.getUserPrincipal().getName());
        }
        if(action.equals("showResult")){
            System.out.println("showing results!!!");
        }
        JoinGameLobbyForm joinGameLobbyForm = new JoinGameLobbyForm();
        model.addAttribute(joinGameLobbyForm);
        return "menu";
    }


    @GetMapping(MENU_PAGE_URL)
    public String showMenuPage(Model model, HttpServletRequest request){
        if(!model.containsAttribute(JOIN_GAME_LOBBY_OBJ_NAME)){
            model.addAttribute(new JoinGameLobbyForm());
        }
        String gameId = userService.getActiveGame(request.getUserPrincipal().getName());
        if(gameId != null){
            String gameStatus = userService.getGameStatusByUsername(request.getUserPrincipal().getName());
            JoinGameLobbyForm joinGameLobbyForm = new JoinGameLobbyForm();
            if(gameStatus.equals("started")){
                joinGameLobbyForm.setGameStatus("started");
            }
            if(gameStatus.equals("finished")){
                joinGameLobbyForm.setGameStatus("finished");
            }
            if(gameStatus.equals("prestart")){
                joinGameLobbyForm.setGameStatus("prestart");
            }
            joinGameLobbyForm.setGameStatus(gameStatus);
            joinGameLobbyForm.setActiveGame(gameId);
            model.addAttribute(joinGameLobbyForm);
        }
        return MENU_PAGE_URL;
    }

    @GetMapping(ENTER_URL_PAGE_URL)
    public String showEnterUrlPage(Model model, HttpServletRequest request){
        if(!model.containsAttribute(ENTER_URL_OBJ_NAME) && !model.containsAttribute("missingDecData")){
            model.addAttribute(new EnterUrlForm());
            MissingDecData missingDecData = new MissingDecData();
            missingDecData.setMissing("notMissing");
            model.addAttribute(missingDecData);
        }
        GameSetupDTO gameSetupDTO = gameSetupService.getGameSetupByGameHost(request.getUserPrincipal().getName());
        int amountOfWines = Integer.parseInt(gameSetupDTO.getAmountOfWines());
        List<String> amount = new ArrayList<>();
        for(int i = 0; i < amountOfWines; i++){
           amount.add("");
        }
        EnterUrlForm enterUrlForm = new EnterUrlForm();
        enterUrlForm.setUrlList(amount);
        enterUrlForm.setGameId(gameSetupDTO.getGameId());
        model.addAttribute(enterUrlForm);
        return ENTER_URL_PAGE_URL;
    }


    //////////////////////////////////////POST MAPPINGS/////////////////////////////////////////////////////

    @PostMapping(ENTER_REGION_PAGE_URL)
    public String handleEnteredRegion(@ModelAttribute EnterRegionForm enterRegionForm, Model model, HttpServletRequest request){
        gameSettingsService.deleteRegionsThatDontMatch(enterRegionForm.getChosenRegion(), request.getUserPrincipal().getName());
        return showPrintQrCodesPage(model, request);
    }

    @PostMapping(GAME_BOARD_PAGE_URL)
    public String lockInResultsOrGrade(@Valid @ModelAttribute() GameBoardForm gameBoardForm, Model model, HttpServletRequest request, BindingResult bindingResult){
        if(gameBoardForm.getDoneRating() != null){
            try {
                gameSettingsService.winesMissingServingOrder(gameBoardForm.getGameId());
            } catch (WineryException e) {
                gameBoardForm.setChosenRegion(gameSettingsService.findChosenRegionByGameId(gameBoardForm.getGameId()));
                model.addAttribute(gameBoardForm);
                controlErrorHandling(e, model);
                return GAME_BOARD_PAGE_URL;
            }
            try {
                userGuessesService.saveUserGuesses(request.getUserPrincipal().getName(), gameBoardForm.getGameId(), gameBoardForm.getDescriptions(),
                        gameBoardForm.getGuessNum(), gameBoardForm.getRegionGuessList());
            } catch (GuessException e) {
                lobbyDataService.setNotDoneForParticipant(request.getUserPrincipal().getName());
                gameBoardForm.setChosenRegion(gameSettingsService.findChosenRegionByGameId(gameBoardForm.getGameId()));
                model.addAttribute(gameBoardForm);
                controlErrorHandling(e, model);
                return GAME_BOARD_PAGE_URL;
            }
            lobbyDataService.setDoneTrueForParticipant(request.getUserPrincipal().getName());
            return showGameBoardLockPage(model, new GameBoardLockForm(), gameBoardForm.getGameId(), request);
        }else{
            int numberOfWines = gameSettingsService.getAllByGameId(gameBoardForm.getGameId()).size();
            try {
                if(gameBoardForm.getWineRating() == null){
                    throw new JudgementException("range error");
                }
                judgementService.saveJudgement(gameBoardForm.getWineToRate(), gameBoardForm.getWineRating(), gameBoardForm.getGameId(), request.getUserPrincipal().getName());
            } catch (JudgementException e) {
                gameBoardForm.setDescriptions(gameSettingsService.getDescriptionsByGameId(gameBoardForm.getGameId()));
                model.addAttribute(gameBoardForm);
                controlErrorHandling(e, model);
                return GAME_BOARD_PAGE_URL;
            }
            if((gameBoardForm.getWineToRate() < numberOfWines) && gameBoardForm.getDoneRating() == null) {
                gameBoardForm.setWineToRate(gameBoardForm.getWineToRate() + 1);
            }else if((gameBoardForm.getWineToRate() >= numberOfWines) && gameBoardForm.getDoneRating() == null) {
                gameBoardForm.setDoneRating("true");
            }
        }
        return showGameBoardPage(model, gameBoardForm, gameBoardForm.getGameId(), request, bindingResult);
    }


    @PostMapping(QR_OPTION_PAGE_URL)
    public String enterServingOrder(@Valid @ModelAttribute QrOptionForm qrOptionForm, Model model, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return showQrOptionPage(model, qrOptionForm.getId());
        }
        try {
            gameSettingsService.setServingOrderByWineId(qrOptionForm.getId(), qrOptionForm.getOrderNum());
        } catch (ServingOrderExcepetion servingOrderExcepetion) {
            String parsedUrl = "Klicka Här För Att Kolla På Vinet På Webben";
            qrOptionForm.setParsedUrl(parsedUrl);
            model.addAttribute(qrOptionForm);
            controlErrorHandling(servingOrderExcepetion, model);
            return "qrOption";
        }
        return showDefaultPage();
    }

    @PostMapping(REGISTER_PAGE_URL)
    public String registerNewUser(@Valid @ModelAttribute RegisterForm registerForm, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){
            return showRegisterPage(model);
        }
        try {
            userService.createUser(registerForm.getUsername(), registerForm.getPassword());
        } catch (UserException e) {
            controlErrorHandling(e, model);
            return REGISTER_PAGE_URL;
        }
        return showLoginPage(model);
    }

    private void controlErrorHandling(Exception e, Model model){
        if(e.getMessage().toUpperCase().contains("USERNAME")){
            model.addAttribute(ErrorHandler.ERROR_TYPE_KEY, ErrorHandler.USERNAME_FAIL);
        }else if(e.getMessage().toUpperCase().contains("AUTHORIZATION")) {
            model.addAttribute(ErrorHandler.ERROR_TYPE_KEY, ErrorHandler.AUTHORIZATION_FAIL);
        } else if(e.getMessage().toUpperCase().contains("LOBBY")) {
            model.addAttribute(ErrorHandler.ERROR_TYPE_KEY, ErrorHandler.AUTHORIZATION_LOBBY_FAIL);
        }else if(e.getMessage().toUpperCase().contains("SYSTEMBOLAGET")){
            model.addAttribute(ErrorHandler.ERROR_TYPE_KEY, ErrorHandler.SYSTEMBOLAGET_DOWN);
        }else if(e.getMessage().toUpperCase().contains("BODEGASHOP")){
            model.addAttribute(ErrorHandler.ERROR_TYPE_KEY, ErrorHandler.BODEGASHOP_DOWN);
        }else if(e.getMessage().toUpperCase().contains("BIG")){
            model.addAttribute(ErrorHandler.ERROR_TYPE_KEY, ErrorHandler.TO_BIG_GUESS);
        }else if(e.getMessage().toUpperCase().contains("SMALL")){
            model.addAttribute(ErrorHandler.ERROR_TYPE_KEY, ErrorHandler.TO_SMALL_GUESS);
        }else if(e.getMessage().toUpperCase().contains("INTEGER")){
            model.addAttribute(ErrorHandler.ERROR_TYPE_KEY, ErrorHandler.GUESS_WRONG_FORMAT);
        }else if(e.getMessage().toUpperCase().contains("SERVING")){
            model.addAttribute(ErrorHandler.ERROR_TYPE_KEY, ErrorHandler.MISSING_SERVING_ORDER);
        }else if(e.getMessage().toUpperCase().contains("EMPTY")){
            model.addAttribute(ErrorHandler.ERROR_TYPE_KEY, ErrorHandler.EMPTY_GUESS);
        }else if(e.getMessage().toUpperCase().contains("RANGE")){
            model.addAttribute(ErrorHandler.ERROR_TYPE_KEY, ErrorHandler.WRONG_JUDGEMENT_RANGE);
        }else if(e.getMessage().toUpperCase().contains("SAME")){
            model.addAttribute(ErrorHandler.ERROR_TYPE_KEY, ErrorHandler.SERVING_ORDER_SAME);
        }else if(e.getMessage().toUpperCase().contains("ALREADY ENTERED")){
            model.addAttribute(ErrorHandler.ERROR_TYPE_KEY, ErrorHandler.SERVING_ORDER_ALREADY_EXIST);
        }else if(e.getMessage().toUpperCase().contains("SERVORDER BIG")){
            model.addAttribute(ErrorHandler.ERROR_TYPE_KEY, ErrorHandler.SERVING_ORDER_TO_BIG);
        }else if(e.getMessage().toUpperCase().contains("SERVORDER SMALL")){
            model.addAttribute(ErrorHandler.ERROR_TYPE_KEY, ErrorHandler.SERVING_ORDER_TO_SMALL);
        }else if(e.getMessage().toUpperCase().contains("SERVORDER NODATA")){
            model.addAttribute(ErrorHandler.ERROR_TYPE_KEY, ErrorHandler.SERVING_ORDER_NO_DATA);
        }else if(e.getMessage().toUpperCase().contains("PROFILE NOT")){
            model.addAttribute(ErrorHandler.ERROR_TYPE_KEY, ErrorHandler.NO_PROFILE_FOUND);
        } else if(e.getMessage().toUpperCase().contains("NOT A NUMBER")){
            model.addAttribute(ErrorHandler.ERROR_TYPE_KEY, ErrorHandler.NOT_A_NUM);
        }

    }

    @PostMapping(NUMBER_OF_WINES_PAGE_URL)
    public String enterNumberOfWines(@Valid @ModelAttribute NumberOfWinesForm numberOfWinesForm, BindingResult bindingResult, Model model, HttpServletRequest request){
        if(bindingResult.hasErrors()){
            return showNumberOfWinesPage(model);
        }
        gameSetupService.createGameSetup(numberOfWinesForm.getNumWines(), request.getUserPrincipal().getName());
        return showEnterUrlPage(model, request);
    }

    @PostMapping(ENTER_URL_PAGE_URL)
    public String enterUrlToWine(@Valid @ModelAttribute EnterUrlForm enterUrlForm, BindingResult bindingResult, Model model,
                                 HttpServletRequest request){
        if(bindingResult.hasErrors()){
            MissingDecData missingDecData = new MissingDecData();
            missingDecData.setMissing("notMissing");
            model.addAttribute(missingDecData);
            return showEnterUrlPage(model, request);
        }
        List<String> urlsThatMissDescriptions = null;
        try {
            urlsThatMissDescriptions = gameSettingsService.createGameSettings(enterUrlForm.getUrlList(), request.getUserPrincipal().getName());
        } catch (WineryException e) {
            MissingDecData missingDecData = new MissingDecData();
            missingDecData.setMissing("notMissing");
            model.addAttribute(missingDecData);
            controlErrorHandling(e, model);
            return showEnterUrlPage(model, request);
        }
        MissingDecData missingDecData = new MissingDecData();
        if(!urlsThatMissDescriptions.isEmpty()){
           missingDecData.setMissingList(urlsThatMissDescriptions);
           missingDecData.setMissing("missing");
           model.addAttribute(missingDecData);
           return showEnterUrlPage(model, request);
        }
        return showEnterRegionPage(model, request);
    }

    @PostMapping(MENU_PAGE_URL)
    public String joinExistingGameLobby(@Valid @ModelAttribute JoinGameLobbyForm joinGameLobbyForm, BindingResult bindingResult, HttpServletRequest request, Model model){
        if(bindingResult.hasErrors()){
            return showMenuPage(model, request);
        }
        try {
            lobbyService.checkAuthorizationByGameId(joinGameLobbyForm.getJoinCode());
        } catch (AuthorizationException e) {
            controlErrorHandling(e, model);
            return showMenuPage(model, request);
        }
        gameSettingsService.removeGameSettingsIfGameIdDontMatch(request.getUserPrincipal().getName(), joinGameLobbyForm.getJoinCode());
        lobbyDataService.addParticipant(request.getUserPrincipal().getName(), joinGameLobbyForm.getJoinCode());
        userService.setActiveGameForUser(request.getUserPrincipal().getName(), joinGameLobbyForm.getJoinCode());
        lobbyDataService.setNotReadyForParticipant(request.getUserPrincipal().getName());
        return showLobbyPage(model, request, joinGameLobbyForm.getJoinCode());
    }

}
