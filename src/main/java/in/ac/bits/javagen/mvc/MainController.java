package in.ac.bits.javagen.mvc;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/")
public class MainController {

    @RequestMapping
    public ModelAndView home() {
        ModelAndView mav = new ModelAndView("home");
        return mav;
    }

}
