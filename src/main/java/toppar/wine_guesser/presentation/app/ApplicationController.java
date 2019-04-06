package toppar.wine_guesser.presentation.app;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import toppar.wine_guesser.application.PlayerService;

@Controller
public class ApplicationController {

    @Autowired
    PlayerService playerService;

    @GetMapping("/")
    public String getHome() {
        return "home";
    }

}
