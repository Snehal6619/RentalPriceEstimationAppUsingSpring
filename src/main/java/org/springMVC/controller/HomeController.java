package org.springMVC.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

    @GetMapping("/")
    public String ind() {
        return "index";
    }
    
    @RequestMapping("/home")
    public String home()
    {
    	return "index";
    }
    @RequestMapping("/about")
    public String about()
    {
    	return "about";
    }
    @RequestMapping("/contact")
    public String contact()
    {
    	return "contact";
    }
    @RequestMapping("/reg")
    public String reg()
    {
    	return "register";
    }
    @RequestMapping("/lg")
    public String lg()
    {
    	return "login";
    }
    
    
}