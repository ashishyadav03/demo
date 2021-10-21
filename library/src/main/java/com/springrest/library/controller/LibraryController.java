package com.springrest.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.springrest.library.model.Authors;
import com.springrest.library.model.Books;
import com.springrest.library.model.Login;
import com.springrest.library.services.AuthorsServices;
import com.springrest.library.services.BooksServices;
import com.springrest.library.services.LoginServices;

@Controller
public class LibraryController {

	@Autowired
	private LoginServices loginServices;

	@Autowired
	private BooksServices booksServices;

	@Autowired
	private AuthorsServices authorsServices;

	@RequestMapping("/")
	public String Home(HttpServletRequest req) {	
		 

		return "home";
	}

	@RequestMapping("/login")
	public String checkUser(@ModelAttribute Login login,Model model,HttpSession session) {
 		if(session.getAttribute("user")==null) {
			String check = loginServices.getUserById(login);
			if(check=="true") {
				model.addAttribute("booklist",booksServices.getAllBooks());
 				session.setAttribute("user", login);
				return "bookManagement";
			}
			else {
				return "redirect:/";
			}
		}
		else {
			model.addAttribute("booklist",booksServices.getAllBooks());
			return "bookManagement";

		}
	}

	@GetMapping("/showNewBookForm")
	public ModelAndView showNewBookForm(Model model) {
		ModelAndView mav=null; 
		mav=new ModelAndView("addBooks");
		List<Authors> authorsList = authorList();
		model.addAttribute("authorsList", authorsList);
		return mav;
	}

	@PostMapping("/saveBook")
	public String savebook(@ModelAttribute Books book) {
		booksServices.saveBooks(book);
		 
		return "redirect:login";
	}

	@RequestMapping("/change")
	public String change(@RequestParam String modify,@RequestParam String code,Model model) {
		long bookCode = Long.parseLong(code);
		if(modify.equals("update")) {
			Books book = booksServices.getBookById(bookCode);
			List<Authors> authorsList = authorList();
			model.addAttribute("authorsList", authorsList);
			model.addAttribute("book", book);
			return "updateBook";
		}
		else {
			this.booksServices.deleteBookById(bookCode);
			return "redirect:login";
		}
	}


	public List<Authors> authorList() {
		List<Authors> authorsList = authorsServices.getAllAuthors();
		return authorsList;
	}
	
	@RequestMapping("/back")
	public String back() {
		return "redirect:login";
	}

	@RequestMapping("/logout")
	public String logout(HttpServletRequest req,HttpServletResponse res) {
		HttpSession session = req.getSession();
		session.removeAttribute("username");
		session.invalidate();
 		return "redirect:/";		}
}
