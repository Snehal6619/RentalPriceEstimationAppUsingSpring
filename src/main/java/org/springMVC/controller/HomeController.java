package org.springMVC.controller;

import org.springMVC.model.User;
import org.springMVC.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {
	
	@Autowired
	UserServiceImpl userService;

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
    
    @ResponseBody
    @PostMapping("/register")
    public String register(@RequestBody User user)
    {
     return userService.regUser(user);
    }
    
	 @ResponseBody
	 @PostMapping("/login") 
	 public String login(@RequestBody User user,HttpSession session) 
	 { 
		 return userService.loginUser(user,session);
	}
	 
}
//http://localhost:7000/SpringSecurityLoginApp/