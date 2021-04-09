package kr.ac.hansung.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import kr.ac.hansung.dto.UserVO;

public class UserDAO {

	private Connection conn; // 데이터베이스에 접근하게 해주는 객체

	private PreparedStatement pstmt;

	private ResultSet rs; // 정보를 담을 수 있는 객체

	public UserDAO() {

		try {

			String jdbcURL = "jdbc:mysql://localhost:3306/coronainside?serverTimezone=UTC";
			String dbID = "root";
			String dbPW = "a1786511!";

			Class.forName("com.mysql.jdbc.Driver");

			conn = DriverManager.getConnection(jdbcURL, dbID, dbPW);

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

	public int loginCheck(UserVO vo) {

		String SQL = "Select pw From user where id = ?";

		try {

			pstmt = conn.prepareStatement(SQL);

			pstmt.setString(1, vo.getUsername());

			rs = pstmt.executeQuery();

			if (rs.next()) {

				if (rs.getString(1).equals(vo.getPassword())) {

					return 1; // 로그인 성공

				} else

					return 0; // 비밀번호 불일치

			}
			return -1; // 아이디가 없음

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // 데이터베이스 오류
	}
	public void logout(HttpSession session) {
		session.invalidate();
	}
}