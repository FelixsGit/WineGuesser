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


    @MessageMapping("/chat.regularComs/{gameId}")
    @SendTo("/topic/{gameId}")
    public ChatMessage regularComs(@DestinationVariable String gameId, @Payload ChatMessage chatMessage) {
        printChatMessage(chatMessage);
        //System.out.println("Sending message to: /topic/"+gameId);
        if(chatMessage.getType().equals(ChatMessage.MessageType.READY)){
            lobbyDataService.setReadyForParticipant(chatMessage.getSender());
            if(lobbyDataService.checkIfAllParticipantsAreReady(gameId)){
                chatMessage.setContent("ALLREADY");
            }
        }else if(chatMessage.getType().equals(ChatMessage.MessageType.LEAVE)){
            lobbyDataService.setNotReadyForParticipant(chatMessage.getSender());
            chatMessage.setType(ChatMessage.MessageType.LEAVE);
        }
        return chatMessage;
    }

    @GetMapping("/about")
    public String showAboutPage(){
        return "/about";
    }

    private void printChatMessage(ChatMessage chatMessage){
        System.out.println();
        System.out.println("Server received message");
        System.out.println("{sender: " + chatMessage.getSender());
        System.out.println("content: " + chatMessage.getContent());
        System.out.println("gameId: " + chatMessage.getGameId());
        System.out.println("type: " + chatMessage.getType() + "}");
    }

    @MessageMapping("/chat.determineSocketId")
    @SendTo("/topic/public")
    public ChatMessage determineSocketId(@Payload ChatMessage chatMessage, SimpMessageHeaderAccessor headerAccessor) {
        //System.out.println();
        System.out.println("Server first contact with user");
        //System.out.println("Sending message to: /topic/public");
        //Objects.requireNonNull(headerAccessor.getSessionAttributes()).put("username", chatMessage.getSender());
        chatMessage.setContent(Objects.requireNonNull(headerAccessor.getUser()).getName());
        chatMessage.setType(ChatMessage.MessageType.SETUP);
        chatMessage.setGameId(userService.getActiveGame(Objects.requireNonNull(headerAccessor.getUser()).getName()));
        return chatMessage;
    }


    @GetMapping("gameBoard"+"/{gameId}")
    public String showGameBoardPage(Model model, GameBoardForm gameBoardForm, @PathVariable("gameId") String gameId, HttpServletRequest request){
        if(model.containsAttribute(GAME_BOARD_OBJ_NAME)){
            model.addAttribute(GAME_BOARD_OBJ_NAME);
        }
        if(lobbyDataService.checkIfParticipantIsDone(request.getUserPrincipal().getName())){
            gameBoardForm.setPlayerDone("true");
            gameBoardForm.setParticipantsDone(lobbyDataService.getUsersDoneByGameId(gameId));
            gameBoardForm.setParticipantsNotDone(lobbyDataService.getUsersNotDoneByGameId(gameId));
            gameBoardForm.setGuessNum(userGuessesService.getServingOrderGuessesByUsername(request.getUserPrincipal().getName()));
            gameBoardForm.setDescriptions(userGuessesService.getDescriptionGuessesByUsername(request.getUserPrincipal().getName()));
        }else{
            lobbyService.startGameLobbyByGameId(gameId);
        }
        gameBoardForm.setDescriptions(gameSettingsService.getDescriptionsByGameId(gameId));
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
        if(lobbyDataService.isGameHost(request.getUserPrincipal().getName())){
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
            if(lobbyDataService.isGameHost(request.getUserPrincipal().getName())){
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
        return "redirect:" + MENU_PAGE_URL;
    }


    @GetMapping(MENU_PAGE_URL)
    public String showMenuPage(Model model, HttpServletRequest request){
        if(!model.containsAttribute(JOIN_GAME_LOBBY_OBJ_NAME)){
            model.addAttribute(new JoinGameLobbyForm());
        }
        //check if user have activeGame, if so dont show option to make new game, or option to join game. Instead ask them to press a button to join the game lobby.
        String username = userService.getActiveGame(request.getUserPrincipal().getName());
        if(username != null){
            JoinGameLobbyForm joinGameLobbyForm = new JoinGameLobbyForm();
            String gameStatus = userService.getGameStatusByUsername(request.getUserPrincipal().getName());
            if(gameStatus.equals("started")){
                joinGameLobbyForm.setGameStatus("started");
            }
            joinGameLobbyForm.setActiveGame(username);
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
    public String lockInResults(@ModelAttribute GameBoardForm gameBoardForm, Model model, BindingResult bindingResult, HttpServletRequest request){
        if (bindingResult.hasErrors()) {
            return showGameBoardPage(model, gameBoardForm, gameBoardForm.getGameId(), request);
        }
        userGuessesService.saveUserGuesses(request.getUserPrincipal().getName(), gameBoardForm.getGameId(), gameBoardForm.getDescriptions(), gameBoardForm.getGuessNum());
        lobbyDataService.setDoneTrueForParticipant(request.getUserPrincipal().getName());
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
