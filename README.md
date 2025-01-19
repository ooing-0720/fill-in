# Setting
```
Rails   8.0.1
ruby    3.3.5
DB      SQLite3 # 임의(Rails default)
```

# 실행
## localhost 서버 기동
```
$ rails server
$ rails s # 위 명령어의 약어
```

## Gemfile 설치
백엔드에서 사용하는 라이브러리 설치
```
$ bundle install
```

## DB 테이블 생성
```
$ rails db:migrate
```

# 미구현
현재 백엔드 구현되어있지 않으나, 테스트 등에 필요한 기능 처리 설명

## 로그아웃
### 방법 1: 웹 페이지 쿠키 삭제
```
크롬 설정 > 개인 정보 보호 및 보안 > 서드 파티 쿠키 > 모든 사이트 데이터 및 권한 보기 > localhost 쿠키 삭제
```

### 방법 2: DB에서 계정 삭제
1. rails console 접속
```
$ rails console 
$ rails c # 위 명령어의 약어
```

2. Users 테이블에서 회원 정보 삭제
```
# email로 회원 삭제
$ User.delete_by(email: 'xxxx@example.com')

# id로 회원 삭제
$ User.all # 모든 회원 정보 보기 -> user_id 확인
$ User.delete_by(id: id)

# 모든 회원 정보 삭제
$ User.delete_all
```

3. rails console 종료
```
$ exit
```