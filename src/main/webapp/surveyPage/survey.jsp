<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <title>Insert title here</title>
    <link rel="stylesheet" href="survey.css" />
    <link
      rel="stylesheet"
      type="text/css"
      href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"
    />
    <link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200;400;700;900&display=swap" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script
      type="text/javascript"
      src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"
    ></script>
  </head>
  <body>
    <div class="survey-container">
      <header class="tk_survey_header">
        <div class="top-left">
          <img
            src="imgFolder/logo.png"
            alt="logo"
            style="width: 100%; height: 100%"
          />
        </div>

        <div class="middle-title">
          <div>出席の方</div>
        </div>

        <div class="top-right">
          <img
            src="imgFolder/menu-btn.png"
            alt="menu-button"
            style="width: 100%; height: 100%"
          />
        </div>
      </header>

      <main class="tk_survey_main">
        <div class="main-content">
          <div class="main-content-words">
            <div>
              お手数ではございますが、ご出欠情報のご登録をお願い申し上げます。
            </div>
            <div style="margin-top: 0.5rem">
              2024.06.09までにご返信をお願いいたします。
            </div>
            <div>
              <img
                src="imgFolder/pointline.png"
                alt="menu-button"
                style="width: 100%; height: 100%"
              />
            </div>
            <div>
              <img
                src="imgFolder/arrowline.png"
                alt="menu-button"
                style="width: 100%; height: 100%"
              />
            </div>
          </div>
          
          <form action="SurveyC" method="post">

            <div class="tg-include-btu-page">

            <div class="slider-navigation">
              <button type="button" class="prev-slide">前へ</button>
            </div>

            <div class="survey-input">

              <div>
                <div class="tg-slide-page">
                  <div class="">
                    <div>ゲストカテゴリー</div>
                    <label>
                      <input name="couple" type="checkbox" value="groom" />
                      新郎側ゲスト
                    </label>
                    <label>
                      <input name="couple" type="checkbox" value="bride" />
                      新婦側ゲスト
                    </label>
                  </div>
                  <div class="relationship-container">
                    <div>作成者との関係</div>
                    <span>
                      <input name="relation" type="checkbox" value="groom" />
                      家族
                    </span>
                    <span>
                      <input name="relation" type="checkbox" value="bride" />
                      親友
                    </span>
                    <span>
                      <input name="relation" type="checkbox" value="bride" />
                      職場の同僚
                    </span>
                    <label>
                      <input name="relations" type="checkbox" value="bride" />
                      その他
                    </label>
                  </div>
                  <div class="together-container">
                    <div>同伴人数 </div>
                    <div class="together-people">大人</div> 
                    <input 
                      type="button"
                      onclick='count("plus","adult")'
                      value="+"
                    /> 
                    <input 
                      style="width: 2rem; font-size: 1rem;"
                      class="result"
                      value="0"
                      id="adult"
                      name="adult"
                    />
                    <input
                      type="button"
                      onclick='count("minus","adult")'
                      value="-"
                    /> 
                    <div value="子供" class="together-people">子供</div> 
                    <input
                      type="button"
                      onclick='count("plus","child")'
                      value="+"
                    />
                    <input
                      style="width: 2rem; font-size: 1rem"
                      class="result"
                      value="0"
                      id="child"
                      name="child"
                    />
                    <input
                      type="button"
                      onclick='count("minus","child")'
                      value="-"
                    />
                     <div value="幼児" class="together-people">幼児</div> 
                     <input
                      type="button"
                      onclick='count("plus","baby")'
                      value="+"
                    />
                    <input
                      style="width: 2rem; font-size: 1rem;"
                      class="result baby"
                      value="0"
                      id="baby"
                      name="baby"
                    />
                    <input
                      type="button"
                      onclick='count("minus","baby")'
                      value="-"
                    />
                  </div>
                  <div class="name-container">
                    <fieldset>
                  <legend>
                      <div>
                          <img                 
                        src="imgFolder/flowersymbol.jpg"
                      alt="flowersymbol"
                    style="width: 100%; height: 100%"
                  />
                  </div>
                  &nbsp&nbsp&nbsp
                <div style="font-size: 1.5rem;"> お名前</div>
              </legend>
                      <label class="kanzi-container">
                        <div style="font-size: 1.2rem;">漢字</div>
                        <input
                          style="font-size: 1rem;"
                          type="text"
                          placeholder="姓"
                          class="name-input"
                          name="kanzi-name"
                          required />
                        <input style="font-size: 1rem;" type="text" placeholder="名" class="name-input" name="kanzi-name"
                        required
                      /></label></br>
                      <label class="kata-container">
                        <div style="font-size: 1.2rem;">カタカナ</div>
                        <input
                          style="font-size: 1rem;"
                          type="text"
                          placeholder="せい"
                          class="name-input" 
                          name="kata-name"
                          required/>
                        <input
                          style="font-size: 1rem;"
                          type="text"
                          placeholder="めい"
                          class="name-input"
                          name="kata-name"
                          required
                      /></label></br>
                      <label class="eng-container">
                        <div style="font-size: 1.2rem;">ローマ字</div>
                        <input
                          style="font-size: 1rem;"
                          type="text"
                          placeholder="Last Name"
                          class="name-input"
                          name="roma-name" 
                          required/>
                        <input
                          style="font-size: 1rem;"
                          type="text"
                          placeholder="First Name"
                          class="name-input"
                          name="roma-name"
                          required
                      /></label>
                    </fieldset>
                  </div>
                  <div class="contact-container">
                     <div>メールアドレス<input style="font-size: 1rem;" type="email" class="contact-input" name="email" placeholder="enmusubi@gmail.com" required/></div>
                     <div>電話番号 <input style="font-size: 1rem;" type="number" class="contact-input" name="phonenum" placeholder="000-0000-0000" required/></div>
                </div>
                </div>
              </div>

              <div class="tg-slide-second-page">

                <div class="address-container">
                    <fieldset>
                      <legend>
                        <div><img                 
                        src="imgFolder/homeicon.png"
                      alt="flowersymbol"
                    style="width: 100%; height: 100%"
                  /></div>
                  &nbsp&nbsp&nbsp
                  <div style="font-size: 1.5rem;">住所入力フォーム</div></legend>
                      <div class="address-contents-contaoner">
                        <div>    
                        <div>      
                        <span for="postal-code">郵便番号</span>
                      </div>
                      <div>  
                      <input style="font-size: 1rem"
                    type="text"
                  id="postal-code"
                name="postal-code"
              placeholder="123-4567"
            required
          />
          </div>
          </div>   
                  <div class="address-contents-contaoner">
                      <div><span for="prefecture">都道府県</span></div>
                        <div><select style="font-size: 1rem" id="prefecture" name="address" required>
                        <option value="">選択してください</option>
                        <option value="hokkaido">北海道</option>
                        <option value="aomori">青森県</option>
                        <option value="iwate">岩手県</option>
                        <option value="miyagi">宮城県</option>
                        <option value="akita">秋田県</option>
                        <option value="yamagata">山形県</option>
                        <option value="fukushima">福島県</option>
                        <option value="ibaraki">茨城県</option>
                        <option value="tochigi">栃木県</option>
                        <option value="gunma">群馬県</option>
                        <option value="saitama">埼玉県</option>
                        <option value="chiba">千葉県</option>
                        <option value="tokyo">東京都</option>
                        <option value="kanagawa">神奈川県</option>
                        <option value="niigata">新潟県</option>
                        <option value="toyama">富山県</option>
                        <option value="ishikawa">石川県</option>
                        <option value="fukui">福井県</option>
                        <option value="yamanashi">山梨県</option>
                        <option value="nagano">長野県</option>
                        <option value="gifu">岐阜県</option>
                        <option value="shizuoka">静岡県</option>
                        <option value="aichi">愛知県</option>
                        <option value="mie">三重県</option>
                        <option value="shiga">滋賀県</option>
                        <option value="kyoto">京都府</option>
                        <option value="osaka">大阪府</option>
                        <option value="hyogo">兵庫県</option>
                        <option value="nara">奈良県</option>
                        <option value="wakayama">和歌山県</option>
                        <option value="tottori">鳥取県</option>
                        <option value="shimane">島根県</option>
                        <option value="okayama">岡山県</option>
                        <option value="hiroshima">広島県</option>
                        <option value="yamaguchi">山口県</option>
                        <option value="tokushima">徳島県</option>
                        <option value="kagawa">香川県</option>
                        <option value="ehime">愛媛県</option>
                        <option value="kochi">高知県</option>
                        <option value="fukuoka">福岡県</option>
                        <option value="saga">佐賀県</option>
                        <option value="nagasaki">長崎県</option>
                        <option value="kumamoto">熊本県</option>
                        <option value="oita">大分県</option>
                        <option value="miyazaki">宮崎県</option>
                        <option value="kagoshima">鹿児島県</option>
                        <option value="okinawa">沖縄県</option>
                      </select>
                    </div>
                  </div>
                  <div class="address-contents-contaoner">                   
                    <div><span for="city">市区町村</span></div>
                      <div><input style="font-size: 1rem"
                        type="text"
                        id="city"
                        name="address"
                        placeholder="新宿区"
                        required
                         />
                        </div>
                         </div>
                      
                      <div class="address-contents-contaoner">
                      <div><span for="address-line1">町域・番地</span>
                      </div>
                      <div>
                      <input style="font-size: 1rem"
                        type="text"
                        id="address-line1"
                        name="address"
                      placeholder="西新宿2-8-1"
                      required
                    />
                    </div>
                    </div>
                    
                    <div class="address-contents-contaoner">
                      <div>
                      <span for="address-line2">建物名・部屋番号</span>
                    </div>
                     <div>
                      <input style="font-size: 1rem"
                        type="text"
                        id="address-line2"
                        name="address"
                        placeholder="新宿ビル 101"
                        required
                      />
                    </div>
                    </div>                                                
                    </fieldset>
                </div>
              </div>

              <div class="tg-slide-third-page">

                <div class="allergy-container">
                  <fieldset>
                      <legend>
                          <div style="width: 3.8rem; height: 1.8rem;"><img style="width: 100%; height: 100%" src="imgFolder/foodicon.png" alt="アレルギーマーク" /></div>
                          <div>アレルギーについて</div>
                      </legend>

                      <div class="allergy-question">
                          <span style="font-size: 1rem;" for="allergy">アレルギーはありますか？</span>
                              <label>
                                <input style="font-size: 1.0rem;" type="radio" name="allergy" value="no" checked /> いいえ
                              </label>
                              <label>
                                <input style="font-size: 1.0rem;" type="radio" name="allergy" value="yes" /> はい
                              </label>
                      </div>

                      <div class="allergy-details" id="allergy-details" style="display: none;">
                          <label for="allergy-type">アレルギーの種類:</label>&nbsp;&nbsp;&nbsp;&nbsp;
                          <textarea style="font-size: 1rem" class="allergy-type" type="text" id="allergy-type" name="allergy-type" placeholder="例：卵, 小麦, 乳製品" /></textarea>
                      </div>
                  </fieldset>
                </div>
               
                <div class="special-notes-container">

                  <div style="line-height: 3rem; font-size: 1.2rem;">
                      その他要求事項
                      <textarea style="font-size: 1rem" id="special-notes" name="special-notes" placeholder="ご要望、ご質問などございましたらご記入ください。"></textarea>
                  </div>

                </div>

                  <div>

                    <button type="submit" class="tg-survey-button">
                      <span>確認</span>
                    </button>
          
                  </div>

              </div>
              
              </div>

            <div class="slider-navigation">
              <button type="button" class="next-slide">次へ</button>
            </div>

          </div>
          </div>

          </form>
          
        </div>
        
      </main>

      <footer class="tk_survey_footer">
      </footer>
    </div>
  </body>

  <script>
    
    $(document).ready(function () {
      $(".survey-input").slick({
        infinite: false,
        slidesToShow: 1,
        slidesToScroll: 1,
        adaptiveHeight: false,
        prevArrow: $(".prev-slide"),
        nextArrow: $(".next-slide")
      });

      // Show/Hide navigation buttons
      $(".survey-input").on("afterChange", function (event, slick, currentSlide) {
        if (currentSlide === 0) {
          $(".prev-slide").hide();
        } else {
          $(".prev-slide").show();
        }

        if (currentSlide === slick.slideCount - 1) {
          $(".next-slide").hide();
        } else {
          $(".next-slide").show();
        }
      });

      $(".survey-input").slick("slickGoTo", 0); // Move to the first slide
    });

    function count(type, inputId) {
  const resultElement = document.getElementById(inputId);

  let number = parseInt(resultElement.value);

  if (type === "plus") {
    number += 1;
  } else if (type === "minus") {
    if (number > 0) {
      number -= 1;
    }
  }

  // 결과 출력
  resultElement.value = number;
}

    const coupleCheckboxes = document.querySelectorAll('input[name="couple"]');

    coupleCheckboxes.forEach(checkbox => {
      checkbox.addEventListener('change',function() {
        if (this.checked) {
            coupleCheckboxes.forEach(otherCheckbox => {
              if (otherCheckbox !== this) {
                  otherCheckbox.checked = false;
              }
            });      
        }
      });
    });

        const relationshipCheckboxes = document.querySelectorAll('input[name="relationship"]');

    relationshipCheckboxes.forEach(checkbox => {
      checkbox.addEventListener('change',function() {
        if (this.checked) {
            relationshipCheckboxes.forEach(otherCheckbox => {
              if (otherCheckbox !== this) {
                  otherCheckbox.checked = false;
              }
            });      
        }
      });
    });

    // 알레르기 셀렉트 박스 변경 이벤트 처리
    const allergyCheckboxes = document.querySelectorAll('input[name="allergy"]');
    const allergyDetails = document.getElementById("allergy-details");

    allergyCheckboxes.forEach(checkbox => {
    checkbox.addEventListener('change', function() {
      if (this.checked) {
        allergyCheckboxes.forEach(otherCheckbox => {
          if(otherCheckbox !== this) {
            otherCheckbox.checked = false;
          }
        });

        if (this.value === 'yes') {
          allergyDetails.style.display = 'block'; // "はい" 체크 시 세부 정보 표시
        } else {
          allergyDetails.style.display = 'none';  // 체크 해제 시 세부 정보 숨김
          }         
        }
        });
    });

    
  </script>

</html>