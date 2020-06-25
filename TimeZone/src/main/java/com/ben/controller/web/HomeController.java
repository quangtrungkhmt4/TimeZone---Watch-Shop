package com.ben.controller.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller(value = "homeControllerForWeb")
public class HomeController {
    @RequestMapping(value = "/home", method = RequestMethod.GET)
    public ModelAndView homePage() {
        ModelAndView modelAndView = new ModelAndView("web/home");
//        modelAndView.addObject("newProducts"
//                , productService.getTheNewest(THE_NEWEST_NUMBER));
//        modelAndView.addObject("reviewers", reviewerService.getAll());
        return modelAndView;
    }
}
