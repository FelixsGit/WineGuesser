package toppar.wine_guesser.presentation.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import toppar.wine_guesser.application.*;
import toppar.wine_guesser.domain.*;
import toppar.wine_guesser.presentation.err.ErrorHandler;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import javax.websocket.server.HandshakeRequest;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

@Controller
public class ApplicationController {

    public static final String DEFAULT_PAGE_URL = "/";
    public static final String HOME_PAGE_URL = "/home";
    public static final String MENU_PAGE_URL = "/menu";
    public static final String ENTER_URL_PAGE_URL = "/enterUrl";
    public static final String LOBBY_PAGE_URL = "/lobby";
    public static final String LOGIN_PAGE_URL = "/login";
    public static final String REGISTER_PAGE_URL = "/register";
    public static final String NUMBER_OF_WINES_PAGE_URL = "/numberOfWines";
    public static final String PRINT_QR_CODES_PAGE_URL = "/printQrCodes";
    public static final String QR_OPTION_PAGE_URL = "/QR/wine/qrOption";
    public static final String GAME_BOARD_PAGE_URL = "/gameBoard";
    public static final String GAME_RESULTS_PAGE_URL = "/gameResults";

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
    public static final String GAME_RESULTS_OBJ_NAME = "gameResultsForm";


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


    @GetMapping("gameResults"+"/{gameId}")
    public String showGameResultsPage(Model model, @PathVariable("gameId") String gameId, HttpServletRequest request){
        if(!model.containsAttribute(GAME_RESULTS_OBJ_NAME)){
            model.addAttribute(GAME_RESULTS_OBJ_NAME);
        }
        GameResultsForm gameResultsForm = new GameResultsForm();
        if(gameResultService.checkIfNewFinishedGame(gameId)){
            gameResultsForm.setGameStats(gameResultService.retrieveGameStatsForGameWithIdAndUsername(gameId, request.getUserPrincipal().getName()));
        }else{
            lobbyService.setGameStartToFinished(gameId);
            gameResultsForm.setGameStats(gameResultService.generateGameStatsForGameWithId(gameId, request.getUserPrincipal().getName()));
        }
        model.addAttribute(gameResultsForm);
        return GAME_RESULTS_PAGE_URL;
    }




    @MessageMapping("/chat.regularComs/{gameId}")
    @SendTo("/topic/{gameId}")
    public ChatMessage regularComs(@DestinationVariable String gameId, @Payload ChatMessage chatMessage, SimpMessageHeaderAccessor headerAccessor) {
        //printChatMessage(chatMessage, "res");
        if(chatMessage.getType().equals(ChatMessage.MessageType.READY)){
            lobbyDataService.setReadyForParticipant(chatMessage.getSender());
            if(lobbyDataService.checkIfAllParticipantsAreReady(gameId)){
                chatMessage.setContent("ALLREADY");
            }
        }else if(chatMessage.getType().equals(ChatMessage.MessageType.LEAVE)){
            lobbyDataService.setNotReadyForParticipant(chatMessage.getSender());
            chatMessage.setType(ChatMessage.MessageType.LEAVE);
        }else if(chatMessage.getType().equals(ChatMessage.MessageType.DONE)){
            if(chatMessage.getSender().equals(Objects.requireNonNull(headerAccessor.getUser()).getName())){
                lobbyDataService.setDoneTrueForParticipant(chatMessage.getSender());
            }
            if(lobbyDataService.checkIfAllParticipantsAreDone(gameId)){
                chatMessage.setContent("ALLDONE");
            }
        }
        //printChatMessage(chatMessage, "send");
        return chatMessage;
    }

