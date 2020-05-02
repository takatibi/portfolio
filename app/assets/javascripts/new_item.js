
$(function(){

  // 画像が選択される前に選択されていた画像。
  var previous_files;
  // 写真を保持する箱を配列で作る
  var dataBox = [];
  //「querySelector」でfile_fieldを取得
  var file_field = document.querySelector('input[type=file]')
  $(file_field).attr("name", "dummy")


// -------------------------------------------
  // ボタンをクリックした時に発火されるイベント
  // 関数をクリックに渡している
  $('#img-file').click(function () {
    previous_files = $('input[type="file"]').prop('files');
    // inputタグのtype属性がfileになっているものを全て取ってくる。
    // 取ってきてfileの中から更にfilesプロパティを全て取ってくる。
    // 取ってきたfilesを配列で変数に入れている。
    // すでに選択されている画像をpropで所得して保持する
  // -------------------------------------------------


    // 変更の時のイベント(on.chenge)
  }).change(function(){

    //選択したfileのオブジェクトをpropで取得
    var files = $('input[type="file"]').prop('files');


    // chengeした『変更後」の画像をイーチで回す
    $.each(this.files, function(i, file){


      // 同じファイル名は除外
      var isExits = false
      $.each(dataBox, function(j, file2){
        if (file.name == file2.name){
          isExits = true
          return
          // dataBoxのループをreturnで抜ける
        }
      })

      if(isExits){
        return
      }


      // eachでFileReaderwoを作成している
      var fileReader = new FileReader();
      //「DataTransfer」の「items」に対して、「file」をeach文で１ファイルずつ追加している。
      dataBox.push(file)
      // 全体から「blog-image」クラスを滑れ探して来て、全体の数を取って来ている
      // eachで回した数が「i」。配列は０から数えるので＋１で合わしている
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

      // fileReaderの読み込みの完了イベントを登録
      fileReader.onloadend = function() {
        // 選択したファイルの内容が入っているのが「result」
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

        var text = imageChenge(src)
        createInputTag(text, file.name)
        
      };
      //image-box__containerのクラスを変更し、CSSでドロップボックスの大きさを変えてやる。
      $('#image-box__container').attr('class', `blog-num-${num}`)

    });

  });





  //削除ボタンをクリックすると発火するイベント
  // documentで全体から「blog-image__operetion--delete」を持つ要素を探してクリックイベントを登録
  $(document).on("click", '.blog-image__operetion--delete', function(){
    //削除を押されたプレビュー要素を取得
    //「parent」はそいつを囲っている親要素。今回でいう「blog-image」
    var target_image = $(this).parent().parent()
    //削除を押されたプレビューimageのfile名を取得
    var target_name = $(target_image).data('image')
    deleteInputTag(target_name)

    // 削除した後、HTML上ではまだ消えていない為、−１で消された後の数をチェックする。
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
    if(dataBox.length==1){
      //選択されている写真が１枚なので、削除された後は未選択にする。(「val」はvalueに内容をセットする)
      $('input[type=file]').val(null)
      // dataBox.clearData();
    }else{
      var _arr = [];
      // 選択した写真の総合数をeachで回す
      $.each(dataBox, function(i,input){
        //削除を押された要素と一致した時、index番号に基づいてdataBoxに格納された要素を削除する。removeは１つだけ消す。
        if(input.name!=target_name){
          _arr.push(input);
        }
      })
      dataBox = _arr;
    }


    //プレビューを削除
    target_image.remove()
    //image-box__containerクラスをもつdivタグのクラスを削除のたびに変更
    var num = $('.blog-image').length
    $('#image-box__container').show()
    $('#image-box__container').attr('class', `blog-num-${num}`)
  });

  function convertArray2FileList(array){
    var formData = new FormData();
    for(var i = 0; i < array.length; i++){
      formData.append("files[]", array[i]);
    }
    return formData.get("files");
  }




  function imageChenge(imege){
    var text = window.btoa(imege)
    return text
  }

  function createInputTag(text, filename){
    var input = $("<input type=text name='blog[image][]'>")
    input.attr("data-file_name", filename)
    input.val(text)

    var area = $("#image-text-area")
    area.append(input)
  }

   function deleteInputTag(file_name){
     var area = $("#image-text-area")
     var input = area.find("[data-file_name='" + file_name + "']")
     input.remove()
   }
});



























