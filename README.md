# VENIATIS
> 크라우드 펀딩 지원 웹 사이트 프로젝트입니다. <br>
<b>작업 기간</b> : 2020. 01. 18 ~ 2020. 03. 23 <br>
4인 팀프로젝트로 저는 커뮤니티 기반의 <b>'블로그 서비스'</b> 역할을 분담하였습니다.

## 개발 환경
- Java Spring Boot
- Oracle
- Mybatis
- API : KaKao API, Naver Developer, OpenWeather


## 구현 내용
- 블로그 서비스 (블로그 생성, 포스트 작성/수정/삭제, 덧글 작성/수정/삭제, 좋아요, 스크랩, 구독, 블로그 CSS 수정)
* 블로그 서비스
    * 블로그 메인 홈
         - 알림 기능 : 타 회원이 자신의 게시글에 댓글을 달거나 좋아요를 했을 경우 알림 표시됨. X를 통해 제거 가능. + 페이징 처리
         - 인기글 표시 : 좋아요가 가장 많은 게시글 순서대로 정렬함.
         - 구독 블로그 최신글 : 자신이 구독한 블로그의 일주일 내로 작성된 글이 있을 경우 표시됨.
    * 블로그 생성
         - 블로그에 접속 했을 때 Controller에서 생성여부 확인 후 처음 접속한 것이라면 자동으로 블로그가 생성 됨.
         - 블로그 제목과 소개글은 기본값으로 설정 됨.
    * 포스트 작성 / 수정 / 삭제
         - 썸네일 입력
         - 네이버 스마트 에디터를 통해 글 작성
         - 태그 입력 : JQuery를 이용하여 input 창에 엔터 입력시 태그 생성, 비어있는 상태에서 백스페이스 입력 시 태그 제거
    * 블로그 메인 
         - 썸네일과 함께 최신순대로 포스트 정렬 + 페이징 처리
         - 타인 블로그 접속 시 블로그 소개글 영역에 '구독하기' 버튼 출현. 클릭 시 Ajax를 이용해 구독목록 추가, '구독해제' 로 텍스트 변경됨.( 구독해제 동일하게 AJax 이용, 해제시 다시 '구독하기' 텍스트로 변경 됨.
         - 오른쪽 사이드바 : 검색, 카테고리(카테고리별 포스트 정렬), 해시태그(해시태그별 포스트 정렬), 현재 위치에 기반한 날씨(OpenWeather API 사용), 현재 위치(KaKao Map API 사용)
    * 포스트 상세 
         - 포스트 내용 열람 가능
         - 좋아요 : 좋아요를 이미 했을 시에 빨간색 하트 이미지 출현, 미반영 시에 검정 하트 출현. 버튼 클릭 시 Ajax를 이용하여 좋아요 반영, 이미지 변경 됨(좋아요 된 상태에서 다시 클릭 했을 시에는 역시 Ajax를 이용하여 좋아요 취소)
         - 스크랩 : 타인의 블로그에 접속했을 때 버튼 출현, 포스트 제목 + 내용 + 추가 메모 내역을 스크랩 함. 스크랩 될 때 제목 앞에 [스크랩] 이라고 표시됨.
         - SNS 공유 : 트위터 - a태그를 이용해 트위터로 포스트 내용을 공유함 / 카카오톡 : Kakao 공유 API를 통해 카카오톡으로 포스트 내용을 공유함
         - 댓글 : Ajax를 이용하여 댓글 입력. 수정/ 삭제 역시 Ajax 이용
         - 답글 : Ajax를 이용하여 답글 입력. 수정/ 삭제 역시 Ajax 이용 (답글을 불러오기 위해 댓글조회 Ajax를 동기식으로 변경하고, 한 개의 댓글을 불러올 때 답글 Ajax를 동기식으로 작성하여 동시 호출시시킴). margin-left 값을 주어 일반 댓글인지 구별 가능
    * 블로그 관리     
         -
## 라이브러리

* 0.2.1
    * CHANGE: Update docs (module code remains unchanged)

## 주요 이슈
1. 회원 고유 블로그 주소 지정
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)

## 보완점
1. Fork it (<https://github.com/yourname/yourproject/fork>)
2. Create your feature branch (`git checkout -b feature/fooBar`)
3. Commit your changes (`git commit -am 'Add some fooBar'`)
4. Push to the branch (`git push origin feature/fooBar`)
5. Create a new Pull Request

<!-- Markdown link & img dfn's -->
[npm-image]: https://img.shields.io/npm/v/datadog-metrics.svg?style=flat-square
[npm-url]: https://npmjs.org/package/datadog-metrics
[npm-downloads]: https://img.shields.io/npm/dm/datadog-metrics.svg?style=flat-square
[travis-image]: https://img.shields.io/travis/dbader/node-datadog-metrics/master.svg?style=flat-square
[travis-url]: https://travis-ci.org/dbader/node-datadog-metrics
[wiki]: https://github.com/yourname/yourproject/wiki


## 코드 소개

Describe how to install all development dependencies and how to run an automated test-suite of some kind. Potentially do this for multiple platforms.

```sh
make install
npm test
```
OS X & Linux:

```sh
npm install my-crazy-module --save
```

Windows:

```sh
edit autoexec.bat
```
