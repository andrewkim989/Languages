package com.andrewkim.languages.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.andrewkim.languages.models.Language;
import com.andrewkim.languages.services.LanguageService;

@Controller
public class LanguageController {
	private final LanguageService languageService;
	
	public LanguageController(LanguageService languageService) {
        this.languageService = languageService;
    }
	
	@RequestMapping("/languages")
	public String table (Model model) {
        List<Language> languages = languageService.allLanguages();
        model.addAttribute("languages", languages);
        return "/home.jsp";
    }
	
	@RequestMapping("/languages/new")
	public String index (@ModelAttribute("language") Language language) {
        return "/new.jsp";
    }
	
	@RequestMapping(value = "/languages/create", method = RequestMethod.POST)
    public String create (@Valid @ModelAttribute("language") Language language, BindingResult result) {
        if (result.hasErrors()) {
            return "/new.jsp";
        }
        else {
            languageService.createLanguage(language);
            return "redirect:/languages";
        }
    }
	
	@RequestMapping("/languages/{id}")
    public String show (@PathVariable("id") Long id, HttpSession session) {
    	Language languages = languageService.findLanguage(id);
    	session.setAttribute("languages", languages);
        return "language.jsp";
    }
	
	@RequestMapping("/languages/{id}/edit")
    public String edit(@PathVariable("id") Long id, Model model) {
		Language languages = languageService.findLanguage(id);
        model.addAttribute("languages", languages);
        return "edit.jsp";
    }
	
	@RequestMapping(value = "/languages/{id}/edit/process", method = RequestMethod.PUT)
    public String update(@Valid @PathVariable("id") Long id,
    		@ModelAttribute("language") Language languages, BindingResult result) {
        if (result.hasErrors()) {
            return "redirect:/languages/edit/{id}";
        }
        else {
            languageService.updateLanguage(languages);
            return "redirect:/languages";
        }
    }
	
	@RequestMapping(value = "/languages/{id}/delete", method = RequestMethod.DELETE)
    public String destroy(@PathVariable("id") Long id) {
        languageService.deleteLanguage(id);
        return "redirect:/languages";
    }
}
