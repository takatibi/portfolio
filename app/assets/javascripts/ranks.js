$(function(){
	$(".ranks-box2").hover(
		function(){
			$(this).find(".ranks-hover").addClass("hover-add")
		},
		function(){
			$(this).find(".ranks-hover").removeClass("hover-add")
		});
});