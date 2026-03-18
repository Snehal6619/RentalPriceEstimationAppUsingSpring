package org.springMVC.controller;


import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springMVC.model.User;
import org.springMVC.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	UserService userService;

	@RequestMapping("/userDashboard")
    public String dashboard(HttpSession session,Model model)
    {
    	String userName=(String) session.getAttribute("un");
    	if(userName==null)
    	{
    		return "redirect:/";
    	}
    	model.addAttribute(userName, userName);
        return "userDashboard";
    }
 
	 @GetMapping("/states")
	 @ResponseBody
	    public List<Map<String, Object>> getStates() {
	        return userService.getStates();
	    }

	    @GetMapping("/cities/{statecode}")
	    @ResponseBody
	    public List<Map<String, Object>> getCities(@PathVariable("statecode") int statecode) {
	        return userService.getCities(statecode);
	    }

	    @GetMapping("/locations/{cid}")
	    @ResponseBody
	    public List<Map<String, Object>> getLocations(@PathVariable ("cid") int cid) {
	        return userService.getLocations(cid);
	    }
	    
	    @PostMapping("/saveProperty")
	    @ResponseBody
	    public String save(@RequestBody Map<String,Object> data){
	    userService.saveProperty(data);
	    return "saved";
	    }
	    
	  //logout 
	  		@GetMapping("/logout")
	  		public String logout(HttpSession session)
	  		{
	  		    session.invalidate(); // session destroy
	  		    return "redirect:/lg"; // login page
	  		}
}


//http://localhost:7000/SpringSecurityLoginApp/user/
 //http://localhost:7000/SpringSecurityLoginApp/user/reg
 