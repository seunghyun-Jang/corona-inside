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
		List<Reply> list = replyDao.getReplies(postNo);
		for(Reply reply : list) {
			if(reply.getParentId() != 0) {
				updateParentAuthor(reply);
			}
		}
		return list;
	}

	public void insert(Reply reply) {
		replyDao.insert(reply);
	}
	
	public void updateParentAuthor(Reply reply) {
		reply.setParentAuthor(replyDao.getReply(reply.getParentId()).getAuthor());
	}
	
	public void updateOrderNo(Reply reply) {
		replyDao.updateOrderNo(reply);
	}
	
	public void delete(int replyId) {
		replyDao.delete(replyId);
	}

}
