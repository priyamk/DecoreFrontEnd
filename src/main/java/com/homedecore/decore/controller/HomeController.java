package com.homedecore.decore.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	
	
	
	
	@RequestMapping("/welcome")
    public String adminhome(Model model){
		
		model.addAttribute("msg","hello");
        return "adminHome";
    }
	


    @RequestMapping(value="/login" , method=RequestMethod.GET)
    public String login(
            @RequestParam(value="error", required = false)
            String error,
            @RequestParam(value="logout", required = false)
            String logout,@RequestParam(value="login", required = false)
            String login,
            Model model){

        if(error != null){
            model.addAttribute("error", "Invalid username and password");
        }

        if (logout !=null){
            model.addAttribute("logoutMsg", "You have been logged out successfully");
            model.addAttribute("isLogoutClicked", "TRUE");
        }
        model.addAttribute("isLoginClicked", "TRUE");
     
        
        return "userHome";
    }
    
    

}
