<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="header.jsp"%>
<!-- Form 1 -->
<section class="pt-120 pb-120 bg-dark form_1"
	data-bg-src="<%=request.getContextPath()%>/asset/i/ham_back.jpg"
	data-bg-src-2x="<%=request.getContextPath()%>/asset/i/ham_back.jpg">

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
				console.log(data)
               
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $('#post_num').val(data.zonecode);
                $('#sido').val(data.sido);
                document.getElementById('gungu').value = data.sigungu;
                document.getElementById('dong').value = data.bname;
                
                
                document.getElementById("detail").focus();
                // 커서를 상세주소 필드로 이동한다.
            }
        }).open();
    }
</script>

<script>
console.log("<%=session.getAttribute("mem_id")%>")
	if("<%=session.getAttribute("mem_id")%>" != "null"){
		location.href = "<%=request.getContextPath()%>/main.do";
	}

</script>

	<div id="selectJoinType" class="container text-center px-xl-0">

		<div class="card px-30 mx-50 rounded-lg  d-inline-block"
			style="width: 25rem;">
			<img src="<%=request.getContextPath() %>/asset/i/hamburger.png"
				class="card-img-top" alt="...">
			<div class="card-body">
				<h2 class="card-title  text-center">일반 회원</h2>

				<button id="member_join_button" type="button"
					class="btn btn-primary border text-dark">가입하러가기</button>
			</div>
		</div>


		<div class="card px-30  mx-50 rounded-lg  d-inline-block"
			style="width: 25rem;">
			<img src="<%=request.getContextPath()%>/asset/i/store2.png"
				class="card-img-top" alt="...">
			<div class="card-body">
				<h2 class="card-title  text-center">매장 회원</h2>

				<button id="store_join_button" type="button"
					class="btn btn-primary border text-dark">가입하러가기</button>
			</div>
		</div>
	</div>



	<div id="memberForm" class="container px-xl-0 d-none">
		<form action="<%=request.getContextPath()%>/user/join.do"
			method="post"
			class="bg-light mx-auto mw-600 radius10 pt-40 px-50 pb-30">
			<h2 class="mb-40 small text-center" data-aos="fade-up"
				data-aos-delay="0">회원가입</h2>
			<div class="mb-20 input_holder text-center" data-aos="fade-up"
				data-aos-delay="150">
				<input type="text" id = "id" required name="mem_id" placeholder="아이디 입력" data-reg="false"
					class="input border-gray focus-action-1 color-heading placeholder-heading w-370" />
				<button type="button"
					class="btn btn-outline-danger text-dark border btn-sm idcheck">
					중복확인</button><br>
					<span class="idresult "></span>
					<span class ="sp"></span>
				<div class = "msg" id = "namemsg"></div>
			</div>
			

			<div class="mb-20 input_holder" data-aos="fade-up"
				data-aos-delay="150">
				<input type="password" required id = "pass" name="mem_pw" data-reg="false"  placeholder="영문 + 숫자 20자리 이내로 입력 해주세요"
					class="input border-gray focus-action-1 color-heading placeholder-heading w-full" />
				<span class ="sp"></span>
				<div class = "msg" id = "namemsg"></div>
			</div>

			<div class="mb-20 input_holder" data-aos="fade-up"
				data-aos-delay="150">
				<input type="password" required id = "pass2" name="password2" data-reg="false" placeholder="영문 + 숫자 20자리 이내로 입력 해주세요"
					class="input border-gray focus-action-1 color-heading placeholder-heading w-full" />
				<span class ="sp"></span>
				<div class = "msg" id = "namemsg"></div>
			</div>

			<div class="mb-20 input_holder" data-aos="fade-up"
				data-aos-delay="150">
				<input type="text" name="mem_name" required placeholder="이름 입력"
					class="input border-gray  focus-action-1 color-heading placeholder-heading w-full" />
			</div>
			<div class="mb-20 input_holder" data-aos="fade-up"
				data-aos-delay="150">
				<input type="email" id = "mail" required name="mem_email" data-reg="false" placeholder="이메일 입력"
					class="input border-gray focus-action-1 color-heading placeholder-heading w-330" />
					<button type="button"
					class="btn btn-outline-danger text-dark border btn-sm emailchk" id = "mailcheck1"style="text-align: center;">
					인증번호 전송</button>
				<div class = "msg" id = "namemsg"></div>
			</div>

			<div class="mb-20 input_holder" data-aos="fade-up"
				data-aos-delay="150">
				<input type="text" id = "mailinput" required name="mem_email2" placeholder="인증번호 입력"
					class="input border-gray focus-action-1 color-heading placeholder-heading w-360" />
					<button type="button"
					class="btn btn-outline-danger text-dark border btn-sm emailchk"  id = "mailcheck2">
					인증확인</button>
				<span class ="sp"></span>
				<div class = "msg" id = "namemsg"></div>	
			</div>

			<div class="mb-20 input_holder" data-aos="fade-up"
				data-aos-delay="150">
				<input type="text" name="mem_reg_num" required placeholder="생년월일 ex)000000 "
					class="input border-gray focus-action-1 color-heading placeholder-heading w-full" />
			</div>

			<div class="mb-20 input_holder" data-aos="fade-up"
				data-aos-delay="150">
				<input type="text" name="mem_tel" required placeholder="전화번호 입력"
					class="input border-gray focus-action-1 color-heading placeholder-heading w-full" />
			</div>

			<div class="mb-20 input_holder d-none" data-aos="fade-up"
				data-aos-delay="150">
				<div class="custom-control custom-radio">
					<input type="radio" name="mem_type_gb" value="1" checked
						id="jb-radio-1" class="custom-control-input "><label
						class="custom-control-label" for="jb-radio-1">일반회원</label>
				</div>

			</div>



			<div data-aos="fade-up" data-aos-delay="150">
				<input type="checkbox" name="adAccecpt" id="form_1_checkbox" checked
					class="input d-none border-gray focus-action-1" /> <label
					class="mt-25 color-heading w-full" for="form_1_checkbox">
					광고 수신 동의 여부 </label>
			</div>
			<div data-aos="fade-up" data-aos-delay="300">
				<button class="btn mt-25 action-1 w-full" >회원가입 하기</button>
			</div>
		</form>
	</div>


	<div id="storeMemberForm" class="container px-xl-0 d-none">
		<form action="<%=request.getContextPath()%>/user/joinStore.do"
			method="post"
			class="bg-light mx-auto mw-600 radius10 pt-40 px-50 pb-30">
			<h2 class="mb-40 small text-center" data-aos="fade-up"
				data-aos-delay="0">매장회원 회원가입</h2>
			<div class="mb-20 input_holder" data-aos="fade-up"
				data-aos-delay="150">
				<input type="text" id ="id1" required name="mem_id" placeholder="아이디 입력"
					class="input border-gray focus-action-1 color-heading placeholder-heading w-370" />
				<button type="button"
					class="btn btn-outline-danger text-dark border btn-sm idcheck">
					중복확인</button>
					<span class ="sp"></span>
				<div class = "msg" id = "namemsg"></div>
					<span class="idresult"></span>
			</div>

			<div class="mb-20 input_holder" data-aos="fade-up"
				data-aos-delay="150">
				<input type="password" id = "pass3" required name="mem_pw" placeholder="영문 + 숫자 20자리 이내로 입력 해주세요"
					class="input border-gray focus-action-1 color-heading placeholder-heading w-full" />
				<span class ="sp"></span>
				<div class = "msg" id = "namemsg"></div>
			</div>

			<div class="mb-20 input_holder" data-aos="fade-up"
				data-aos-delay="150">
				<input type="password" id = "pass4" required name="password2" placeholder="영문 + 숫자 20자리 이내로 입력 해주세요"
					class="input border-gray focus-action-1 color-heading placeholder-heading w-full" />
				<span class ="sp"></span>
				<div class = "msg" id = "namemsg"></div>
			</div>

			<div class="mb-20 input_holder" data-aos="fade-up"
				data-aos-delay="150">
				<input type="text" name="mem_name" required placeholder="이름 입력"
					class="input border-gray focus-action-1 color-heading placeholder-heading w-full" />
			</div>
			
			<div class="mb-20 input_holder" data-aos="fade-up"
				data-aos-delay="150">
				<input type="email" id = "smail" required name="mem_email" placeholder="이메일 입력"
					class="input border-gray focus-action-1 color-heading placeholder-heading w-330" />
					<button type="button"
					class="btn btn-outline-danger text-dark border btn-sm email " id = "mailcheck3">
					인증메일전송</button>
				<span class ="sp"></span>
				<div class = "msg" id = "namemsg"></div>	
			</div>
	
			<div class="mb-20 input_holder" data-aos="fade-up"
				data-aos-delay="150">
				<input type="text" id = "mailinput2" required name="mem_email2" placeholder="인증번호 입력"
					class="input border-gray focus-action-1 color-heading placeholder-heading w-360" />
					<button type="button"
					class="btn btn-outline-danger text-dark border btn-sm emailchk" id = "mailcheck4" >
					인증확인</button>
				<span class ="sp"></span>
				<div class = "msg" id = "namemsg"></div>	
			</div>

			<div class="mb-20 input_holder" data-aos="fade-up"
				data-aos-delay="150">
				<input type="text" name="mem_reg_num" required placeholder="생년월일 ex)000000 "
					class="input border-gray focus-action-1 color-heading placeholder-heading w-full" />
			</div>

			<div class="mb-20 input_holder" data-aos="fade-up"
				data-aos-delay="150">
				<input type="text" name="mem_tel" required placeholder="전화번호 입력"
					class="input border-gray focus-action-1 color-heading placeholder-heading w-full" />
			</div>

			<div class="mb-20 input_holder d-none" data-aos="fade-up"
				data-aos-delay="150">
				<div class="custom-control custom-radio">
					<input type="radio" name="mem_type_gb" value="2" checked
						id="jb-radio-2" class="custom-control-input"> <label
						class="custom-control-label" for="jb-radio-2">지점회원</label>
				</div>
			</div>

			<div data-aos="fade-up" data-aos-delay="150">
				<input type="checkbox" name="adAccecpt" id="form_2_checkbox" checked
					class="input d-none border-gray focus-action-1" /> <label
					class=" color-heading w-full" for="form_2_checkbox"> 광고 수신
					동의 여부 </label>
			</div>

			<hr>
			<!-- 지점 정보 추가 -->

			<div class="mb-20 input_holder" data-aos="fade-up"
				data-aos-delay="150">
				<input type="text" name="sto_name" required placeholder="매장이름 입력"
					class="input border-gray focus-action-1 color-heading placeholder-heading w-full" />
			</div>

			<div class="mb-20 input_holder" data-aos="fade-up"
				data-aos-delay="150">
				<input type="text" name="sto_tel" required placeholder="매장 전화번호 입력"
					class="input border-gray focus-action-1 color-heading placeholder-heading w-full" />
			</div>

			<div class="mb-20 input_holder" data-aos="fade-up"
				data-aos-delay="150">
			
			
			 <div class="form-check d-inline-block">
			          <input class="form-check-input d-none"  type="radio" name="sto_brand" id="brand1" value="1" >
			          <label class="form-check-label" for="brand1">
			           	맥도날드
			          </label>
			        </div>
			        <div class="form-check  d-inline-block">
			          <input class="form-check-input d-none"  type="radio" name="sto_brand" id="brand2" value="2">
			          <label class="form-check-label" for="brand2">
			           	롯데리아
			          </label>
			          </div>
			          <div class="form-check  d-inline-block">
			          <input class="form-check-input d-none"  type="radio" name="sto_brand" id="brand3" value="3">
			          <label class="form-check-label" for="brand3">
			           	버거킹
			          </label>
			          </div>
			          <div class="form-check  d-inline-block">
			          <input class="form-check-input d-none"  type="radio" name="sto_brand" id="brand4" value="4">
			          <label class="form-check-label" for="brand4">
			           	맘스터치
			          </label>
			          </div>
			          <div class="form-check  d-inline-block">
			          <input class="form-check-input d-none"  type="radio" name="sto_brand" id="brand5" value="5">
			          <label class="form-check-label" for="brand5">
			           	파파이스
			          </label>
			      
			          
	        </div>
			
			</div>

			<div class="mb-20 input_holder" data-aos="fade-up"
				data-aos-delay="150">
				<input type="text" name="sto_opentoclose" required
					placeholder="매장 운영시간 ex(00:00 ~ 12:00)"
					class="input border-gray focus-action-1 color-heading placeholder-heading w-full" />
			</div>


			<!-- 주소정보 입력 -->
			<div class="mb-20 input_holder" data-aos="fade-up"
				data-aos-delay="150">
				<input type="text" id="post_num" name="add_post_num" placeholder="우편번호 입력" required
					class="input border-gray focus-action-1 color-heading placeholder-heading w-325" />
				<button type="button"  onclick="sample6_execDaumPostcode()"
					class="btn btn-outline-danger text-dark border btn-sm"
					id="postcheck">우편번호검색</button>

			</div>

			<div class="mb-20 input_holder" data-aos="fade-up"
				data-aos-delay="150">
				<input type="text" id="sido" required name="add_sido" placeholder="시 / 도 입력"
					class="input border-gray focus-action-1 color-heading placeholder-heading  w-full" />

			</div>
			<div class="mb-20 input_holder" data-aos="fade-up"
				data-aos-delay="150">
				<input type="text" id="gungu" required name="add_gungu" placeholder="군 / 구 입력"
					class="input border-gray focus-action-1 color-heading placeholder-heading w-full" />
			</div>
			<div class="mb-20 input_holder" data-aos="fade-up"
				data-aos-delay="150">
				<input type="text" id="dong" required name="add_dong" placeholder="동 입력"
					class="input border-gray focus-action-1 color-heading placeholder-heading w-full" />
			</div>

			<div class="mb-20 input_holder" data-aos="fade-up"
				data-aos-delay="150">
				<input type="text" id="detail" required name="add_detail" placeholder="상세주소 입력"
					class="input border-gray focus-action-1 color-heading placeholder-heading w-full" />
			</div>

			<div data-aos="fade-up" data-aos-delay="300">
				<button class="btn mt-25 action-1 w-full">회원가입 하기</button>
			</div>
		</form>

	</div>
	
	
	</section>
	
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
		idchPass = false;
	 	idPass = false;
	 	pwPass = false;
	 	pw2Pass= false;
	 	mailPass= false;
	 	
	 	
	 	idPassS = false;
	 	pwPassS = false;
	 	pw2PassS = false;
	 	mailPassS = false;
		$(".idcheck").on('click', function(){
			idvalue = $(this).parent('.input_holder').find(':input').val().trim();
			
			console.log(idvalue);
			
			if(!idvalue){
				alert("아이디가 없습니다");
			}else{                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          
				//ajax로 아이디 중복여부 가져오기
				$.ajax({
					url:'<%=request.getContextPath()%>/user/idCheck.do',
					type:'get',
					data : {"mem_id" : idvalue},
						success: function(res){
// 							console.log(res.chkId);
// 							alert(res.chkId);
							$('.idresult').text(res.chkId).addClass('text-center text-danger')
							if(res.success == "1"){
								$(this).parent('.input_holder').find(':input').attr('readonly'.true)
								idchPass = true;
							}else{
								idchPass = false;
							}
						},
						error : function(req){
							
						},
						dataType : 'json'
				});                           
			}
		});
		
		//지점회원 인증메일 보내기
		$("#mailcheck3").on('click',function(){
			email = $("#smail").val();
			$.ajax({
				url : '<%=request.getContextPath()%>/user/SendEmail.do',
				type : 'post',
				data : {"email" : email},
				success : function(res) {
					alert(res);					
				},
				error : function (req){
					alert("req : " + req.status);
				},
				dataType : 'html'
			});
		})
		//지점회원 인증확인
		$("#mailcheck4").on('click',function(){
			mailinput = $("#mailinput2").val();
			$.ajax({
				url : '<%=request.getContextPath()%>/user/GetEmail.do',
				type : "post",
				data : {"mailinput" : mailinput},
				success : function(res) {
					alert(res);	
				},
				error : function (req){
					alert("req : " + req.status);
				},
				dataType : 'html'
			});
		})
		//일반회원 인증메일보내기
		$("#mailcheck1").on('click',function(){
			email = $("#mail").val();
			$.ajax({
				url : '<%=request.getContextPath()%>/user/SendEmail.do',
				type : 'post',
				data : {"email" : email},
				success : function(res) {
					alert(res);					
				},
				error : function (req){
					alert("req : " + req.status);
				},
				dataType : 'html'
			});
		})
		//일반회원 인증번호입력
		$("#mailcheck2").on('click',function(){
			mailinput = $("#mailinput").val();
			
			
			$.ajax({
				url : '<%=request.getContextPath()%>/user/GetEmail.do',
				type : "post",
				data : {"mailinput" : mailinput},
				success : function(res) {
					alert(res);
					if(res=="인증완료"){
						mailPass= true;
						mailPassS = true;
					}else{
						mailPass= false;
						mailPassS = false;
					}
					
					
				},
				error : function (req){
					alert("req : " + req.status);
				},
				dataType : 'html'
			});
		})
		//일반회원 
		$("#id").on("keyup",function(){
			idval = $("#id").val().trim();
			
			regid = /^[a-z][a-zA-Z0-9]{3,11}$/;
			
			if(!regid.test(idval)){
				regfail(this,"올바른 형식이 아닙니다");
				idPass= false;
			}else{
				regpass(this,"");
				idPass= true;
			}
		})
		//일반회원 
		$("#pass").on("keyup",function(){
			passval = $(this).val().trim();
			regpwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
			
			if(!regpwd.test(passval)){
				regfail(this,"올바른 형식이 아닙니다");
				pwPass= false;
			}
			else if(regpwd.test(passval)){
				regfail(this,"사용가능한 비밀번호 입니다");
				pwPass= true;
			}
			else{
				regpass(this);
			}
		});
		//일반회원 
		$("#pass2").on("keyup",function(){
			pass2val = $(this).val().trim();
			passval = $("#pass").val().trim();
			
			if(pass2val == passval) {
				regpass(this,"비밀번호가 일치 합니다");
				pw2Pass= true;
			}
			else{ 
				regfail(this,"일치하지 않습니다");
				pw2Pass= false;
			}
		});
		//일반회원 
		$('#mail').on('keyup', function() {
			emailval = $(this).val().trim();
			regemail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;

			if (!(regemail.test(emailval))) {
				regfail(this , "올바른 형식이 아닙니다.");

			} else {
				regpass(this);
			}
		});
		
		//매장회원 
		$("#id1").on("keyup",function(){
			idval = $("#id1").val().trim();
			
			regid = /^[a-z][a-zA-Z0-9]{3,11}$/;
			
			if(!regid.test(idval)){
				regfail(this,"올바른 형식이 아닙니다");
				idPassS = false;
			}else{
				regpass(this,"");
				idPassS = true;
			}
		})
		//매장회원 
		$("#pass3").on("keyup",function(){
			passval = $(this).val().trim();
			regpwd = /^.*(?=.{6,20})(?=.*[0-9])(?=.*[a-zA-Z]).*$/;
			
			if(!regpwd.test(passval)){
				regfail(this,"올바른 형식이 아닙니다");
				pwPassS = false;
			}
			else if(regpwd.test(passval)){
				regfail(this,"사용가능한 비밀번호 입니다");
				pwPassS = true;
			}
			else{
				regpass(this);
			}
		});
		//매장회원 
		$("#pass4").on("keyup",function(){
			pass2val = $(this).val().trim();
			passval = $("#pass3").val().trim();
			
			if(pass2val == passval){ regpass(this,"비밀번호가 일치 합니다"); pw2PassS = true;
			}else {regfail(this,"일치하지 않습니다"); pw2PassS = false;}
		});
		//매장회원 
		$('#mail2').on('keyup', function() {
			emailval = $(this).val().trim();
			regemail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;

			if (!(regemail.test(emailval))) {
				regfail(this , "올바른 형식이 아닙니다.");

			} else {
				regpass(this);
			}
		});
		
		
		function regpass(target,text) {
			
			$(target).parents(".mb-20").find('.msg').empty();
			$(target).parents(".mb-20").find('.msg').html(text).css('color','red').addClass('text-center text-danger');
		}
		
		function regfail(target, text) {
			$(target).parents(".mb-20").find('.msg').empty();
			$(target).parents(".mb-20").find('.msg').html(text).css('color','red').addClass('text-center text-danger');
			
		}
		
// 		function memRegCheck(){
// 			console.log(idchPass)
// 			console.log(idPass)
// 			console.log(pwPass)
// 			console.log(pw2Pass)
// 			console.log(mailPass)
			
// 			if( !idchPass || !idPass || !pwPass || !pw2Pass || !mailPass	){
// 				alert('형식이 맞지않는 문항이 있습니다.');
// 				return false;
// 			}else{
// 				document.memberForm.submit();
// 			}
// 		}
	</script>
<%@ include file="footer.jsp"%>