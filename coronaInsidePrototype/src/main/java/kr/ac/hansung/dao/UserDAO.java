package kr.ac.hansung.dao;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.ac.hansung.model.CustomUserDetails;

@Repository
@Transactional
public class UserDAO {

	@Inject
	BCryptPasswordEncoder passwordEncoder;

	
	@Autowired
	private SessionFactory sessionFactory;
	
	public CustomUserDetails getUserById(String user_id) {
    	Session session = sessionFactory.getCurrentSession();
		
		String hql = "from CustomUserDetails user where user.user_id =:id";
		  
		  
		Query<CustomUserDetails> query = session.createQuery(hql, CustomUserDetails.class);
		query.setParameter("id", user_id);
		List<CustomUserDetails> results = query.getResultList();
		if(!results.isEmpty()) {
			CustomUserDetails user = (CustomUserDetails)results.get(0);
			return user;
		}
		
		return null;
		//CustomUserDetails user = (CustomUserDetails)query.getSingleResult();
		  
		//return user;
		 
 
    }

	public void signUp(CustomUserDetails user) {

		Session session = sessionFactory.getCurrentSession();

		CustomUserDetails user1 = new CustomUserDetails();
		user1.setUser_id(user.getUser_id());
		user1.setPassword(user.getPassword());
		user1.setUsername(user.getUsername());

		session.save(user1);


	}

	public boolean loginCheck(String user_id, String password) {
		
		/* String checkPw = sqlSession.selectOne("user.loginCheck", user); */
		CustomUserDetails userInfo = getUserById(user_id);
		/*
		 * boolean matchPw = passwordEncoder.matches(user.getPassword(), checkPw);
		 */
		
		System.out.println("가져온 password : " + userInfo.getPassword() + "   입력한 password : " + password);
		
		boolean result = passwordEncoder.matches(password, userInfo.getPassword());
		
		System.out.println("결과 : " + result);

		return result;
	}

	public void logout(HttpSession session) {
		session.invalidate();
	}
}