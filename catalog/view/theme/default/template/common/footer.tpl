<footer>
  <div class="container">
    <div class="row">
    <div class="footBlk cf">
      <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 footSect">
        <div class="row">
          <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
            <h5>Shop By Categories</h5>
             <ul class="list-unstyled">
              <li><a href="millet">Millet</a></li>
              <li><a href="boiled-millet">Boiled Millet</a></li>
              <li><a href="millet-noodles">Millet Noodles</a></li>
              <li><a href="herbal-powder">Herbal Powder</a></li>
              <li><a href="pulses">Pulses</a></li>
            </ul>
            <ul class="list-unstyled info_ul">
              <li><a href="about-us">About Us</a></li>
              <li><a href="javascript:;">Quality Standards</a></li>
              <li><a href="http://blog.nativefoodstore.com/">Blog</a></li>
            </ul>
          </div>
        <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12">
          <ul class="list-unstyled cok_ul">
            <li><a href="ready-to-cook-food">Ready to cook food</a></li>
            <li><a href="traditional-rice">Traditional Rice</a></li>
            <li><a href="millet-flour">Millet Flour</a></li>
          </ul>
          </div>
          <?php if ($informations) { ?>
          <div class="col-lg-4 col-md-4 col-sm-4 col-xs-6">
            <h5><?php echo $text_information; ?></h5>
            <ul class="list-unstyled">
              <?php 
              $remove_info_pages = array("About Us","Our Vision","Awards","Quality Standards","FAQ's");
              foreach ($informations as $information) {
                if(!in_array($information['title'], $remove_info_pages)){?>
              <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
              <?php }} ?>
              <li><a href="<?php echo $contact; ?>"><?php echo $text_contact; ?></a></li>
              <li><a href="<?php echo $return; ?>"><?php echo $text_return; ?></a></li>
              <li><a href="<?php echo $sitemap; ?>"><?php echo $text_sitemap; ?></a></li>
            </ul>
          </div>
          <?php } ?>
        </div>
        
        </div>
        <div class="pull-right col-lg-4 col-md-4 col-sm-12 col-xs-12 text-center right_foot">
          <h5>Get Social with nativefoods</h5>
          <a class="smm" href="https://www.facebook.com/nativefoodstore/"></a>
          <a class="smm twt" href="https://twitter.com/nativefoodstore"></a>
          <a class="smm pintr" href="https://in.pinterest.com/nativefoodstore/"></a>
          <a class="smm gplus" href="https://plus.google.com/107598561877544934568"></a>
          <a class="smm inst" href="https://www.instagram.com/nativefoodstoreofficial"></a>
          <br>
          <h5>We Accept ;</h5>
          <img src="image/spriten.png" alt="" class="mb20"/>
          <br>
          <h5>Get Social in touch</h5>
          <div class="foot_fld">
            <input type="text">
            <button>SUBMIT</button> 
          </div><!-- foot_fld -->
          <div>
            <img src="image/foot-logo.png" alt="foot-logo"/>
          </div>
        </div>
            
        </div>
    </div>
  </div>
  <div class="fBtm">
    <div class="container cf">
      <p>© 2016 All Rights Reserved Native Food Store</p>
      <a href="http://www.floretmedia.com" title="Floret Media PVT LTD" target="_blank" class="floret"><span>Developed and Managed by Floretmedia</span><img src="image/floret-logo.png" width="30" height="34" alt="Floret Media pvt. ltd"></a>     
    </div> 
  </div>
</footer>
<!--
OpenCart is open source software and you are free to remove the powered by OpenCart if you want, but its generally accepted practise to make a small donation.
Please donate via PayPal to donate@opencart.com
//--> 
<script type="text/javascript">var switchTo5x=true;</script>
<script type="text/javascript" src="http://w.sharethis.com/button/buttons.js"></script>
<script type="text/javascript">stLight.options({publisher: "c6c6ffd2-062a-4c54-af7a-11dcf9ca1c1a", doNotHash: false, doNotCopy: false, hashAddressBar: false});</script>
<div class="backTop"><a href="javascript:;"><span></span></a></div>

