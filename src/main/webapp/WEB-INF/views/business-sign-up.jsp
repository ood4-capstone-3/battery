<!DOCTYPE html>
<html lang="ko" itemscope itemtype="http://schema.org/WebPage">

    <head>
        <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <!--bootstrap-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

        <!-- favicon ?????? -->
        <link rel="apple-touch-icon" sizes="76x76" href="${pageContext.request.contextPath}/assets/img/ssac.png">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/assets/img/ssac.png">

        <title>
            회원가입
        </title>

        <!--font ??????-->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@800&display=swap" rel="stylesheet">
        <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
        <!--css file-->
        <link id="pagestyle" href="${pageContext.request.contextPath}/assets/css/material-kit.css" rel="stylesheet" />
        <!-- Link Swiper's CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css" />


    </head>

    <body class="about-us bg-gray-100">  
        <script>
            <c:choose>
                <c:when test="${result eq 'true' }">
            alert("사용가능한 아이디입니다.");
                </c:when>

                <c:when test="${result eq 'false' }">
            alert("사용할 수 없는 아이디입니다.");
                </c:when>

            </c:choose>

            function validate() {
                var re1 = /^[A-Za-z0-9]{8,16}$/;
                var re2 = /^[0-9]{4,4}$/;
                var re3 = /^[가-힣]*$/;


                var pass = document.getElementById("password");
                var phone1 = document.getElementById("phone2");
                var phone2 = document.getElementById("phone3");
                var name = document.getElementById("name");

                if (!check(re1, pass, "비밀번호는 8~16자의 영문 대소문자와 숫자로만 입력")) {
                    return false;
                }
                if (!check(re2, phone1, "전화번호는 숫자로만 입력할 수 있으며 4자리를 입력")) {
                    return false;
                }
                if (!check(re2, phone2, "전화번호는 숫자로만 입력할 수 있으며 4자리를 입력")) {
                    return false;
                }
                if (!check(re3, name, "대표자 명은 한글만 입력")) {
                    return false;
                }
                document.getElementById('keyword').value = document.getElementById('selectedSubcategories').innerText;
                sessionStorage.removeItem("user");
                function check(re, what, message) {
                    if (re.test(what.value)) {
                        return true;
                    }
                    alert(message);
                    what.value = "";
                    what.focus();
                }
            }
        </script>
        <!-- Navbar-->
        <nav class="navbar navbar-light py-3">
            <div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}" rel="tooltip" title="WeUs"
                   data-placement="bottom">
                    <h4>보조배터리</h4>
                </a>
            </div>
            <div class="w-100 d-none d-md-block"></div>
            <div class="container">
                카테고리 뭐 들어가야 했더랑 까묵쓰
            </div>
        </nav>
        <!--end navbar-->
        <!--start 본문-->
        <!--현재 모바일 버전으로 하면 중앙 정렬 안됨... 수정 필요-->
        <div class="card card-body shadow-xl mx-2 mx-md-6 mt-8">
            <section class="py-7">
                <div class="container">
                    <div class="row align-items-center justify-content-start">
                        <p class="font-weight-bold text-2xl text-gradient-dark">비즈니스 회원가입</p>
                        <form id="contact-form" method="post" onsubmit="return validate();" autocomplete="off" action="${pageContext.request.contextPath}/ceo_signup.do">                           
                            <table class="table">
                                <colgroup>
                                    <col style="width: 20%;">
                                    <col style="width: 80%;">
                                </colgroup>
                                <tbody>
                                    <tr>
                                        <th scope="row">
                                            <label for="id" class="text-black">아이디</label>
                                            <span class="text-warning">*</span>
                                        </th>
                                        <td>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="input-group input-group-outline">
                                                        <input type="text" id="userid" name="userid" class="form-control"
                                                               value ="${user}" onkeyup="checkReg(event)" required >
                                                    </div>
                                                    <small>4~12자의 영문 대소문자와 숫자로만 입력</small>
                                                </div>
                                                <div class="col-auto">
                                                    <button type="button" class="btn btn-outline-info" onclick ="check_bId()">중복 확인</button>
                                                    <!--중복 확인 관련 나중에 할거임-->
                                                    <script>
                                                        function check_bId() {
                                                            var userid = document.getElementById("userid").value;
                                                            var re = /^[a-zA-Z0-9]{4,12}$/
                                                            var id = document.getElementById("userid");

                                                            if (!userid) {
                                                                alert("아이디를 입력해주세요");
                                                            } else if (!check(re, id, "아이디는 4~12자의 영문 대소문자와 숫자로만 입력")) {
                                                                return false;
                                                            } else {
                                                                const link = 'check_bId.do?userid=' + userid;
                                                                location.replace(link);
                                                            }
                                                            function check(re, what, message) {
                                                                if (re.test(what.value)) {
                                                                    return true;
                                                                }
                                                                alert(message);
                                                                what.value = "";
                                                                what.focus();
                                                            }
                                                        }
                                                    </script>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <label for="password" class="text-black">비밀번호</label>
                                            <span class="text-warning">*</span>
                                        </th>
                                        <td>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="input-group input-group-outline">
                                                        <input type="password" id="password" name="password"
                                                               class="form-control" required>
                                                    </div>
                                                    <small>8~16자의 영문 대소문자와 숫자로만 입력</small>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <label for="name" class="text-black">기업 명</label>
                                            <span class="text-warning">*</span>
                                        </th>
                                        <td>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="input-group input-group-outline">
                                                        <input type="text" id="com_name" name="com_name" class="form-control"
                                                               required>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <label for="name" class="text-black">대표자 명</label>
                                            <span class="text-warning">*</span>
                                        </th>
                                        <td>
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="input-group input-group-outline">
                                                        <input type="text" id="name" name="name" class="form-control"
                                                               required>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <label for="phone" class="text-black">전화번호</label>
                                            <span class="text-warning">*</span>
                                        </th>
                                        <td>
                                            <div class="row">
                                                <div class="col-4 col-md-2">
                                                    <!--전화번호 앞 3자리-->
                                                    <select id="phone1" name="phone1" class="form-select ps-md-2" required>
                                                        <option value="">식별번호</option>
                                                        <option value="010">010</option>
                                                        <option value="011">011</option>
                                                        <!-- 옵션 추가 더 할거 있나?-->
                                                    </select>
                                                </div>
                                                <div class="col-4 col-md-2">
                                                    <!--전화번호 중간 4자리-->
                                                    <div class="input-group input-group-outline">
                                                        <input type="text" id="phone2" name="phone2" class="form-control" maxlength="4" onKeydown="this.value = this.value.replace(/[^0-9]/g, '');"
                                                               required>
                                                    </div>
                                                </div>
                                                <div class="col-4 col-md-2">
                                                    <!--전화번호 끝 4자리-->
                                                    <div class="input-group input-group-outline">
                                                        <input type="text" id="phone3" name="phone3" class="form-control" maxlength="4" onKeydown="this.value = this.value.replace(/[^0-9]/g, '');"
                                                               required>
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <label for="phone" class="text-black">주소</label>
                                            <span class="text-warning">*</span>
                                        </th>
                                        <td>
                                            <div class="row">
                                                <div class="col-md-6 pb-2">
                                                    <div class="input-group input-group-outline">
                                                        <input type="text" id="postcode" name="postcode" placeholder="우편번호"
                                                               class="form-control ">
                                                    </div>
                                                </div>
                                                <div class="col-auto pb-2">
                                                    <button type="button" class="btn btn-outline-info"
                                                            onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
                                                </div>
                                                <div class="col-md-7 pb-2">
                                                    <div class="input-group input-group-outline">
                                                        <input type="text" id="address" name="address" placeholder="주소"
                                                               class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-md-7 pb-2">
                                                    <div class="input-group input-group-outline">
                                                        <input type="text" id="detail" name="detail" placeholder="상세주소"
                                                               class="form-control">
                                                    </div>
                                                </div>
                                                <div class="col-md-7">
                                                    <div class="input-group input-group-outline">
                                                        <input type="text" id="extra" name="extra" placeholder="참고항목"
                                                               class="form-control">
                                                    </div>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th scope="row">
                                            <label for="interest" class="text-black">관심사</label>
                                        </th>
                                        <td>
                                            <div class="col-md-6">
                                                <select id="category" class="form-select ps-md-2">
                                                    <option value="">대분류 선택</option>
                                                    <option value="it">IT</option>
                                                    <option value="selfImpro">자기계발</option>
                                                    <option value="music">음악</option>
                                                    <option value="economy">경제</option>
                                                    <option value="art">미술</option>
                                                    <option value="engin">공학</option>
                                                    <option value="media">미디어</option>
                                                    <option value="language">언어</option>
                                                </select>
                                                <div id="subcategoryContainer" style="display: none">

                                                </div>
                                                <div id="selectedSubcategories"></div>
                                                <input type="hidden" id="keyword" name="keyword">
                                                <script>
                                                    function subcatergory() {
                                                        document.getElementById('keyword').value = document.getElementById('selectedSubcategories').innerText;
                                                        sessionStorage.removeItem("user");
                                                    }
                                                </script>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                    </tr>
                                </tbody>
                            </table>
                            <div class="col-auto text-center pt-4">
                                <button type="submit" class="btn btn-info ">회원 가입</button>
                            </div>
                        </form>
                    </div>
                </div>
        </div>
    </section>
    <script>
        function checkReg(event) {
            const regExp = /[^0-9a-zA-Z]/g; // 영어 및 숫자만 허용
            //   const regExp = /[^ㄱ-ㅎ|가-힣]/g; // 한글만 허용
            const del = event.target;
            if (regExp.test(del.value)) {
                del.value = del.value.replace(regExp, '');
            }
        }
        ;
    </script>
</body>

<script src="./assets/material-kit.min.js?v=3.0.4" type="text/javascript"></script> <!--이거 있어야 입력 폼 애니메이션 들어감-->
<script type="text/javascript" src="${pageContext.request.contextPath}/js/info.js" ></script>
</html>
