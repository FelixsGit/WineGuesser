package toppar.wine_guesser.presentation.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import toppar.wine_guesser.application.GameSettingsService;
import toppar.wine_guesser.application.GameSetupService;
import toppar.wine_guesser.domain.GameSetupDTO;
import toppar.wine_guesser.application.UserService;

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

    public static final String REGISTER_OBJ_NAME = "registerForm";
    public static final String LOGIN_OBJ_NAME = "login";
    public static final String JOIN_GAME_LOBBY_OBJ_NAME = "joinGameLobbyForm";
    public static final String ENTER_URL_OBJ_NAME = "enterUrlForm";
    public static final String NUMBER_OF_WINES_OBJ_NAME = "numberOfWines";
    public static final String PRINT_QR_CODES_OBJ_NAME = "printQrCodesForm";


    //////////////////////////////////////GET MAPPINGS/////////////////////////////////////////////////////

    @Autowired
    private UserService userService;
    @Autowired
    private GameSetupService gameSetupService;
    @Autowired
    private GameSettingsService gameSettingsService;

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
    public String showMenuView(Model model){
        if(!model.containsAttribute(JOIN_GAME_LOBBY_OBJ_NAME)){
            model.addAttribute(new JoinGameLobbyForm());
        }
        return MENU_PAGE_URL;
    }

    @GetMapping(ENTER_URL_PAGE_URL)
    public String showEnterUrlView(Model model, HttpServletRequest request){
        if(!model.containsAttribute(ENTER_URL_OBJ_NAME) && !model.containsAttribute("missingDecData")){
            model.addAttribute(new EnterUrlForm());
            model.addAttribute(new MissingDecData());
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

    @GetMapping(LOBBY_PAGE_URL)
    public String showLobbyView(Model model){
        return LOBBY_PAGE_URL;
    }

    //////////////////////////////////////POST MAPPINGS/////////////////////////////////////////////////////

    @PostMapping(REGISTER_PAGE_URL)
    public String registerNewUser(@Valid @ModelAttribute RegisterForm registerForm, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){
            return showRegisterPage(model);
        }
        userService.createUser(registerForm.getUsername(), registerForm.getPassword());
        return showLoginPage(model);
    }

    @PostMapping(NUMBER_OF_WINES_PAGE_URL)
    public String enterNumberOfWines(@Valid @ModelAttribute NumberOfWinesForm numberOfWinesForm, BindingResult bindingResult, Model model, HttpServletRequest request){
        if(bindingResult.hasErrors()){
            return showNumberOfWinesPage(model);
        }
        gameSetupService.createGameSetup(numberOfWinesForm.getNumberOfWines(), request.getUserPrincipal().getName());
        return showEnterUrlView(model, request);
    }

    @PostMapping(ENTER_URL_PAGE_URL)
    public String enterUrlToWine(@Valid @ModelAttribute EnterUrlForm enterUrlForm, BindingResult bindingResult, Model model,
                                 HttpServletRequest request){
        if(bindingResult.hasErrors()){
            return showEnterUrlView(model, request);
        }
        List<String> urlsThatMissDescriptions = gameSettingsService.createGameSettings(enterUrlForm.getUrlList(), request.getUserPrincipal().getName());
        MissingDecData missingDecData = new MissingDecData();
        if(!urlsThatMissDescriptions.isEmpty()){
           missingDecData.setMissingList(urlsThatMissDescriptions);
           missingDecData.setMissing("missing");
           model.addAttribute(missingDecData);
           return showEnterUrlView(model, request);
        }
        return showPrintQrCodesPage(model, request);
    }

    @PostMapping(HOME_PAGE_URL)
    public String joinExistingGameLobby(@Valid @ModelAttribute JoinGameLobbyForm joinGameLobbyForm, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){
            return showMenuView(model);
        }
        return showLobbyView(model);
    }

}
