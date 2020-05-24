// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage

//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .



$(function(){
	// スライダー
	$('.blog_slick').slick({
		autoplay:true,
		dots:true,
	});



	// ⬇︎クリックアクション⬇︎

	// ランキング順位
	$(".ranks-box h3").click(function(){
		$(this).css("color","red");
		$(this).css("text-shadow","3px 3px 3px black");
		$(this).css("font-weight","800");
	});
	$(".ranks-box h1").click(function(){
		$(".ranks-box h1").css("color","yellow")
		$(this).css("text-shadow","3px 3px 3px black");
		$(this).css("font-weight","800");
		$(this).css("text-stroke","1px black");
	});


	// ユーザーshow
	$(".show-box h2").click(function(){
		$(this).css("color","#0FF");
		$(this).css("text-shadow","3px 3px 3px black");
		$(this).css("font-weight","800");
		$(this).css("text-stroke","1px black");
	})

	// ユーザーedit
	$(".edit-box h3").click(function(){
		$(this).css("color","#0FF");
		$(this).css("text-shadow","3px 3px 3px black");
		$(this).css("font-weight","800");
		$(this).css("text-stroke","1px black");
	})

	// follow
	$(".follows-box h3").click(function(){
		$(this).css("color","#FF00FF");
		$(this).css("text-shadow","3px 3px 3px black");
		$(this).css("font-weight","800");
		$(this).css("text-stroke","1px black");
	})

	// 検索
	$(".search_results h2").click(function(){
		$(this).css("color","lime");
		$(this).css("text-shadow","3px 3px 3px black");
		$(this).css("font-weight","800");
		$(this).css("text-stroke","1px black");
	})

});



