    @GetMapping("/about")
    public String showAboutPage(){
        return "/about";
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
    public String showGameBoardPage(Model model, GameBoardForm gameBoardForm, @PathVariable("gameId") String gameId, HttpServletRequest request){
        if(!model.containsAttribute(GAME_BOARD_OBJ_NAME)){
            model.addAttribute(GAME_BOARD_OBJ_NAME);
        }
        if(lobbyDataService.checkIfParticipantIsDone(request.getUserPrincipal().getName())){
            gameBoardForm.setPlayerDone("true");
            gameBoardForm.setParticipantsDone(lobbyDataService.getUsersDoneByGameId(gameId));
            gameBoardForm.setParticipantsNotDone(lobbyDataService.getUsersNotDoneByGameId(gameId));
            gameBoardForm.setGuessNum(userGuessesService.getServingOrderGuessesByUsername(request.getUserPrincipal().getName()));
            gameBoardForm.setDescriptions(userGuessesService.getDescriptionGuessesByUsername(request.getUserPrincipal().getName()));
            if(lobbyDataService.checkIfAllParticipantsAreDone(gameId)){
                gameBoardForm.setAllDone("true");
            }
        }else{
            gameBoardForm.setDescriptions(gameSettingsService.getDescriptionsByGameId(gameId));
            if(gameBoardForm.getWineToRate() == 1){
                lobbyService.startGameLobbyByGameId(gameId);
            }
        }
        if(lobbyDataService.isGameHost(request.getUserPrincipal().getName(), gameId)){
            gameBoardForm.setGameHost(request.getUserPrincipal().getName());
        }

        if(gameBoardForm.getWineToRate() == 0){
            gameBoardForm.setWineToRate(1);
        }
        gameBoardForm.setGameId(gameId);
        model.addAttribute(gameBoardForm);
        return GAME_BOARD_PAGE_URL;
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

    @GetMapping("/QR/wine/{id}")
    public String showQrOptionPage(Model model, @PathVariable("id") String id){
        if(!model.containsAttribute(QR_OPTION_OBJ_NAME) || !model.containsAttribute(SERVING_ORDER_OBJ_NAME)){
            QrOptionForm qrOptionForm = new QrOptionForm();
            qrOptionForm.setId(id);
            model.addAttribute(qrOptionForm);
        }
        QrOptionForm qrOptionForm = new QrOptionForm();
        qrOptionForm.setId(id);
        String url = gameSettingsService.getUrlFromWineId(id);
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
    public String lobbyCommandRedirect(@PathVariable("action") String action, @PathVariable String gameId, HttpServletRequest request) {
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
        return "redirect:" + MENU_PAGE_URL;
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
            /**
             * TODO
             * Add gameStatus 'completed' to be able to go back and view history even after the game is finished.
             */
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
        model.addAttribute(enterUrlForm);
        return ENTER_URL_PAGE_URL;
    }


    //////////////////////////////////////POST MAPPINGS/////////////////////////////////////////////////////

    @PostMapping(GAME_BOARD_PAGE_URL)
    public String lockInResultsOrGrade(@Valid @ModelAttribute GameBoardForm gameBoardForm, Model model, BindingResult bindingResult, HttpServletRequest request){
        if (bindingResult.hasErrors()) {
            return showGameBoardPage(model, gameBoardForm, gameBoardForm.getGameId(), request);
        }
        if(gameBoardForm.getDoneRating() != null){
            userGuessesService.saveUserGuesses(request.getUserPrincipal().getName(), gameBoardForm.getGameId(), gameBoardForm.getDescriptions(), gameBoardForm.getGuessNum());
        }else{
            int numberOfWines = gameSettingsService.getAllByGameId(gameBoardForm.getGameId()).size();
            System.out.println("serving wine " + gameBoardForm.getWineToRate() + " got a rate of "+ gameBoardForm.getWineRating() + " from "+ request.getUserPrincipal().getName());
            if((gameBoardForm.getWineToRate() < numberOfWines) && gameBoardForm.getDoneRating() == null){
                gameBoardForm.setWineToRate(gameBoardForm.getWineToRate() + 1);
            }else if((gameBoardForm.getWineToRate() == numberOfWines) && gameBoardForm.getDoneRating() == null){
                gameBoardForm.setDoneRating("true");
            }
        }
        return showGameBoardPage(model, gameBoardForm, gameBoardForm.getGameId(), request);
    }

    @PostMapping(QR_OPTION_PAGE_URL)
    public String enterServingOrder(@Valid @ModelAttribute QrOptionForm qrOptionForm, Model model, BindingResult bindingResult){
        if(bindingResult.hasErrors()){
            return showQrOptionPage(model, qrOptionForm.getId());
        }
        gameSettingsService.setServingOrderByWineId(qrOptionForm.getId(), qrOptionForm.getOrderNum());
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
        return showPrintQrCodesPage(model, request);
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
        lobbyDataService.addParticipant(request.getUserPrincipal().getName(), joinGameLobbyForm.getJoinCode());
        userService.setActiveGameForUser(request.getUserPrincipal().getName(), joinGameLobbyForm.getJoinCode());
        lobbyDataService.setNotReadyForParticipant(request.getUserPrincipal().getName());
        return showLobbyPage(model, request, joinGameLobbyForm.getJoinCode());
    }

}
