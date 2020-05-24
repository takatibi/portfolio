

$(function(){
	// スクロールして何ピクセルでアニメーションさせるか
	var px_change = 450;
	// スクロールのイベントを登録

	// 全てに'scroll'が効いてしまう為「btn-backtotop」がある所にだけ効かすようにif文で定義。
	if (document.getElementById( "btn-backtotop" ) != null){

		window.addEventListener('scroll', function(e) {
			var scrollTop = window.pageYOffset || document.documentElement.scrollTop;
				// 300px以上スクロールするとボタンを作成。（fadeinクラスを作成）
				if ( scrollTop > px_change ) {
					document.getElementById( "btn-backtotop" ).classList.add( "fadein" );

				// 300px以内になればボタンが消える（fadeinボタンを削除）
				} else {
					document.getElementById( "btn-backtotop" ).classList.remove( "fadein" );
				}
		});
			document.getElementById( "btn-backtotop" ).addEventListener('click', function(e) {
				$('html, body').animate({
	        		scrollTop: $('.js-section').offset().top
	    		}, 800);
			});
	};


	// ⬇︎クリックアクション⬇︎

	// ブログindex
	$(".blog-index-title h1").click(function(){
		$(this).css({"color":"lime",
					 "text-shadow":"3px 3px 3px black",
					 "font-weight":"800",
					 "text-stroke":"1px black"});
	});

	// ブログnew
	$(".blog-main-new h1").click(function(){
		$(this).css({"color":"lime",
					"text-shadow":"3px 3px 3px black",
					"font-weight":"800",
					"text-stroke":"1px black"});
	});

	// ブログshow
	$(".blog-show-box2 h1").click(function(){
		$(this).css({"color":"lime",
					 "text-shadow":"3px 3px 3px black",
					 "font-weight":"800",
					 "text-stroke":"1px black"});
	});

	// ブログedit
	$(".blog-edit-main h1").click(function(){
		$(this).css({"color":"lime",
					 "text-shadow":"3px 3px 3px black",
					 "font-weight":"800",
					 "text-stroke":"1px black"});
	});
});


