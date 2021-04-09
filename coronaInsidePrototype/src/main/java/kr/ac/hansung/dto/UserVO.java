package kr.ac.hansung.cse;

public class UserVO {
	private String username;
	private String password;
	
	public String getUsername() {
		return username;
	}
	public void setUsername(String userId) {
		this.username = userId;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String passwd) {
		this.password = passwd;
	}
	
	@Override
	public String toString() {
		return "LoginVO [userId=" + username + ", passwd=" + password + "]";
	}
}
