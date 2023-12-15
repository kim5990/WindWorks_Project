<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="./resources/reservation/css/reservation.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
</head>
<body>
    <jsp:include page="../common/header.jsp" />
    <div class ="menu">
        <div class="reservation-all">
            <div class="reservation-calender">
                <div class="event-calenderTitleText" id="calendar-title-yesterday" >
                    <ion-icon name="chevron-back-outline" onclick="backCalendarDate()"></ion-icon>
                </div>
                <div class="event-calenderTitleText" id="calendar-title"></div>
                <div class="event-calenderTitleText" id="calendar-title-tomorrow">
                    <ion-icon name="chevron-forward-outline" onclick="frontCalendarDate()"></ion-icon>
                </div>
                <div class="event-calenderTitleText" id="calendar-icon">
                    <ion-icon name="calendar-outline"></ion-icon>
                </div>
            </div>
            <div class="reservation-graph">
                <div class="graph-header">
                    <div class="graph-head"></div>
                    <div class="graph-head-hour">00</div>
                    <div class="graph-head-hour">01</div>
                    <div class="graph-head-hour">02</div>
                    <div class="graph-head-hour">03</div>
                    <div class="graph-head-hour">04</div>
                    <div class="graph-head-hour">05</div>
                    <div class="graph-head-hour">06</div>
                    <div class="graph-head-hour">07</div>
                    <div class="graph-head-hour">08</div>
                    <div class="graph-head-hour">09</div>
                    <div class="graph-head-hour">10</div>
                    <div class="graph-head-hour">11</div>
                    <div class="graph-head-hour">12</div>
                    <div class="graph-head-hour">13</div>
                    <div class="graph-head-hour">14</div>
                    <div class="graph-head-hour">15</div>
                    <div class="graph-head-hour">16</div>
                    <div class="graph-head-hour">17</div>
                    <div class="graph-head-hour">18</div>
                    <div class="graph-head-hour">19</div>
                    <div class="graph-head-hour">20</div>
                    <div class="graph-head-hour">21</div>
                    <div class="graph-head-hour">22</div>
                    <div class="graph-head-hour">23</div>
                </div>
                <div class="graph-body">
                    <div class="graph-body-list">
                        <c:forEach var="a" items="${assetsList}">
                            <div class="graph-body-content">
                                <div class="graph-body-head">${a.assName}</div>
                                <div class="graph-body-body" id="selectable">
                                    <div class="graph-body-hour" value="00:30"></div>
                                    <div class="graph-body-hour" value="01:00"></div>
                                    <div class="graph-body-hour" value="01:30"></div>
                                    <div class="graph-body-hour" value="02:00"></div>
                                    <div class="graph-body-hour" value="02:30"></div>
                                    <div class="graph-body-hour" value="03:00"></div>
                                    <div class="graph-body-hour" value="03:30"></div>
                                    <div class="graph-body-hour" value="04:00"></div>
                                    <div class="graph-body-hour" value="04:30"></div>
                                    <div class="graph-body-hour" value="05:00"></div>
                                    <div class="graph-body-hour" value="05:30"></div>
                                    <div class="graph-body-hour" value="06:00"></div>
                                    <div class="graph-body-hour" value="06:30"></div>
                                    <div class="graph-body-hour" value="07:00"></div>
                                    <div class="graph-body-hour" value="07:30"></div>
                                    <div class="graph-body-hour" value="08:00"></div>
                                    <div class="graph-body-hour" value="08:30"></div>
                                    <div class="graph-body-hour" value="09:00"></div>
                                    <div class="graph-body-hour" value="09:30"></div>
                                    <div class="graph-body-hour" value="10:00"></div>
                                    <div class="graph-body-hour" value="10:30"></div>
                                    <div class="graph-body-hour" value="11:00"></div>
                                    <div class="graph-body-hour" value="11:30"></div>
                                    <div class="graph-body-hour" value="12:00"></div>
                                    <div class="graph-body-hour" value="12:30"></div>
                                    <div class="graph-body-hour" value="13:00"></div>
                                    <div class="graph-body-hour" value="13:30"></div>
                                    <div class="graph-body-hour" value="14:00"></div>
                                    <div class="graph-body-hour" value="14:30"></div>
                                    <div class="graph-body-hour" value="15:00"></div>
                                    <div class="graph-body-hour" value="15:30"></div>
                                    <div class="graph-body-hour" value="16:00"></div>
                                    <div class="graph-body-hour" value="16:30"></div>
                                    <div class="graph-body-hour" value="17:00"></div>
                                    <div class="graph-body-hour" value="17:30"></div>
                                    <div class="graph-body-hour" value="18:00"></div>
                                    <div class="graph-body-hour" value="18:30"></div>
                                    <div class="graph-body-hour" value="19:00"></div>
                                    <div class="graph-body-hour" value="19:30"></div>
                                    <div class="graph-body-hour" value="20:00"></div>
                                    <div class="graph-body-hour" value="20:30"></div>
                                    <div class="graph-body-hour" value="21:00"></div>
                                    <div class="graph-body-hour" value="21:30"></div>
                                    <div class="graph-body-hour" value="22:00"></div>
                                    <div class="graph-body-hour" value="22:30"></div>
                                    <div class="graph-body-hour" value="23:00"></div>
                                    <div class="graph-body-hour" value="23:30"></div>
                                    <div class="graph-body-hour" value="24:00"></div>
                                </div>
                            </div>
                        </c:forEach>   
                    </div>
                </div>
            </div>
            <div class="reservation-status">
                <div class="reservation-status-title">내 예약현황</div>
                <div class="reservation-status-table">
                    <table>
                        <thead>
                            <tr>
                                <th>이름</th>
                                <th>대여 날짜</th>
                                <th>내용</th>
                                <th></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="r" items="${reservationList}"> 
                                <tr>
                                    <td>${r.assName}</td>
                                    <td>${r.startDate} ${r.startTime} ~ ${r.endDate} ${r.endTime}</td>
                                    <td>${r.reserName}</td>
                                    <td><button class="reservation-status-cancel" onclick="cancelReservation(${r.reserNo})">취소</button></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
    <!-- 예약 Modal -->
    <div class="modal fade" id="reservationModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-xl" id="modal-dialog-id">
            <div class="modal-content">
                <form action="" method="post">
                    <div class="modal-header" id="modal-header-id">
                        <button type="button" id="close-btn2" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        <h4 class="modal-title" id="modal-title-id">예약</h4>
                        <div>
                            <button type="submit" class="form-button3">등록</button>
                            <button type="button" class="form-button2" id="fakeBtn" onclick="executeCloseButton2()">취소</button>
                        </div>
                    </div>
                        <div class="modal-body" id="modal-body-id">
                            <table class="modal-table">
                                <tr>
                                    <th>이름</th>
                                    <td><input type="text" class="modal-input" id="assetName" name="assName" readonly></td>
                                </tr>
                                <tr>
                                    <th id="modal-table-th-date">일시</th>
                                    <td>
                                        <input type="date" class="modal-input-date">
                                        <input type="time" class="modal-input-date" id="reservation-time-start" value="00:00">
                                        ~
                                        <input type="date" class="modal-input-date">
                                        <input type="time" class="modal-input-date">
                                    </td>
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <td><input type="text" class="modal-input2"></td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <script src="resources/reservation/js/reservation.js"></script>
</body>
</html>