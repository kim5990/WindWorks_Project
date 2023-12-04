<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> --%>
<!DOCTYPE html>
<html>
<head>

<!-- CSS -->
<link rel="stylesheet" href="resources/notice/css/notice-detail-view.css">

<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="../common/header.jsp" />

	<div class="menu">
		<div class="notice-detail-area">
		
			<!-- 공지사항 디테일  -->
			<div class="notice-detail-view">
				
				<div class="notice-top">
					<div class="notice-title">
						<button type="" class="notice-back-btn"><ion-icon class="notice-back-icon" name="chevron-back-outline"></ion-icon></button>
						사내 체육대회 전체 안내
					</div>
					<div class="notice-top-right">
						<div class="notice-writer">
							김부장
						</div>
						<div class="notice-date">
							2023-11-23
						</div>
					</div>
				</div>
				
				<div class="notice-middle">
					<div class="notice-content">
						<p>
						1. 블로그 메타 태그에 신경써라. 어떤 블로그인지블로그 bot이
						확인하는 영역 ; 블로그명, 프로필, 카테고리명, 작성하는 태그 주요 키워드 삽입, 내 업종 관련3키워드 삽입 ​ >
						블로그 프로필을 좀더 직선적인 표현을 써봐야겠다. 카테고리명에서 캐럿을 빼고. 변호사를 넣어볼까? 태그를 쓰기
						시작하자. ​ ​ 2. 연쇄 컨텐츠 소비를기획하라. 체류 시간이 많거나 여러 컨텐츠소비하는블로그 더노출 ​ 클릭 ->
						내용 -> 이어보기 -> 활동 (댓글,공감) -> 연락 ​ 1. 클릭 잘 하는 법 사람이 클릭을 하는 이마라.
						결국
						'제목' 제목을짓는 방법7가지 중 ​ ㅇ. '니즈'5파악 제목 짓기 ​ ex. 암보험비교사이트 암보험 비교사이트 여기가
						최고에요. 암보험비교사이트 여기는모르셨죠? 암보험비교사이트설계사가직접 운영하는곳! ​ '암보험비교사이트를검색하는이유?'

						암보험이 궁금해서? x 암보험비교가귀찮으니한번에, 한곳에서, 저렴하게 ​ '암보험비교사이트10군데 뒤져보고 정착한곳

						암보험 비교사이트 다른 곳보다 14원이라도 비싸면 100프로 환불 암보험비교사이트 한 곳에서 33개 보험사 비교 ​

						ㅇ. 이어보기 카테고리란? 최소 3가지 역할
						 1. 메타태그의 역할 
						 2. 연쇄컨텐츠 소비의역할
						  3. 씨랭크의 역할 ​ >
						제목이나 이어보기의 더 구체적인 내용은 강의를 들어보라 하심. 일단 오늘 배운 걸 적용해 보는 것으로. 우선 내가
						블로그를 통해 얻고자 하는 게 무엇인지를 좀더 구체적으로 정해 봐야겠음. ​ ​ 3. 블로그스킨,하지 마라. 전형적인
						한국인병. 완벽주의병 블로그 포기하는이유의 30프로가 블로그 스킨, but 블로그지수, 전환율과 상관 무 [출처]
						[블로그 수익화] 메타 태그 ; 연쇄 컨텐츠 소비 ; 블로그스킨 하지 마라 공지사항 글3개가 블로그의 얼굴 백호 이론
						</p>
					</div>
					<div class="notice-middle-right">
						<button class="notice-update-btn">수정</button>
						<div>|</div>
						<button class="notice-delete-btn">삭제</button>
					</div>
				</div>
				
				<div class="notice-bottom">
					<div class="notice-attchment">
						<a href="" download="">최종기획안.pdf</a>
					</div>
				</div>
				
				<!-- 공지사항 댓글 -->
				<div class="notice-reply-area">
					<div class="notice-reply-top">
						댓글 (<span id="rcount">3</span>)
					</div>
					<div class="notice-reply-middle">
						<div class="notice-reply-content">
							<div class="notice-reply-writer">
								김나나 사원
							</div>
							<div class="notice-reply">
								확인하였습니다~
							</div>
							<div class="notice-reply-date">
								2023-11-05
								<div class="notice-reply-parent">
									<button type="">답글쓰기</button>
								</div>
							</div>
						</div>
						<div class="notice-reply-content">
							<div class="notice-reply-writer">
								김다다 대리
								<div class="notice-reply-middle-right">
									<button class="notice-reply-update-btn">수정</button>
									<div>|</div>
									<button class="notice-reply-delete-btn">삭제</button>
								</div>
							</div>
							<div class="notice-reply">
								확인하였습니다~
							</div>
							<div class="notice-reply-date">
								2023-11-12
								<div class="notice-reply-parent">
									<button type="">답글쓰기</button>
								</div>
							</div>
						</div>
						<div class="notice-reply-content">
							<div class="notice-reply-writer">
								김라라 사원
							</div>
							<div class="notice-reply">
								확인하였습니다~
							</div>
							<div class="notice-reply-date">
								2023-11-20
								<div class="notice-reply-parent">
									<button type="">답글쓰기</button>
								</div>
							</div>
						</div>
						
						<div class="notice-reply-parent-content-area">
							<div class="notice-reply-parent-writer">
								김다다 사원
							</div>
							<div class="notice-reply-parent-content">
								확인하신거 맞죠?
							</div>
							<div class="notice-reply-parent-date">
								2023-11-20
								<div class="notice-reply-parent"> <!-- 클래스명 바꿀지 -->
									<button type="">답글쓰기</button>
								</div>
							</div>
						</div>
						<div class="notice-reply-parent-content-area">
							<div class="notice-reply-parent-writer">
								최길동 강사
								<div class="notice-reply-middle-right">
									<button class="notice-reply-update-btn">수정</button>
									<div>|</div>
									<button class="notice-reply-delete-btn">삭제</button>
								</div>
							</div>
							<div class="notice-reply-parent-content">
								알겠습니다.
							</div>
							<div class="notice-reply-parent-date">
								2023-11-20
								<div class="notice-reply-parent"> <!-- 클래스명 바꿀지 -->
									<button type="">답글쓰기</button>
								</div>
							</div>
						</div>
						
						<div class="notice-reply-content">
							<div class="notice-reply-writer">
								김나나 대리
							</div>
							<div class="notice-reply">
								확인하였습니다~!
							</div>
							<div class="notice-reply-date">
								2023-11-23
								<div class="notice-reply-parent">
									<button type="">답글쓰기</button>
								</div>
							</div>
						</div>
					</div>
					<div class="notice-reply-bottom">
						<div class="notice-reply-write-area">
							<div class="notice-reply-write-writer">
								김갑수 과장
							</div>
							<div class="notice-reply-write-content">
								<textarea rows="2" cols="100" placeholder="댓글을 입력해주세요" style="overflow: hidden"></textarea>
							</div>
							<div class="notice-reply-write-btn">
								<button>등록</button>
							</div>
						</div>
					</div>
				
				</div>
				
				
				
			</div>
			
			
		</div>
	</div>

</body>
</html>