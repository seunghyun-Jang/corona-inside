
package kr.ac.hansung.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import kr.ac.hansung.service.CustomUserDetailsService;

@EnableWebSecurity
@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter { 
	
	private static final String[] COMMUNITY_FUNCTION = {
			"/community-post-make",
			"/do-makepost",
			"/community-post-edit/*",
			"/check-deletepost/*",
			"/do-deletepost/*",
			"/post/*/do-postlike",
			"/post/*/do-postunlike",
			"/do-reply",
			"/post/*/do-replylike",
			"/post/*/do-replyunlike",
			
    };

	@Override
	protected void configure(HttpSecurity http) throws Exception {

		http.authorizeRequests().antMatchers("/login", "/signup", "/user").permitAll() // 누구나 접근 허용
				.antMatchers(COMMUNITY_FUNCTION).hasRole("USER")
				.antMatchers("/","/home").permitAll() // 누구나 접근 가능
				//.antMatchers("/admin").hasRole("ADMIN") // ADMIN만 접근 가능
				//.anyRequest().authenticated() // 나머지 요청들은 권한의 종류에 상관 없이 권한이 있어야 접근 가능
				.and().formLogin() //  
				.loginPage("/login") // 로그인 페이지 링크
				.defaultSuccessUrl("/home?login") // 로그인 성공 후 리다이렉트 주소 
				.failureUrl("/login?error")
				.permitAll().and().logout() //
				.logoutSuccessUrl("/home?logout") // 로그아웃성공시 리다이렉트 주소
				.permitAll().invalidateHttpSession(true) // 세션 날리기	
		;

	}

	@Autowired
	private CustomUserDetailsService customUserDetailsService;

	/**
	 * 비밀번호 암호화 관련 설정
	 */

	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	/**
	 * 권한 인증 받기(로그인)
	 */
	@Override
	public void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(customUserDetailsService).passwordEncoder(passwordEncoder());
	}
}
