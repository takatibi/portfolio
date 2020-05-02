

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
});


