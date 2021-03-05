package kr.ac.hansung.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.hansung.model.Post;
import kr.ac.hansung.service.PostService;


@Controller
public class PostController {
	
	@Autowired
	private PostService postService;
	
	@RequestMapping(value = "/community", method = RequestMethod.GET)
	public String community(Model model) {
		
		List<Post> posts = postService.getCurrent();
		model.addAttribute("posts", posts);
		
		model.addAttribute("page", 1);
		
		return "community";
	}
	
	@RequestMapping(value = "/community/*", method = RequestMethod.GET)
	public String communityPage(Model model, HttpServletRequest request) {
		
		List<Post> posts = postService.getCurrent();
		model.addAttribute("posts", posts);
		
		String[] url = request.getRequestURI().split("/");
		int page = Integer.parseInt(url[3]);
		model.addAttribute("page", page);
		
		return "community";
	}
	
	@RequestMapping(value = "/post/*", method = RequestMethod.GET)
	public String communityPost(Model model, HttpServletRequest request) {
		String[] url = request.getRequestURI().split("/");
		int postNo = Integer.parseInt(url[3]);
		
		Post post = postService.getPost(postNo);
		model.addAttribute("post", post);
		
		return "communityPost";
	}
	
	@RequestMapping(value = "/communityPostMake", method = RequestMethod.GET)
	public String makePost(Model model) {
		model.addAttribute("post", new Post());
		
		return "communityPostMake";
	}
	
	@RequestMapping(value = "/domakepost")
	public String doMakePost(Model model, @ModelAttribute("post") @Valid Post post, BindingResult result) {
		
		// utf-8로 인코딩하여 한글깨짐 문제 해결
		try {
			post.setTitle(new String(post.getTitle().getBytes("8859_1"), "utf-8"));
			post.setAuthor(new String(post.getAuthor().getBytes("8859_1"), "utf-8"));
			post.setContent(new String(post.getContent().getBytes("8859_1"), "utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		if(result.hasErrors()) {
			System.out.println("== Form data does not validated ==");
			
			List<ObjectError> errors = result.getAllErrors();
			
			for(ObjectError error : errors) {
				System.out.println(error.getDefaultMessage());
			}
			
			return "communityPostMake";
		}
		
		postService.insert(post);
		model.addAttribute("post", post);
		
		return "communityPost";
	}
	
	@RequestMapping(value = "/communityPostEdit/*", method = RequestMethod.GET)
	public String editPost(Model model, HttpServletRequest request) {
		String[] url = request.getRequestURI().split("/");
		int postNo = Integer.parseInt(url[3]);
		
		Post post = postService.getPost(postNo);
		model.addAttribute("post", post);
		
		return "communityPostEdit";
	}
	
	@RequestMapping(value = "/doeditpost/*")
	public String doEditPost(Model model, HttpServletRequest request) {
		String[] url = request.getRequestURI().split("/");
		int postNo = Integer.parseInt(url[3]);
		
		Post post = postService.getPost(postNo);
		
		// utf-8로 인코딩하여 한글깨짐 문제 해결
		try {
			post.setContent(new String(request.getParameter("content").getBytes("8859_1"), "utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		postService.update(post);
		model.addAttribute("post", post);
		
		return "communityPost";
	}
	
	@RequestMapping(value = "/post/*/like")
	public String doLike(Model model, HttpServletRequest request) {
		
		String[] url = request.getRequestURI().split("/");
		int postNo = Integer.parseInt(url[3]);
		
		Post post = postService.getPost(postNo);
		postService.like(post);
		model.addAttribute("post", post);
		
		return "communityPost";
	}
	
	@RequestMapping(value = "/post/*/unlike")
	public String doUnlike(Model model, HttpServletRequest request) {
		
		String[] url = request.getRequestURI().split("/");
		int postNo = Integer.parseInt(url[3]);
		
		Post post = postService.getPost(postNo);
		postService.unlike(post);
		model.addAttribute("post", post);
		
		return "communityPost";
	}
}
