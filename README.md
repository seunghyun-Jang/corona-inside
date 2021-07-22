# CORONA-INSIDE

### 1. 개요

  코로나 확진자 현황, 백신 접종 현황 정보를 제공해주고 간단한 게시판 기능을 포함한 웹 사이트
  
### 2. 기술 스택
  
  Spring MVC + Hibernate + Spring Security
  
### 3. 제공 기능

#### 1) 코로나 현황
  
  1-1) URL : https://corona-inside.kr/corona 
    
  1-2) 기능
    
    - 코로나 확진자 수 (어제 확진자 수 / 누적 확진자 수)
      
    - 코로나 확진자 추이 (차트)
      
    - 지역별 코로나 확진자 수 / 거리두기 단계 (전국지도)
      
    - 지역별 코로나 확진자 수 (차트)
      
    - 코로나 관련 뉴스기사 
      
#### 2) 백신 현황
  
  2-1) URL : https://corona-inside.kr/vaccine
    
  2-2) 기능
    
    - 백신 접종 현황
      
    - 주변 선별진료소 위치 (네이버지도 API 사용)
      
    - 백신 종류별 정보 (갯수, 특징)
      
#### 3) 커뮤니티
  
  3-1) URL : https://corona-inside.kr/community
  
  3-2) 기능
  
    - 로그인 (Spring Security, Hashed Password)
    
    - 글 작성/수정/삭제 (Validation, Authorization with login)
    
    - 댓글, 대댓글 작성/삭제
    
    - 글/댓글 추천/비추천
    
