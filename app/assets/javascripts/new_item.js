
$(function(){
  //DataTransferオブジェクトで、データを格納する箱を作る。「formタグの様なもの」
  var dataBox = new DataTransfer();
  //querySelectorでfile_fieldを取得
  var file_field = document.querySelector('input[type=file]')
  //fileが選択された時に発火するイベント
  $('#img-file').change(function(){
    var dataBox = new DataTransfer();
    //選択したfileのオブジェクトをpropで取得
    var files = $('input[type="file"]').prop('files')[0];
    $.each(this.files, function(i, file){
      //FileReaderのreadAsDataURLで指定したFileオブジェクトを読み込む
      var fileReader = new FileReader();

      //「DataTransfer」の「items」に対して、「file」をeach文で１ファイルずつ追加している。
      dataBox.items.add(file)
      //DataTransferに入った画像ファイルをfile_fieldの中に代入して反映させている。
      file_field.files = dataBox.files

      var num = $('.blog-image').length + 1 + i
      fileReader.readAsDataURL(file);
      　　　 //画像が10枚になったら超えたらドロップボックスを削除する
      if (num >= 10){
        $('#new-image-button').css('display', 'none')
      }
        // disabledでボタン押せなくさせる
      if (num > 10){
        $('#submit-btn').attr('disabled', 'disabled')
      }

      //読み込みが完了すると、srcにfileのURLを格納
      fileReader.onloadend = function() {
        var src = fileReader.result
        // railsはsubmit（保存）しないと画像の個数や画像のデータが分からないので、JavaScript側でhtmlを作成してプレビューを画面に反映させている
        var html= `<div class='blog-image' data-image="${file.name}">
                    <div class=' blog-image__content'>
                    <div class='blog-image__content--icon'>
                    <img src=${src} width="114" height="80" >
                    </div>
                    </div>
                    <div class='blog-image__operetion'>
                    <div class='blog-image__operetion--delete'>削除</div>
                    </div>
                    </div>`

        //image_box__container要素の前にhtmlを差し込む事によって写真を次々と表示させている。
        $('#image-box__container').before(html);
      };
      //image-box__containerのクラスを変更し、CSSでドロップボックスの大きさを変えてやる。
      $('#image-box__container').attr('class', `blog-num-${num}`)
    });
    dataBox.clearData();
  });

  //削除ボタンをクリックすると発火するイベント
  $(document).on("click", '.blog-image__operetion--delete', function(){
  //削除を押されたプレビュー要素を取得
  var target_image = $(this).parent().parent()
  //削除を押されたプレビューimageのfile名を取得
  var target_name = $(target_image).data('image')

  // 削除した時に写真追加ボタンを表示させる
  var num = $('.blog-image').length - 1
  // 10枚より少なければ写真の追加ボタンを出す
  if (num < 10){
    $('#new-image-button').css('display', 'block')
  }
  // １０枚より少なければsubmitボタンを押せる
  if (num <= 10){
    $('#submit-btn').attr('disabled', false)
  }

  //プレビューがひとつだけの場合、file_fieldをクリア
  if(file_field.files.length==1){
    //inputタグに入ったファイルを削除
    $('input[type=file]').val(null)
    dataBox.clearData();
    console.log(dataBox)
  }else{
    //プレビューが複数の場合
    $.each(file_field.files, function(i,input){
      //削除を押された要素と一致した時、index番号に基づいてdataBoxに格納された要素を削除する
      if(input.name==target_name){
        console.log(i)
        dataBox.items.remove(i)
      }
    })
    //DataTransferオブジェクトに入ったfile一覧をfile_fieldの中に再度代入
    file_field.files = dataBox.files
  }
  dataBox.clearData();

  //プレビューを削除
  target_image.remove()
  //image-box__containerクラスをもつdivタグのクラスを削除のたびに変更
  var num = $('.blog-image').length
  $('#image-box__container').show()
  $('#image-box__container').attr('class', `blog-num-${num}`)
})


  //削除ボタンをクリックすると発火するイベント
  $(document).on("click", '.blog-image__operetion--delete', function(){
    //プレビュー要素を取得
    var target_image = $(this).parent().parent()
    //プレビューを削除
    target_image.remove();
    //inputタグに入ったファイルを削除
    file_field.val("")
  })
});