<link rel="stylesheet" href="catalog/view/theme/default/stylesheet/magnific-popup.css"> 
        <link rel="stylesheet" href="catalog/view/theme/default/stylesheet/huntbee-popup.css">
        <script src="catalog/view/theme/default/stylesheet/jquery.magnific-popup.min.js"></script>
        
        <style type="text/css"><?php echo $hb_oosn_css;?></style>
        
        <div id="notifyform" class="white-popup mfp-with-anim mfp-hide">
          <input type="hidden" id="pid" name="pid" value="">
          <div id="oosn_info_text"><?php echo $oosn_info_text; ?></div><div id="opt_info"></div><br />
          <?php if ($hb_oosn_name_enable == 'y') {?>
            <div class="form-group">
               <label class="col-sm-4 control-label"><?php echo $oosn_text_name; ?></label>
              <div class="col-sm-8">
              <input type="text" name="notifyname" placeholder="<?php echo $oosn_text_name_plh; ?>" id="notifyname" class="form-control" value="<?php echo $fname;?>" />
              </div>
            </div>
           <?php } ?>
          <hr>
          <div class="form-group">
            <label class="col-sm-4 control-label"><?php echo $oosn_text_email; ?></label>
            <div class="col-sm-8">
            <input type="text" name="notifyemail" placeholder="<?php echo $oosn_text_email_plh; ?>" id="notifyemail" class="form-control" value="<?php echo $email;?>" />
            </div>
          </div>
          <hr><br>
           
          <?php if ($hb_oosn_mobile_enable == 'y') {?>
          <div class="form-group">
             <label class="col-sm-4 control-label"><?php echo $oosn_text_phone; ?></label>
            <div class="col-sm-8">
            <input type="text" name="notifyphone" placeholder="<?php echo $oosn_text_phone_plh; ?>" id="notifyphone" class="form-control" value="<?php echo $phone;?>" />
            </div>
          </div>
          <?php } ?>
          <br><br>
          <button type="button" id="notify_btn" class="btn btn-warning btn-lg btn-block"><i class="fa fa-bell"></i> <?php echo $notify_button; ?></button> 
          <br>
          
          <div id='loadgif' style='display:none'><img src='catalog/view/theme/default/image/loading.gif'/></div>
          <div id="msgoosn"></div>
                    
        </div><!--notifyform -->
                
        <script type="text/javascript">
        function notifypop(i){$("#pid").val(i),$("#msgoosn").html(""),$.magnificPopup.open({items:{src:"#notifyform"},type:"inline",removalDelay:800,midClick:!0,callbacks:{beforeOpen:function(){this.st.mainClass="<?php echo $hb_oosn_animation;?>"}}})}
        </script>
        
        <script type="text/javascript">
        $("#notify_btn").click(function(){$("#msgoosn").html(""),$("#loadgif").show();var e=$("#notifyname").length?$("#notifyname").val():"",o=$("#notifyphone").length?$("#notifyphone").val():"";if($("#option_values").length)var t=$("#option_values").val(),n=$("#selected_option").val(),a=$("#all_selected_option").val();else var t=0,n=0,a=0;$.ajax({type:"post",url:"index.php?route=product/product_oosn",data:{data:$("#notifyemail").val(),name:e,phone:o,product_id:$("#pid").val(),selected_option_value:t,selected_option:n,all_selected_option:a},dataType:"json",success:function(e){e.success&&($("#msgoosn").html(e.success),$("#loadgif").hide())},error:function(e,o,t){alert(t+"\r\n"+e.statusText+"\r\n"+e.responseText)}})});
        </script>
        <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-89038614-1', 'auto');
  ga('send', 'pageview');

</script>
<script type="text/javascript">
function tweetCurrentPage()
{ window.open("https://twitter.com/share?url="+escape(window.location.href)+"&text="+document.title, '', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false; }   
// </script>
        
</body></html>