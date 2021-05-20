package kr.ac.hansung.dao;

import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;
import org.springframework.stereotype.Repository;

import kr.ac.hansung.dto.UserVO;
import kr.ac.hansung.model.User;


@Repository
public class UserDAO {

	private static SessionFactory sessionFactory;
	

	public void signUp(User user){
		
		sessionFactory = new Configuration().configure().buildSessionFactory();
		
		User user1 = new User();
		user1.setUser_id(user.getUser_id());
		user1.setUser_pw(user.getUser_pw());
		user1.setUsername(user.getUsername());
		
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		
		session.save(user);
		
		tx.commit();
		
		session.close();
		sessionFactory.close();
		
		
	}
	
	public void loginCheck(UserVO vo) {

	}
	
	public void logout(HttpSession session) {
		session.invalidate();
	}
}