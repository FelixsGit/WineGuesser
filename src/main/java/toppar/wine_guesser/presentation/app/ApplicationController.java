package toppar.wine_guesser.presentation.app;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import toppar.wine_guesser.application.QRCodeListDTO;
import toppar.wine_guesser.application.ZXingHelper;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

@Controller
public class ApplicationController {

    public static final String DEFAULT_PAGE_URL = "/";
    public static final String HOME_PAGE_URL = "/home";
    public static final String ENTER_URL_PAGE_URL = "/enterUrl";
    public static final String LOBBY_PAGE_URL = "/lobby";

    public static final String JOIN_GAME_LOBBY_OBJ_NAME = "joinGameLobbyForm";
    public static final String ENTER_URL_OBJ_NAME = "enterUrlForm";
    public static final String PATH_TO_QR_CODE_OBJ_NAME = "pathToQRCode";


    //////////////////////////////////////GET MAPPINGS/////////////////////////////////////////////////////
    private QRCodeListDTO qrCodeListDTO;

    @GetMapping(DEFAULT_PAGE_URL)
    public String showDefaultPage() {
        return "redirect:" + HOME_PAGE_URL;
    }

    @GetMapping(HOME_PAGE_URL)
    public String showHomeView(Model model){
        List<String> qrCodeList = new ArrayList<>();
        qrCodeListDTO = new QRCodeListDTO(qrCodeList);
        if(!model.containsAttribute(JOIN_GAME_LOBBY_OBJ_NAME)){
            model.addAttribute(new JoinGameLobbyForm());
        }
        return HOME_PAGE_URL;
    }

    @GetMapping(ENTER_URL_PAGE_URL)
    public String showEnterUrlView(Model model){
        if(!model.containsAttribute(ENTER_URL_OBJ_NAME)){
            model.addAttribute(new EnterUrlForm());
            model.addAttribute(new PathToQRCode());
        }
        return ENTER_URL_PAGE_URL;
    }

    @GetMapping(LOBBY_PAGE_URL)
    public String showLobbyView(Model model){
        return LOBBY_PAGE_URL;
    }

    //////////////////////////////////////POST MAPPINGS/////////////////////////////////////////////////////

    @PostMapping(ENTER_URL_PAGE_URL)
    public String enterUrlToWine(@Valid @ModelAttribute EnterUrlForm enterUrlForm, @Valid @ModelAttribute PathToQRCode pathToQRCode, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){
            return showEnterUrlView(model);
        }
        String image = ZXingHelper.getQRCodeImage(enterUrlForm.getWineUrl(), 160, 160);
        qrCodeListDTO.addQRCodeToList(image);
        pathToQRCode.setQrCodeList(qrCodeListDTO.getQrCodeList());
        pathToQRCode.setByteAsString(image);
        model.addAttribute("pathToQRCode", pathToQRCode);
        return showEnterUrlView(model);
    }

    @PostMapping(HOME_PAGE_URL)
    public String joinExistingGameLobby(@Valid @ModelAttribute JoinGameLobbyForm joinGameLobbyForm, BindingResult bindingResult, Model model){
        if(bindingResult.hasErrors()){
            return showHomeView(model);
        }
        return showLobbyView(model);
    }

}
