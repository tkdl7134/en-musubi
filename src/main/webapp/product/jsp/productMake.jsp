<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Document</title>
<link rel="stylesheet" href="product/css/productMake.css" />
<link rel="stylesheet" href="product/css/datepicker.css" />
<link rel="preconnect" href="https://fonts.googleapis.com" />
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
<link href="https://fonts.googleapis.com/css2?family=Noto+Serif+JP:wght@200..900&display=swap" rel="stylesheet"/>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://code.jquery.com/ui/1.13.3/themes/base/jquery-ui.css"/>
<link rel="stylesheet" href="/resources/demos/style.css" />
<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
<script src="https://code.jquery.com/ui/1.13.3/jquery-ui.js"></script>
<script src="product/js/productMake.js"></script>
<script src="product/js/datepicker.js"></script>
</head>
<body>
    <div class="je_page-deco">
      <img src="product/imgFolder/product-up.png" alt="" />
    </div>
    <div id="je_container-productMake">
      <div class="je_product-make-page">
        <div class="je_product-make-page-title">
          <div class="je_page-title">テンプレート 制作</div>
          <div class="je_page-title-line">
            <img src=".product/imgFolder/pageTop_line.png" alt="" />
          </div>
        </div>
        <!-- content -->
        <div class="je_product-make-page-content">
          <!-- 템플릿 -->
          <div class="je_make-page-content je_template-output">
            <div class="je_content-title">プレビュー</div>
            <div class="je_template">
              <div class="je_template-content">
                <div>
                  신랑
                  <div id="je_groom-kanjiL"></div>
                  <div id="je_groom-kanjiF"></div>
                  <div id="je_groom-kanaL"></div>
                  <div id="je_groom-kanaF"></div>
                  <div id="je_groom-romaL"></div>
                  <div id="je_groom-romaF"></div>
                </div>
                <div>
                  신부
                  <div id="je_bride-kanjiL"></div>
                  <div id="je_bride-kanjiF"></div>
                  <div id="je_bride-kanaL"></div>
                  <div id="je_bride-kanaF"></div>
                  <div id="je_bride-romaL"></div>
                  <div id="je_bride-romaF"></div>
                </div>
                <div>
                  날짜
                  <div id="je_specialDay"></div>
                </div>
                <div>
                  본식
                  <div id="je_mainEvent-time"></div>
                  <div id="je_mainEvent-gatherTime"></div>
                  <div id="je_mainEvent-building"></div>
                  <div id="je_mainEvent-addr"></div>
                </div>
                <div>
                  피로연
                  <div id="je_sideEvent-time"></div>
                  <div id="je_sideEvent-gatherTime"></div>
                  <div id="je_sideEvent-building"></div>
                  <div id="je_sideEvent-addr"></div>
                </div>
                <div>
                  메세지
                  <div id="je_invite-message"></div>
                  <div id="je_finish-message"></div>
                </div>
                <div>사진</div>
                <div id="je_photoPre1"></div>
                <div id="je_photoPre2"></div>
                <div id="je_photoPre3"></div>
              </div>
            </div>
          </div>
          <!-- input -->
          <div class="je_make-page-content je_template-input">
            <div class="je_content-title">作成欄</div>
            <div class="je_content-boxes">
              <!-- box - 신랑신부 -->
              <div class="je_content-box">
                <div class="je_box-title">
                  情報
                  <div class="je_box-bottom-line">
                    <img src="product/imgFolder/line_box-title.png" alt="" />
                  </div>
                </div>
                <div class="je_box-content">
                  <div class="je_host-info">
                    <div class="je_info-title">
                      新郎 側
                      <div class="je_info-title-line">
                        <img src="product/imgFolder/line_box-cnt.png" alt="" />
                      </div>
                    </div>
                    <div class="je_info-content">
                      <div class="je_info-inputbox je_name">
                        <div class="je_inputbox-title">漢字</div>
                        <div class="je_inputbox-input">
                          <input type="text" placeholder="姓" id="je_g-kanji1" oninput="printName()"/>
                          <input type="text" placeholder="名" id="je_g-kanji2" oninput="printName()" />
                        </div>
                      </div>
                      <div class="je_info-inputbox je_name">
                        <div class="je_inputbox-title">カタカナ</div>
                        <div class="je_inputbox-input">
                          <input type="text"  placeholder="せい" id="je_g-kana1" onkeyup="printName()" />
                          <input type="text" placeholder="めい" id="je_g-kana2"  onkeyup="printName()"/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_name">
                        <div class="je_inputbox-title">ローマ字</div>
                        <div class="je_inputbox-input">
                          <input type="text" placeholder="Last Name" id="je_g-roma1" onkeyup="printName()"/>
                          <input type="text" placeholder="First Name" id="je_g-roma2" onkeyup="printName()"/>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="je_host-info">
                    <div class="je_info-title">
                      新婦 側
                      <div class="je_info-title-line">
                        <img src="product/imgFolder/line_box-cnt.png" alt="" />
                      </div>
                    </div>
                    <div class="je_info-content">
                      <div class="je_info-inputbox je_name">
                        <div class="je_inputbox-title">漢字</div>
                        <div class="je_inputbox-input">
                          <input type="text" placeholder="姓" id="je_b-kanji1" oninput="printName()"/>
                          <input type="text" placeholder="名" id="je_b-kanji2" oninput="printName()"/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_name">
                        <div class="je_inputbox-title">カタカナ</div>
                        <div class="je_inputbox-input">
                          <input type="text" placeholder="せい"  id="je_b-kana1" oninput="printName()"/>
                          <input type="text" placeholder="めい" id="je_b-kana2" oninput="printName()"/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_name">
                        <div class="je_inputbox-title">ローマ字</div>
                        <div class="je_inputbox-input">
                          <input type="text" placeholder="Last Name" id="je_b-roma1" oninput="printName()"/>
                          <input type="text" placeholder="First Name" id="je_b-roma2" oninput="printName()"/>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- box 식 날짜  -->
              <div class="je_content-box">
                <div class="je_box-title">
                  日程情報
                  <div class="je_box-bottom-line">
                    <img src="product/imgFolder/line_box-title.png" alt="" />
                  </div>
                </div>
                <div class="je_box-title2">式の日程</div>
                <div class="je_box-calendar">
                  <input type="text" id="specialDate" placeholder="日付を選んでください"
                    autocomplete="off" readonly oninput="printInput()"/>
                </div>
                <div class="je_box-content">
                  <div class="je_host-info">
                    <div class="je_info-title">
                      挙式
                      <div class="je_info-title-line">
                        <img src="product/imgFolder/line_box-cnt.png" alt="" />
                      </div>
                    </div>
                    <div class="je_info-content">
                      <div class="je_info-inputbox je_event">
                        <div class="je_inputbox-title">時間</div>
                        <div class="je_inputbox-input je_time_input">
                          <input type="text" placeholder="時" id="je_main-hourInput1" oninput="printTime()"/>
                          <input type="text" placeholder="分" id="je_main-minInput1" oninput="printTime()"/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_event">
                        <div class="je_inputbox-title">集合</div>
                        <div class="je_inputbox-input je_time_input">
                          <input type="text" placeholder="時" id="je_main-hourInput2" oninput="printTime()"/>
                          <input type="text" placeholder="分" id="je_main-minInput2" oninput="printTime()"/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_event">
                        <div class="je_inputbox-title">建物名</div>
                        <div class="je_inputbox-input je_building-input">
                          <input type="text" id="je_main-building" oninput="printInfo()"/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_event">
                        <div class="je_inputbox-title">住所</div>
                        <div class="je_inputbox-input je_address-input">
                          <input type="text" id="je_main-addr" oninput="printInfo()"/>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="je_host-info">
                    <div class="je_info-title">
                      披露宴
                      <div class="je_info-title-line">
                        <img src="product/imgFolder/line_box-cnt.png" alt="" />
                      </div>
                    </div>
                    <div class="je_info-content">
                      <div class="je_info-inputbox je_event">
                        <div class="je_inputbox-title">時間</div>
                        <div class="je_inputbox-input je_time_input">
                          <input type="text" placeholder="時" id="je_side-hourInput1" oninput="printTime()"/>
                          <input type="text" placeholder="分" id="je_side-minInput1" oninput="printTime()"/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_event">
                        <div class="je_inputbox-title">集合</div>
                        <div class="je_inputbox-input je_time_input">
                          <input type="text" placeholder="時" id="je_side-hourInput2" oninput="printTime()"/>
                          <input type="text" placeholder="分" id="je_side-minInput2" oninput="printTime()"/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_event">
                        <div class="je_inputbox-title">建物名</div>
                        <div class="je_inputbox-input je_building-input">
                          <input type="text" id="je_side-building" oninput="printInfo()"/>
                        </div>
                      </div>
                      <div class="je_info-inputbox je_event">
                        <div class="je_inputbox-title">住所</div>
                        <div class="je_inputbox-input je_address-input">
                          <input type="text" id="je_side-addr"  oninput="printInfo()"/>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- box - 메세지 및 사진 -->
              <div class="je_content-box">
                <div class="je_box-title">
                  添付情報
                  <div class="je_box-bottom-line">
                    <img src="product/imgFolder/line_box-title.png" alt="" />
                  </div>
                </div>
                <!-- 메세지 설정 -->
                <div class="je_box-title2">メッセージ 添付</div>
                <div class="je_box-content">
                  <div class="je_host-info">
                    <div class="je_info-title">
                      招待文句
                      <div class="je_info-title-line">
                        <img src=".product/imgFolder/line_box-cnt.png" alt="" />
                      </div>
                    </div>
                    <div class="je_info-content">
                      <div class="je_info-inputbox">
                        <div class="je_inputbox-title">内容</div>
                        <div class="je_inputbox-input">
                          <textarea name="" rows="10" id="je_invite-m" oninput="printInfo()"></textarea>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="je_host-info">
                    <div class="je_info-title">
                      仕上げの文句
                      <div class="je_info-title-line">
                        <img src="product/imgFolder/line_box-cnt.png" alt="" />
                      </div>
                    </div>
                    <div class="je_info-content">
                      <div class="je_info-inputbox">
                        <div class="je_inputbox-title">内容</div>
                        <div class="je_inputbox-input">
                          <textarea name="" id="je_finish-m" rows="10" oninput="printInfo()"></textarea>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <!-- 사진 첨부 -->
                <div class="je_box-title2">写真 添付</div>
                <div class="je_box-content">
                  <div class="je_host-info je_photo-info">
                    <div class="je_info-content je_photo-content">
                      <div class="je_photo-inputbox">
                        <div class="je_inputbox-input">
                          <div id="je_photobox1" class="je_photobox">
                            <input type="file" id="je_photoInput1" />
                            <div id="je_photoOut1"></div>
                            <span>写真１</span>
                          </div>
                          <div id="je_photobox2" class="je_photobox">
                            <input
                              type="file"
                              id="je_photoInput2"
                              onchange="readURL(this);"
                            />
                            <div id="je_photoOut2"></div>
                            <span>写真２</span>
                          </div>
                          <div id="je_photobox3" class="je_photobox">
                            <input
                              type="file"
                              id="je_photoInput3"
                              onchange="readURL(this);"
                            />
                            <div id="je_photoOut3ß"></div>
                            <span>写真３</span>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div class="je_finish-button"><button>作成完了</button></div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="je_page-deco">
      <img src="product/imgFolder/product-down.png" alt="" />
    </div>

    <script src="product/js/productMakeFile.js"></script>
  </body>
</html>