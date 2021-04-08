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
import kr.ac.hansung.model.Reply;
import kr.ac.hansung.service.PostService;
import kr.ac.hansung.service.ReplyService;


@Controller
public class PostController {
	
	@Autowired
	private PostService postService;
	
	@Autowired
	private ReplyService replyService;
	
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
	
	@RequestMapping(value = "/community/best", method = RequestMethod.GET)
	public String communityBest(Model model) {
		
		List<Post> posts = postService.getBestPosts();
		model.addAttribute("posts", posts);
		
		model.addAttribute("page", 1);
		
		return "community";
	}
	
	@RequestMapping(value = "/community/best/*", method = RequestMethod.GET)
	public String communityBestPosts(Model model, HttpServletRequest request) {
		
		List<Post> posts = postService.getBestPosts();
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
		
		List<Reply> replies = replyService.getCurrent(postNo);
		model.addAttribute("replies", replies);
		
		model.addAttribute("reply", new Reply());
		
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
		
		model.addAttribute("reply", new Reply());
		
		return "redirect:post/" + postService.getCurrentPostNo();
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
		
		return "redirect:../post/"+postNo;
	}
	
	@RequestMapping(value = "/post/*/dopostlike")
	public String doPostLike(Model model, HttpServletRequest request) {
		
		String[] url = request.getRequestURI().split("/");
		int postNo = Integer.parseInt(url[3]);
		
		Post post = postService.getPost(postNo);
		postService.like(post);
		model.addAttribute("post", post);
		
		List<Reply> replies = replyService.getCurrent(postNo);
		model.addAttribute("replies", replies);
		
		model.addAttribute("reply", new Reply());
		
		return "communityPost";
	}
	
	@RequestMapping(value = "/post/*/dopostunlike")
	public String doPostUnlike(Model model, HttpServletRequest request) {
		
		String[] url = request.getRequestURI().split("/");
		int postNo = Integer.parseInt(url[3]);
		
		Post post = postService.getPost(postNo);
		postService.unlike(post);
		model.addAttribute("post", post);
		
		List<Reply> replies = replyService.getCurrent(postNo);
		model.addAttribute("replies", replies);
		
		model.addAttribute("reply", new Reply());
		
		return "communityPost";
	}
	
	@RequestMapping(value = "/doreply", method = RequestMethod.POST)
	public String doReply(Model model, @ModelAttribute("reply") @Valid Reply reply, BindingResult result) {
		
		// utf-8로 인코딩하여 한글깨짐 문제 해결
		try {
			reply.setContent(new String(reply.getContent().getBytes("8859_1"), "utf-8"));
			reply.setAuthor(new String(reply.getAuthor().getBytes("8859_1"), "utf-8"));
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		if(result.hasErrors()) {
			System.out.println("== Form data does not validated ==");
			
			List<ObjectError> errors = result.getAllErrors();
			
			for(ObjectError error : errors) {
				System.out.println(error.getDefaultMessage());
			}
			
			return "communityPost";
		}
		
		Post post = postService.getPost(reply.getPostNo());
		model.addAttribute("post", post);
		
		List<Reply> replies = replyService.getCurrent(reply.getPostNo());
		
		if(replies.isEmpty()) {
			reply.setOrderNo(1);
			reply.setGroupNo(1);
		} else if(reply.getParentId() == 0) {
			reply.setOrderNo(replyService.getNextOrderNo(reply.getPostNo()));
			reply.setGroupNo(replyService.getNextGroupNo(reply.getPostNo()));
		} else {
			reply.setOrderNo(replyService.getNextOrderNo(reply.getPostNo(), reply.getGroupNo()));
		}
		
		replyService.insert(reply);
		
		replies = replyService.getCurrent(reply.getPostNo());
		model.addAttribute("replies", replies);
		
		model.addAttribute("reply", new Reply());
		
		return "redirect:post/"+post.getPostNo();
	}
	
	@RequestMapping(value = "/post/*/doreplylike")
	public String doReplyLike(Model model, HttpServletRequest request) {
		
		String[] url = request.getRequestURI().split("/");
		int replyId = Integer.parseInt(url[3]);
		
		Reply reply = replyService.getReply(replyId);
		replyService.like(reply);
		
		int postNo = reply.getPostNo();
		Post post = postService.getPost(postNo);
		model.addAttribute("post", post);
		
		List<Reply> replies = replyService.getCurrent(postNo);
		model.addAttribute("replies", replies);
		
		model.addAttribute("reply", new Reply());
		
		return "communityPost";
	}
	
	@RequestMapping(value = "/post/*/doreplyunlike")
	public String doReplyUnlike(Model model, HttpServletRequest request) {
		
		String[] url = request.getRequestURI().split("/");
		int replyId = Integer.parseInt(url[3]);
		
		Reply reply = replyService.getReply(replyId);
		replyService.unlike(reply);
		
		int postNo = reply.getPostNo();
		Post post = postService.getPost(postNo);
		model.addAttribute("post", post);
		
		List<Reply> replies = replyService.getCurrent(postNo);
		model.addAttribute("replies", replies);
		
		model.addAttribute("reply", new Reply());
		
		return "communityPost";
	}
}
