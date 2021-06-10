package kr.ac.hansung.model;

import java.util.ArrayList;
import java.util.Collection;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@ToString

@NoArgsConstructor

@Entity
@Table(name="user")

@SuppressWarnings("serial")
public class CustomUserDetails implements UserDetails {
	
	@Column(name="username")
	@Size(min=4, max=8, message="아이디는 4~8자리이어야 합니다.")
	private String username;
	
	@Column
    @Pattern(regexp="^.*(?=.{6,12})(?=.*[0-9])(?=.*[a-zA-Z]).*$", message="비밀번호는 영문과 숫자 조합으로 6~12글자 이내여야합니다.")
	private String password;
	
	@Column
	@Pattern(regexp="\\S{2,12}", message="이름은 2~12자로 입력해주세요.")
	private String nickname;
	
	@Column(name="authority",columnDefinition = "varchar(255) default 'ROLE_USER'")
	private String AUTHORITY;
	
	@Id    
	@GeneratedValue	
	@Column(name="user_id")
	private int userId;
	
	@Column(name="enabled",columnDefinition = "boolean default false")
	private boolean ENABLED;
	
	@Override
	public String getUsername() {
		return username;
	}


	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
        ArrayList<GrantedAuthority> auth = new ArrayList<GrantedAuthority>();
        auth.add(new SimpleGrantedAuthority(AUTHORITY));
        return auth;
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return ENABLED;
	}

}