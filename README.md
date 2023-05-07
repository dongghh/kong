# kong Shop
 
심플한 가구 쇼핑몰을 구현한 개인 프로젝트

## 배포주소
Project Hosting : http://3.36.249.224:8080/ <br>
비용 문제로 인해 배포 중단합니다.


##### 관리자 계정

+ 아이디 : kong <br>
+ 비밀번호 : kong

##### 일반 계정

+ 아이디 : test <br>
+ 비밀번호 : test

## 사용기술

 #### Back-End
+ Java 11
+ Spring Framework 4.3.8
+ Maven 2.5.1
+ MyBatis 3.4.1
+ MySQL 5.1.46
+ Spring Security 5.0.8

#### Front-End
+ Html
+ CSS
+ JavaScript
+ JQuery 3.2.1

#### Deploy
+ AWS EC2 (Amazon linux 2)
+ AWS RDS (MySQL)

# Views

  - **메인 페이지**

  <img width="700" src="https://user-images.githubusercontent.com/103232761/219433330-aa162914-cc65-4d91-b064-a4161df8b774.gif"/>

  - **카테고리**
  
<img width="700" src="https://user-images.githubusercontent.com/103232761/236690235-cf524ffd-6712-4c3d-8954-e2e98a2faaf9.gif"/>



# 구현 기능

### 메인 화면

  <img width="700" src="https://user-images.githubusercontent.com/103232761/219443030-ebd73594-66a9-432b-82c1-7dc2e6e5c09d.gif"/>
  
  - **상품 전체 검색**
  
    + 검색 시 LIKE CONCAT('%',#{keyword},'%')를 이용해 상품의 이름을 비교하여 상품의 갯수와 데이터를 가져옴.

  - **슬라이드, 상품리스트**

    + swiper slide를 이용하여 메인페이지 이미지 슬라이드 효과 적용.
    
    + model.addAttribute를 이용해 name으로 지정한 값을 c:forEach를 사용해 메인페이지에 출력.
    
  - **상품 정렬**
  
    + 신규상품 , 인기상품 그리고 전체상품으로 나누고 신규상품은 상품등록날짜 인기상품은 상품 리뷰의 평점에 순으로 정렬하였습니다.

---

### 유저 기능

  <img width="700" src="https://user-images.githubusercontent.com/103232761/219509837-dd65436b-b9e6-44d9-92a9-bd2073667085.gif"/>

  <img width="400" alt="findpw" src="https://user-images.githubusercontent.com/103232761/219510669-7b481d48-0dd4-4e64-81a1-dac52ffb3b22.png"><img width="400" alt="findpw" src="https://user-images.githubusercontent.com/103232761/219510680-d8ed28a0-7c0b-487a-9614-660b6e3981c3.png">
  
  - **회원 비밀번호 찾기(Email API)**
    
    + 비밀번호를 찾을 때 등록된 아이디나 이메일이 있으면 해당 메일로 임시 비밀번호 발송.
    
    + 발송과 동시에 임시 비밀번호를 Spring Security를 이용해 암호화 후 DB에 저장.

---

### 상품 기능

  <img width="700" src="https://user-images.githubusercontent.com/103232761/219446949-9ef0d24d-c48f-48b7-ac9e-977f56c23b82.gif"/>

  <img width="400" alt="장바구니1" src="https://user-images.githubusercontent.com/103232761/219496366-81213087-d118-4a18-b1ab-2b0ebe2841c4.png"><img width="400" alt="장바구니2" src="https://user-images.githubusercontent.com/103232761/219496381-8e5e8b66-ed1b-482e-8a55-e529367f22be.png">

  - **상품 추가 및 삭제**
    
    + Jquery를 사용하여 선택한 상품 추가 및 원하는 상품 삭제 가능.
    
    + 중복되는 상품 유효성 체크 완료. 


  - **장바구니**
  
    + ajax를 이용해 상품을 장바구니로 담을 수 있고 구매수량에 따른 합계 계산을 해주며 상품 수량에 따른 구매수량을 제한했습니다.
    
    + 주문 버튼 클릭 시 해당 상품과 같이 결제 페이지로 이동.

---

  <img width="700" height="500" src="https://user-images.githubusercontent.com/103232761/219449296-7437749e-fac1-467a-b004-39fbdabf0313.gif"/>

  <img width="400" height="700" src="https://user-images.githubusercontent.com/103232761/219449702-c1cb9e47-d4e5-42e8-a861-6615c80483a9.jpeg"><img width="400" height="700" src="https://user-images.githubusercontent.com/103232761/219501319-8c3cc0d7-a5ad-45b6-8ae9-e4b063d15c73.jpeg">

  - **주문-결제**
    
    + ajax를 이용하여 주문서에 작성된 데이터로 결제를 요청한다.
    
    + 모바일로 QR코드 스캔 후 결제할 수 있게 구현하였다.


---

- # Query Log 설정

  <img width="600" alt="쿼리로그3" src="https://user-images.githubusercontent.com/103232761/219489670-    a4a5d5ef-cfbd-45fa-8985-0eadfd95cd75.png">

  <img width="523" alt="쿼리로그2" src="https://user-images.githubusercontent.com/103232761/219489483-bd58183b-c685-4d0b-887d-ecb1a28eb511.png">

  <img width="1106" alt="쿼리로그" src="https://user-images.githubusercontent.com/103232761/219489422-5c298e94-9f1c-45d5-a001-c969b2765399.png">

  - **목적**

    + 어떤 순서로 작업이 진행되고 SQL문을 확인 및 오류는 어디서 발생 되는지 확인할 수 있었습니다.
    + Log4j를 이용하였고 SQL 및 MVC패턴의 흐름을 직접적으로 느낄 수 있었습니다. 





