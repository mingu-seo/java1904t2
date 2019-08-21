<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>영상의학과</title>
    <link href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700|Poppins&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR:400,500,700|Roboto:400,500,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/header.css">
    <link rel="stylesheet" href="/css/sub2-3.css">
    <link rel="stylesheet" href="/css/footer.css">
    <link rel="stylesheet" href="/css/reset.css">
    <script type="text/javascript" src="/js/jquery-3.4.1.min.js"></script>
    <script type="text/javascript" src="/js/custom.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/view/include/headHtml.jsp" %>
    <div id="container">
        <!-- con1 : 배너 사진 부분-->
        <div class="con1"></div>
        <!-- con2 : 메인 부분 -->
        <div class="con2">
            <!-- sub bar 부분 (고정) -->
            <div class="fixed-sub">
                <div class="title-area">
                    <h2>진료과목</h2>
                    <p>information</p>
                </div>
                <ul class="sub-bar">
                    <li ><a href="/department/surgery.do">외과</a></li>
                    <li><a href="/department/internal.do">내과</a></li>
                    <li class="on"><a href="/department/radiology.do">영상의학과</a></li>
                    <li><a href="/department/emergency.do">응급중환자의료센터</a></li>
                </ul>
            </div>
 <!-- main 부분 (여기다가 하면 됨) -->
            <div class="main">
                <h3>영상의학과</h3>
                <p>Department of Radiology</p>
                <div class="medicine-box clear">
                    <div class="medicine-info">
                        <div class="medicine-img">
                            <a href="#">
                                <div class="medicine-hover">
                                    <div class="medicine-opa">
                                        <h4>방사선 검사</h4>
                                        <h6>Radiation examination</h6>
                                        <img src="/icon/medicine-class.png">
                                    </div>
                                </div>
                            </a>
                        </div>
                        <div class="Medicine-text">
                            <h3>방사선 검사</h3>
                            <h5>방사선 검사에서는 보다 신속하고 세밀한 x-ray 사진을 바탕으로 정확한 진단을 하기 위해 디지털 x-ray 장비(Digital Radiography, DR)을 사용하고 있습니다. 호흡기, 심장 등 흉강 평가, 소화기 및 복강 장기 등 복강 평가 및 골격 및 관절 부위 평가 등 환자 전반에 걸친 기본적인 질병 정보를 얻을 수 있습니다.</h5>
                        </div>
                    </div>
                    <div class="medicine-info">
                        <div class="medicine-img">
                            <a href="#">
                            <div class="medicine-hover">
                                <div class="medicine-opa">
                                    <h4>초음파 검사</h4>
                                    <h6>Ultrasound examination</h6>
                                    <img src="/icon/medicine-class.png">
                                </div>
                            </div>
                            </a>
                        </div>
                        <div class="Medicine-text">
                            <h3>초음파 검사</h3>
                            <h5>복강 내 간, 비장, 신장, 부신, 췌장, 난소, 자궁 전립선, 위장관 등 장기의 이상을 평가하는 초음파 검사는 혈액 검사와 방사선 검사만으로는 정확한 평가가 어려운 여러 가지 질병에 매우 유용한 검사 방법입니다.</h5>
                        </div>
                    </div>
                    <div class="medicine-info">
                        <div class="medicine-img">
                            <a href="#">
                            <div class="medicine-hover">
                                <div class="medicine-opa">
                                    <h4>컴퓨터 단층 촬영 검사</h4>
                                    <h6>Computed tomography</h6>
                                    <img src="/icon/medicine-class.png">
                                </div>
                            </div>
                            </a>
                        </div>
                        <div class="Medicine-text">
                            <h3>컴퓨터 단층 촬영 검사</h3>
                            <h5>CT 검사를 통해서는 일반 방사선 검사에서는 보이지 않는 폐 미세 결절이나, 주변 구조의 겹침으로 평가가 어려운 비강 내 병변, 초음파 검사로는 평가하기 어려운 복강 내 종괴의 기원 등 기존 영상 검사로는 어려운 진단이 가능하며, 특히 외과 수술 시 정확한 해부학적 정보를 제공합니다. 본원에서는 최신 16 channel MDCT를 이용하여 최소의 검사 시간 내에 많은 영상 정보를 얻을 수 있습니다.</h5>
                        </div>
                    </div>
                    <div class="medicine-info">
                        <div class="medicine-img">
                            <a href="#">
                            <div class="medicine-hover">
                                <div class="medicine-opa">
                                    <h4>최신 영상 기법</h4>
                                    <h6>New imaging techniques</h6>
                                    <img src="/icon/medicine-class.png">
                                </div>
                            </div>
                            </a>
                        </div>
                        <div class="Medicine-text">
                            <h3>최신 영상 기법</h3>
                            <h5>심장 초음파(Strain/strain rate imaging) Strain은 심근 조직의 변형된 정도를 말하며 strain rate란 심근 변형의 속도를 의미합니다. 본원에서는 최신 speckle tracking imaging 기법을 통해 심장 각 구역의 심근의 길이 변화를 측정하여 보다 정확한 심근 기능 평가를 실시하고 있습니다.</h5>
                        </div>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
    <!-- footer -->
   <%@ include file="/WEB-INF/view/include/footer.jsp" %>
</body>
</html>