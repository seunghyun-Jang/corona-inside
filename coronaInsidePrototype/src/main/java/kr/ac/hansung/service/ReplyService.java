package kr.ac.hansung.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.ac.hansung.dao.ReplyDao;
import kr.ac.hansung.model.Reply;

@Service
public class ReplyService {
	
	@Autowired
	private ReplyDao replyDao;
	
	public List<Reply> getCurrent(int postNo) {
		return replyDao.getReplies(postNo);
	}

	public void insert(Reply reply) {
		replyDao.insert(reply);
	}
	
	public void updateOrderNo(Reply reply) {
		replyDao.updateOrderNo(reply);
	}
	
	public void updateNumOfChild(Reply reply) {
		replyDao.updateNumOfChild(reply);
	}
	
	public void delete(int replyId) {
		replyDao.delete(replyId);
	}

}
