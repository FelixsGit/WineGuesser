package toppar.wine_guesser.presentation.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import toppar.wine_guesser.application.*;
import toppar.wine_guesser.domain.AuthorizationException;
import toppar.wine_guesser.domain.GameSetupDTO;
import toppar.wine_guesser.domain.UserException;
import toppar.wine_guesser.presentation.err.ErrorHandler;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

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

    public static final String REGISTER_OBJ_NAME = "registerForm";
    public static final String LOBBY_OBJ_NAME = "lobbyForm";
    public static final String LOGIN_OBJ_NAME = "loginForm";
    public static final String JOIN_GAME_LOBBY_OBJ_NAME = "joinGameLobbyForm";
    public static final String ENTER_URL_OBJ_NAME = "enterUrlForm";
    public static final String NUMBER_OF_WINES_OBJ_NAME = "numberOfWinesForm";
    public static final String PRINT_QR_CODES_OBJ_NAME = "printQrCodesForm";
    public static final String QR_OPTION_OBJ_NAME = "qrOptionForm";
    public static final String SERVING_ORDER_OBJ_NAME = "servingOrderForm";


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

    @GetMapping("generateLobby"+"/{gameId}")
    public String generateLobby(HttpServletRequest request, @PathVariable("gameId") String gameId){
        try {
            gameSettingsService.checkForAuthority(request.getUserPrincipal().getName());
        } catch (AuthorizationException e) {
            //controlErrorHandling(e, model);
            return MENU_PAGE_URL;
        }
        lobbyDataService.openNewLobby(request.getUserPrincipal().getName(), gameId);
        userService.setActiveGameForUser(request.getUserPrincipal().getName(), gameId);
        return LOBBY_PAGE_URL;
    }


    @GetMapping(LOBBY_PAGE_URL+"/{gameId}")
    public String showLobbyPage(Model model, @PathVariable("gameId") String gameId){
        if(!model.containsAttribute(LOBBY_OBJ_NAME)){
            model.addAttribute(LOBBY_OBJ_NAME);
        }
        try {
            lobbyService.checkAuthorizationByGameId(gameId);
        } catch (AuthorizationException e) {
            controlErrorHandling(e, model);
            return MENU_PAGE_URL;
        }
        System.out.println("joined lobby bitch");
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


    @GetMapping(MENU_PAGE_URL)
    public String showMenuPage(Model model){
        if(!model.containsAttribute(JOIN_GAME_LOBBY_OBJ_NAME)){
            model.addAttribute(new JoinGameLobbyForm());
        }
        model.addAttribute(new JoinGameLobbyForm());
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
        List<String> urlsThatMissDescriptions = gameSettingsService.createGameSettings(enterUrlForm.getUrlList(), request.getUserPrincipal().getName());
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
            return showMenuPage(model);
        }
        try {
            lobbyService.checkAuthorizationByGameId(joinGameLobbyForm.getJoinCode());
        } catch (AuthorizationException e) {
            controlErrorHandling(e, model);
            showMenuPage(model);
        }
        lobbyDataService.addParticipant(request.getUserPrincipal().getName(), joinGameLobbyForm.getJoinCode());
        return showLobbyPage(model, joinGameLobbyForm.getJoinCode());
    }

}
