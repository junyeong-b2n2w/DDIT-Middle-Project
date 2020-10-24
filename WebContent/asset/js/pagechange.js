$("#myinfo_button").on("click", function () {
  $(this).addClass("active").removeClass("text-dark");
  $("#recent_order_button").removeClass("active").addClass("text-dark");
  $("#address_list_button").removeClass("active").addClass("text-dark");

  $("#userMyinfo").removeClass("d-none");
  $("#recent_order_list").addClass("d-none");
  $("#address_list").addClass("d-none");
  
});

$("#recent_order_button").on("click", function () {
  $(this).addClass("active").removeClass("text-dark");
  $("#myinfo_button").removeClass("active").addClass("text-dark");
  $("#address_list_button").removeClass("active").addClass("text-dark");

  $("#userMyinfo").addClass("d-none");
  $("#recent_order_list").removeClass("d-none");
  $("#address_list").addClass("d-none");
});


$("#address_list_button").on("click", function () {
  $(this).addClass("active").removeClass("text-dark");
  $("#myinfo_button").removeClass("active").addClass("text-dark");
  $("#recent_order_button").removeClass("active").addClass("text-dark");

  $("#address_list").removeClass("d-none");
  $("#recent_order_list").addClass("d-none");
  $("#userMyinfo").addClass("d-none");
});


// Add the following code if you want the name of the file appear on select
$(".custom-file-input").on("change", function () {
  var fileName = $(this).val().split("\\").pop();
  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
});

$("#event_button").on("click", function () {
  $(this).addClass("active").removeClass("text-dark");
  $("#notice_button").removeClass("active").addClass("text-dark");
  $("#qna_button").removeClass("active").addClass("text-dark");

  $("#event_list").removeClass("d-none");
  $("#notice_list").addClass("d-none");
  $("#qna_list").addClass("d-none");
});

$("#notice_button").on("click", function () {
  $(this).addClass("active").removeClass("text-dark");
  $("#event_button").removeClass("active").addClass("text-dark");
  $("#qna_button").removeClass("active").addClass("text-dark");

  $("#notice_list").removeClass("d-none");
  $("#event_list").addClass("d-none");
  $("#qna_list").addClass("d-none");
});

$("#qna_button").on("click", function () {
  $(this).addClass("active").removeClass("text-dark");
  $("#notice_button").removeClass("active").addClass("text-dark");
  $("#event_button").removeClass("active").addClass("text-dark");

  $("#qna_list").removeClass("d-none");
  $("#notice_list").addClass("d-none");
  $("#event_list").addClass("d-none");
});

$("#member_list_button").on("click", function () {
  $(this).addClass("active").removeClass("text-dark");
  $("#store_list_button").removeClass("active").addClass("text-dark");

  $("#member_list").removeClass("d-none");
  $("#store_list_info").addClass("d-none");
});

$("#store_list_button").on("click", function () {
  $(this).addClass("active").removeClass("text-dark");
  $("#member_list_button").removeClass("active").addClass("text-dark");

  $("#member_list").addClass("d-none");
  $("#store_list_info").removeClass("d-none");
});

$("#menu_button").on("click", function () {
  $(this).addClass("active").removeClass("text-dark");
  $("#review_button").removeClass("active").addClass("text-dark");
  $("#store_button").removeClass("active").addClass("text-dark");

  $("#menu_list").removeClass("d-none");
  $("#review_list").addClass("d-none");
  $("#store_info_list").addClass("d-none");
});

$("#review_button").on("click", function () {
  $(this).addClass("active").removeClass("text-dark");
  $("#menu_button").removeClass("active").addClass("text-dark");
  $("#store_button").removeClass("active").addClass("text-dark");

  $("#menu_list").addClass("d-none");
  $("#review_list").removeClass("d-none");
  $("#store_info_list").addClass("d-none");
});

$("#store_button").on("click", function () {
  $(this).addClass("active").removeClass("text-dark");
  $("#menu_button").removeClass("active").addClass("text-dark");
  $("#review_button").removeClass("active").addClass("text-dark");

  $("#menu_list").addClass("d-none");
  $("#review_list").addClass("d-none");
  $("#store_info_list").removeClass("d-none");
});

$(".cnt_plus").on("click", function () {
  input = $(this).parents(".menu_count").find("input").val();

  console.log(input);
  $(this)
    .parents(".menu_count")
    .find("input")
    .val(parseInt(input) + 1);
});
$(".cnt_minus").on("click", function () {
  input = $(this).parents(".menu_count").find("input").val();

  console.log(input);
  $(this)
    .parents(".menu_count")
    .find("input")
    .val(parseInt(input) - 1);
});

$("#order_list_button").on("click", function () {
  $(this).addClass("active").removeClass("text-dark");
  $("#store_info_button").removeClass("active").addClass("text-dark");
  $("#store_review_button").removeClass("active").addClass("text-dark");
  $("#sales_button").removeClass("active").addClass("text-dark");

  $("#order_list").removeClass("d-none");
  $("#store_info").addClass("d-none");
  $("#store_review").addClass("d-none");
  $("#sales").addClass("d-none");
});

$("#store_info_button").on("click", function () {
  $(this).addClass("active").removeClass("text-dark");
  $("#order_list_button").removeClass("active").addClass("text-dark");
  $("#store_review_button").removeClass("active").addClass("text-dark");
  $("#sales_button").removeClass("active").addClass("text-dark");

  $("#store_info").removeClass("d-none");
  $("#order_list").addClass("d-none");
  $("#store_review").addClass("d-none");
  $("#sales").addClass("d-none");
});

$("#store_review_button").on("click", function () {
  $(this).addClass("active").removeClass("text-dark");
  $("#store_info_button").removeClass("active").addClass("text-dark");
  $("#order_list_button").removeClass("active").addClass("text-dark");
  $("#sales_button").removeClass("active").addClass("text-dark");

  $("#store_review").removeClass("d-none");
  $("#store_info").addClass("d-none");
  $("#order_list").addClass("d-none");
  $("#sales").addClass("d-none");
});

$("#sales_button").on("click", function () {
  $(this).addClass("active").removeClass("text-dark");
  $("#store_info_button").removeClass("active").addClass("text-dark");
  $("#store_review_button").removeClass("active").addClass("text-dark");
  $("#order_list_button").removeClass("active").addClass("text-dark");

  $("#sales").removeClass("d-none");
  $("#store_info").addClass("d-none");
  $("#store_review").addClass("d-none");
  $("#order_list").addClass("d-none");
});


$('#member_join_button').on('click',function(){
	$('#selectJoinType').addClass('d-none');
	$('#memberForm').removeClass('d-none');
});

$('#store_join_button').on('click',function(){
	$('#selectJoinType').addClass('d-none');
	$('#storeMemberForm').removeClass('d-none');
});
