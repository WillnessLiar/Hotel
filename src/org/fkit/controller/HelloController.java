package org.fkit.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller()
public class HelloController {

    @RequestMapping(value="index.html")
    public ModelAndView index(){
        ModelAndView modelAndView =new ModelAndView("index");
        //modelAndView.setViewName("index");

        modelAndView.addObject("Hello Spring!");

        return modelAndView;
    }
}
