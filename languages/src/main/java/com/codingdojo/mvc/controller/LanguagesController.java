package com.codingdojo.mvc.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.codingdojo.mvc.models.Languages;
import com.codingdojo.mvc.services.LanguagesService;



@Controller
public class LanguagesController {

	
	//dependency injection 
		@Autowired
		LanguagesService languagesService;
		
	//create the Language
	@RequestMapping("/languages")
	public String newLang(@ModelAttribute("languages") Languages languages) {
		
		return "index.jsp";
	}
	
	@RequestMapping(value="/languages", method=RequestMethod.POST)
    public String create(@Valid @ModelAttribute("languages") Languages languages, BindingResult result) {  // for Error checking i use @valid 
        if (result.hasErrors()) {
           return "index.jsp";
        } else {
        	languagesService.createLanguages(languages);
            return "redirect:/languages/all";
        }
    }
	
	//rendering information of the all Languages in table
	@RequestMapping("/languages/all")
	public String allLanguages(Model model) {
		List<Languages> allLang=languagesService.getAllLanguages();
		model.addAttribute("allLang", allLang);
		return "index.jsp";
	}
	
//	rendering information in separate page 
	@RequestMapping("/languages/{id}")
	public String lang(Model model,@PathVariable("id") Long id) {
		Languages lang=languagesService.findLanguages(id);
		model.addAttribute("lang", lang);
		return "lang.jsp";
	}
	
	
	//edit
		@RequestMapping("/languages/{id}/edit")
	    public String edit(@PathVariable("id") Long id, Model model) {
			Languages lang = languagesService.findLanguages(id);
	        model.addAttribute("lang", lang);
	        return "edit.jsp";
	    }
	    //updating
	    @RequestMapping(value="/languages/{id}/edit", method=RequestMethod.PUT)
	    public String update(@PathVariable("id") Long id,@Valid @ModelAttribute("languages") Languages languages, BindingResult result) {
	        if (result.hasErrors()) {
	            return "edit.jsp";
	        } else {
	        	languagesService.updateLanguages(id, languages);
	            return "redirect:/languages/all";
	        }
	    }
	     //delete
	    
	    @RequestMapping(value="/languages/{id}/delete")
	    public String destroy(@PathVariable("id") Long id) {
	    	languagesService.deleteLanguages(id);
	        return "redirect:/languages/all";
	    }
	    
	
	
	
	
}
