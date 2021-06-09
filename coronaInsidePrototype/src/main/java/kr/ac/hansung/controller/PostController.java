package kr.ac.hansung.controller;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.ac.hansung.model.CustomUserDetails;
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
	public String community(Model model, HttpServletRequest request) {
		
		List<Post> posts = null;
		
		if( request.getParameter("search_condition") == null) {
			posts = postService.getCurrent();
		} else if( request.getParameter("search_condition").equals("true")) {
			String searchTarget = request.getParameter("search_target");
			String keyword = request.getParameter("search_keyword");
			posts = postService.searchPost(searchTarget, keyword);
		}
		
		for(Post post : posts) {
			long timeBeforePost = System.currentTimeMillis() - post.getDate().getTime();
			String timeBeforePostText = "";
			long time;
			if(timeBeforePost < 1000*60) {
				time = timeBeforePost / 1000;
				timeBeforePostText = time + "초 전";
			} else if( timeBeforePost < 1000*60*60 ) {
				time = timeBeforePost / 60000;
				timeBeforePostText = time + "분 전";
			} else if( timeBeforePost < 1000*60*60*24 ) {
				time = timeBeforePost / 3600000;
				timeBeforePostText = time + "시간 전";
			} else if( timeBeforePost < 1000*60*60*24*7 ){
				time = timeBeforePost / 79200000;
				timeBeforePostText = time + "일 전";
			} else {
				timeBeforePostText = new SimpleDateFormat("yyyy-MM-dd").format(post.getDate());
			}
			post.setDatetime(timeBeforePostText);
		}
		
		model.addAttribute("posts", posts);
		
		model.addAttribute("page", 1);
		
		model.addAttribute("isbest", 0);
		
		return "community";
	}
	
	@RequestMapping(value = "/community/*", method = RequestMethod.GET)
	public String communityPage(Model model, HttpServletRequest request) {
		
		List<Post> posts = null;
		
		if( request.getParameter("search_condition") == null) {
			posts = postService.getCurrent();
		} else if( request.getParameter("search_condition").equals("true")) {
			String searchTarget = request.getParameter("search_target");
			String keyword = request.getParameter("search_keyword");
			posts = postService.searchPost(searchTarget, keyword);
		}
		
		for(Post post : posts) {
			long timeBeforePost = System.currentTimeMillis() - post.getDate().getTime();
			String timeBeforePostText = "";
			long time;
			if(timeBeforePost < 1000*60) {
				time = timeBeforePost / 1000;
				timeBeforePostText = time + "초 전";
			} else if( timeBeforePost < 1000*60*60 ) {
				time = timeBeforePost / 60000;
				timeBeforePostText = time + "분 전";
			} else if( timeBeforePost < 1000*60*60*24 ) {
				time = timeBeforePost / 3600000;
				timeBeforePostText = time + "시간 전";
			} else if( timeBeforePost < 1000*60*60*24*7 ){
				time = timeBeforePost / 79200000;
				timeBeforePostText = time + "일 전";
			} else {
				timeBeforePostText = new SimpleDateFormat("yyyy-MM-dd").format(post.getDate());
			}
			post.setDatetime(timeBeforePostText);
		}
		
		model.addAttribute("posts", posts);
		
		String[] url = request.getRequestURI().split("/");
		int page = Integer.parseInt(url[3]);
		model.addAttribute("page", page);
		
		model.addAttribute("isbest", 0);
		
		return "community";
	}
	
	@RequestMapping(value = "/community/best", method = RequestMethod.GET)
	public String communityBest(Model model) {
		
		List<Post> posts = postService.getBestPosts();
		
		for(Post post : posts) {
			long timeBeforePost = System.currentTimeMillis() - post.getDate().getTime();
			String timeBeforePostText = "";
			long time;
			if(timeBeforePost < 1000*60) {
				time = timeBeforePost / 1000;
				timeBeforePostText = time + "초 전";
			} else if( timeBeforePost < 1000*60*60 ) {
				time = timeBeforePost / 60000;
				timeBeforePostText = time + "분 전";
			} else if( timeBeforePost < 1000*60*60*24 ) {
				time = timeBeforePost / 3600000;
				timeBeforePostText = time + "시간 전";
			} else if( timeBeforePost < 1000*60*60*24*7 ){
				time = timeBeforePost / 79200000;
				timeBeforePostText = time + "일 전";
			} else {
				timeBeforePostText = new SimpleDateFormat("yyyy-MM-dd").format(post.getDate());
			}
			post.setDatetime(timeBeforePostText);
		}
		
		model.addAttribute("posts", posts);
		
		model.addAttribute("page", 1);
		
		model.addAttribute("isbest", 1);
		
		return "community";
	}
	
	@RequestMapping(value = "/community/best/*", method = RequestMethod.GET)
	public String communityBestPosts(Model model, HttpServletRequest request) {
		
		List<Post> posts = postService.getBestPosts();
		
		for(Post post : posts) {
			long timeBeforePost = System.currentTimeMillis() - post.getDate().getTime();
			String timeBeforePostText = "";
			long time;
			if(timeBeforePost < 1000*60) {
				time = timeBeforePost / 1000;
				timeBeforePostText = time + "초 전";
			} else if( timeBeforePost < 1000*60*60 ) {
				time = timeBeforePost / 60000;
				timeBeforePostText = time + "분 전";
			} else if( timeBeforePost < 1000*60*60*24 ) {
				time = timeBeforePost / 3600000;
				timeBeforePostText = time + "시간 전";
			} else if( timeBeforePost < 1000*60*60*24*7 ){
				time = timeBeforePost / 79200000;
				timeBeforePostText = time + "일 전";
			} else {
				timeBeforePostText = new SimpleDateFormat("yyyy-MM-dd").format(post.getDate());
			}
			post.setDatetime(timeBeforePostText);
		}
		
		model.addAttribute("posts", posts);
		
		String[] url = request.getRequestURI().split("/");
		int page = Integer.parseInt(url[3]);
		model.addAttribute("page", page);
		
		model.addAttribute("isbest", 1);
		
		return "community";
	}
	
	@RequestMapping(value = "/post/*", method = RequestMethod.GET)
	public String communityPost(Model model, HttpServletRequest request) {
		String[] url = request.getRequestURI().split("/");
		int postNo = Integer.parseInt(url[3]);
		
		Post post = postService.getPost(postNo);
				
		long timeBeforePost = System.currentTimeMillis() - post.getDate().getTime();
		String timeBeforePostText = "";
		long time;
		if(timeBeforePost < 1000*60) {
			time = timeBeforePost / 1000;
			timeBeforePostText = time + "초 전";
		} else if( timeBeforePost < 1000*60*60 ) {
			time = timeBeforePost / 60000;
			timeBeforePostText = time + "분 전";
		} else if( timeBeforePost < 1000*60*60*24 ) {
			time = timeBeforePost / 3600000;
			timeBeforePostText = time + "시간 전";
		} else if( timeBeforePost < 1000*60*60*24*7 ){
			time = timeBeforePost / 79200000;
			timeBeforePostText = time + "일 전";
		} else {
			timeBeforePostText = new SimpleDateFormat("yyyy-MM-dd").format(post.getDate());
		}
		post.setDatetime(timeBeforePostText);
		model.addAttribute("post", post);
		
		List<Reply> replies = replyService.getCurrent(postNo);
		model.addAttribute("replies", replies);
		
		List<Reply> bestReplies = replyService.getBestReplies(postNo);
		model.addAttribute("best_replies", bestReplies);
		
		model.addAttribute("reply", new Reply());
		
		return "community-post";
	}
	
	@RequestMapping(value = "/community-post-make", method = RequestMethod.GET)
	public String makePost(Model model) {
		model.addAttribute("post", new Post());
		
		return "community-post-make";
	}
	
	@RequestMapping(value = "/do-makepost")
	public String doMakePost(Model model, @ModelAttribute("post") @Valid Post post, BindingResult result) {
		
		if(result.hasErrors()) {
			System.out.println("== Form data does not validated ==");
			
			List<ObjectError> errors = result.getAllErrors();
			
			for(ObjectError error : errors) {
				System.out.println(error.getDefaultMessage());
			}
			
			return "community-post-make";
		}
		post.setDate(new Date());
		postService.insert(post);
		model.addAttribute("post", post);
		
		model.addAttribute("reply", new Reply());
		
		return "redirect:post/" + postService.getCurrentPostNo();
	}
	
	@RequestMapping(value = "/community-post-edit/*", method = RequestMethod.GET)
	public String editPost(Model model, HttpServletRequest request, Authentication auth) {
		String[] url = request.getRequestURI().split("/");
		int postNo = Integer.parseInt(url[3]);
		
		Post post = postService.getPost(postNo);
		
		CustomUserDetails user = (CustomUserDetails) auth.getPrincipal();
		if(!post.getUsername().equals(user.getUsername())) {
			return "redirect:../post/" + postNo;
		} else {
			model.addAttribute("post", post);
			
			return "community-post-edit";
		}
	}
	
	@RequestMapping(value = "/do-editpost/*", method = RequestMethod.POST)
	public String doEditPost(Model model, HttpServletRequest request, Authentication auth) {
		String[] url = request.getRequestURI().split("/");
		int postNo = Integer.parseInt(url[3]);
		
		Post post = postService.getPost(postNo);
		
		CustomUserDetails user = (CustomUserDetails) auth.getPrincipal();
		if(post.getUsername().equals(user.getUsername())) {
			
			String editedContent = request.getParameter("content");
			post.setContent(editedContent);
			
			System.out.println("Update Post - Content: " + post.getContent());
			postService.update(post);
			model.addAttribute("post", post);
		}
		return "redirect:../post/"+postNo;
	}
	
	@RequestMapping(value = "/do-deletepost/*")
	public String doDeletePost(Model model, HttpServletRequest request, Authentication auth) {
		String[] url = request.getRequestURI().split("/");
		int postNo = Integer.parseInt(url[3]);
		
		Post post = postService.getPost(postNo);
		CustomUserDetails user = (CustomUserDetails) auth.getPrincipal();
		if(post.getUsername().equals(user.getUsername())) {
			postService.delete(post);
		}
		
		return "redirect:../community";
	}
	
	@RequestMapping(value = "/post/*/do-postlike")
	public String doPostLike(Model model, HttpServletRequest request, Authentication auth) {
		
		String[] url = request.getRequestURI().split("/");
		int postNo = Integer.parseInt(url[3]);
		
		Post post = postService.getPost(postNo);
		
		CustomUserDetails user = (CustomUserDetails) auth.getPrincipal();
		if(!postService.isAlreadyLiked(user.getUser_id(), postNo)) {
			
			postService.like(post, user.getUser_id());
		}
		
		model.addAttribute("post", post);
		
		List<Reply> replies = replyService.getCurrent(postNo);
		model.addAttribute("replies", replies);
		
		model.addAttribute("reply", new Reply());
		
		return "community-post";
	}
	
	@RequestMapping(value = "/post/*/do-postunlike")
	public String doPostUnlike(Model model, HttpServletRequest request, Authentication auth) {
		
		String[] url = request.getRequestURI().split("/");
		int postNo = Integer.parseInt(url[3]);
		
		Post post = postService.getPost(postNo);
		
		CustomUserDetails user = (CustomUserDetails) auth.getPrincipal();
		if(!postService.isAlreadyLiked(user.getUser_id(), postNo)) {
			
			postService.unlike(post, user.getUser_id());
		}
		
		model.addAttribute("post", post);
		
		List<Reply> replies = replyService.getCurrent(postNo);
		model.addAttribute("replies", replies);
		
		model.addAttribute("reply", new Reply());
		
		return "community-post";
	}
	
	@RequestMapping(value = "/do-reply", method = RequestMethod.POST)
	public String doReply(Model model, @ModelAttribute("reply") @Valid Reply reply, BindingResult result) {
		
		if(result.hasErrors()) {
			System.out.println("== Form data does not validated ==");
			
			List<ObjectError> errors = result.getAllErrors();
			
			for(ObjectError error : errors) {
				System.out.println(error.getDefaultMessage());
			}
			
			return "community-post";
		}
		
		Post post = postService.getPost(reply.getPostNo());
		model.addAttribute("post", post);
		
		List<Reply> replies = replyService.getCurrent(reply.getPostNo());
		
		if(replies.isEmpty()) {
			reply.setOrderNo(1);
			reply.setGroupNo(1);
		} else if(reply.getParentId() == 0) {
			int nextOrderNo = replyService.getNextOrderNo(reply.getPostNo());
			replyService.updateOrderNums(nextOrderNo);
			reply.setOrderNo(nextOrderNo);
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
	
	@RequestMapping(value = "/post/*/do-replylike")
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
		
		return "community-post";
	}
	
	@RequestMapping(value = "/post/*/do-replyunlike")
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
		
		return "community-post";
	}
}
