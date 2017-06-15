<footer>
  <div class="container">
    <div class="row">
    <div class="footBlk cf">
      <div class="col-lg-8 col-md-8 col-sm-12 col-xs-12 footSect">
        <div class="row">
          <div class="col-lg-2 col-md-2 col-sm-2 col-xs-12">
            <h5>About Us</h5>
             <ul class="list-unstyled">
              <li><a href="<?php echo HTTP_SERVER; ?>about-us">About Us</a></li>
              <li><a href="<?php echo HTTP_SERVER; ?>vision">Our Vision</a></li>
              <li><a href="<?php echo HTTP_SERVER; ?>quality">Quality Standards</a></li>
              <li><a href="<?php echo HTTP_SERVER; ?>awards">Awards</a></li>
		<li><a href="<?php echo HTTP_SERVER; ?>our-values">Our values</a></li>
		<li><a href="<?php echo HTTP_SERVER; ?>faq">FAQ's</a></li>
            </ul>
          </div>
        <div class="col-lg-2 col-md-2 col-sm-3 col-xs-12">
            <h5><?php echo $text_account; ?></h5>
            <ul class="list-unstyled">
              <li><a href="<?php echo $wishlist; ?>"><?php echo $text_wishlist; ?></a></li>
<!--               <li><a href="<?php echo $newsletter; ?>"><?php echo $text_newsletter; ?></a></li> -->
              <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>             
            </ul>
          </div>
          <?php if ($informations) { ?>
          <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
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
          <div class="secHead cf">
            <h2 class="prodHead">Get News letter</h2>
            <p class="comnP">Want to subscribe to our newsletter feed? Please fill the form below</p>
            <p class="newsPara">Newsletter</p>
            <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4 news pull-right">
            <input class="col-xs-3 col-sm-3 col-md-3 col-lg-3 mailbox" type="email" name="email" id="email1" placeholder="ENTER YOUR EMAIL ID" data-error="Email address is invalid" required="">
            <img src="image/arrow.png" class="arrow">
          </div>
          </div>
          
        </div>
        <div class="hidden-xs mT20 nopad">
           <div class="ftrLogo cf">
             <img src="image/footer-logo.jpg" alt="footer-logo">
           </div>
           <p class="ftrP">We are very passionate about organic food in general and are excited to be involved in the promotion of organic produce. With the online store, our home delivery scheme, we have a lot to get stuck into. We also work directly with farms and wholesalers to deliver fresh organic produce and a wide range of all your favourite organic products all year round. </p>
         </div>
        </div>
        <div class="secure hidden-sm hidden-xs pull-right col-lg-4 col-md-4 col-sm-12 col-xs-12 ftrmgr">
            <h5>100% Secure Shopping</h5>
            <p>SSL encryption on all payments</p>
            <!--  <a href="mailto:info@transwaters.com" class="femail"><i class="fa fa-envelope-o"></i><span>info@transwaters.com</span></a>  -->
            <div class="pymntOpt"></div><!-- pymntOpt -->
        </div>
            <div class="footShare secure  pull-right col-lg-4 col-md-4 col-sm-12 col-xs-12 ftrlft">
              <h4>Follow Us</h4>
              <div class="sIcon cf">
                <a href="javascript:" class="fb"></a>
                <a href="javascript:" class="tw"></a>
                <a href="javascript:" class="gp"></a>
                <a href="javascript:" class="pin"></a>
                 <!-- <a href="#" class="in"></a>
                 <a href="#" class="yt"></a> -->
              </div>
          </div>
        </div>
    </div>
  </div>
  <div class="fBtm">
    <div class="container cf">
      <p><?php echo $powered; ?></p>
      <a href="http://www.floretmedia.com" title="Floret Media PVT LTD" target="_blank" class="floret"><span>Designed and Marketed by<br>Floret Media Pvt. Ltd</span><img src="image/floret-logo.png" width="30" height="34" alt="Floret Media pvt. ltd"></a>     
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
</body></html>