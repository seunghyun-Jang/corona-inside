package kr.ac.hansung.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.http.HttpSession;

import kr.ac.hansung.dto.UserVO;

public class UserDAO {

	private Connection conn; // �����ͺ��̽��� �����ϰ� ���ִ� ��ü

	private PreparedStatement pstmt;

	private ResultSet rs; // ������ ���� �� �ִ� ��ü

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

					return 1; // �α��� ����

				} else

					return 0; // ��й�ȣ ����ġ

			}
			return -1; // ���̵� ����

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; // �����ͺ��̽� ����
	}
	public void logout(HttpSession session) {
		session.invalidate();
	}
}