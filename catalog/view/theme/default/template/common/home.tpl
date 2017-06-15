<?php echo $header; ?>
<script src="catalog/view/javascript/menu_select.js" type="text/javascript"></script>
<link src="catalog/view/theme/default/stylesheet/jquery-ui.min.css" rel='stylesheet' type='text/css'></link>
<meta name="p:domain_verify" content="3c84530982952efe6a6f340c933b4fb0"/>
<div class="hm_baner">
<!-- <div class="container">  
 -->  <div class="row" style="margin-left: 0 !important; margin-right: 0 !important;">
  <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?> 
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="slidMain col-xs-12 col-sm-12 col-md-12 col-lg-12 nopad pull-right">
    <?php echo $content_top; ?>
    
    <?php echo $content_bottom; ?>
  </div>
</div><!-- 
</div> -->
</div>
<div class="tab_cnt">
  <div class="container">
    <div class="row">
      <div id="tabs">
        <ul class="tabul cf">
          <li><a href="#tabs-1">Best Sellers</a></li>
        </ul>
      <div id="tabs-1">
        <?php foreach($products as $product) { ?>
        <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4" id="product<?php echo $product['product_id']; ?>">
          <div class="img_bx">
            <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="idle-dosa-batter"></a>
          </div>
          <div class="caption">
            <div class="prodDet">
              <h4>
                <a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a>
              </h4>
            </div>
            <?php if ($product['rating']) { ?>
            <div class="rating">
              <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($product['rating'] < $i) { ?>
              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-2x"></i></span>
              <?php } else { ?>
              <span class="fa fa-stack"><i class="fa fa-star fa-stack-2x"></i><i class="fa fa-star-o fa-stack-2x"></i></span>
              <?php } ?>
              <?php } ?>
            </div>
            <?php } ?>
            <?php if ($product['price']) { ?>
            <p class="price">
            <?php if (!$product['special']) { ?>
            <span class="orgprice prodprice" data-actprice="<?php echo $product['price']; ?>"><?php echo $product['price']; ?></span>
            <?php } else { ?>
            <span class="price-new prodprice" data-actprice="<?php echo $product['special']; ?>"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
            <span class="discount"><?php echo $product['discount']."% <i>OFF</i>"; ?></span>
            <?php } ?>          
          </p>
        <?php } ?>
            <div class="btnDet cf">
              <div class="quantyt">
                <label>Qty</label>
                <input type="text" name="quantity" value="<?php echo $product['minimum']; ?>">
              </div><!-- quantyt -->
              <input type="hidden" name="product_id" value="<?php echo $product['product_id']; ?>">
              <button type="button" class="addToCart" data-loading-text="..." data-product="<?php echo $product["product_id"]; ?>">  <span class="">Add to  Cart</span></button>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>
    
        
     </div><!-- tabs -->
   </div><!-- row -->
  </div><!-- container -->
</div><!-- tab_cnt -->


<div class="hm_whyus why-bg why-bg1">
  <h2 class="why_hd2">Why Us</h2>
  <p>Native Food Store makes your grocery shopping experience simpler by bringing food and essential<br> daily products delivered to you at your doorstep. </p>
  <div class="container">
    <div class="row">
      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
        <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 prod-bg mrglftt">
          <div class="whlediv cf">
            <div class="imgDiv">
              <img src="image/vision.png" alt="" />
            </div>
            <div class="paraDiv">
              <h2>Vision</h2>
              <p>We nativefoodstore.com started with the aim to bring our Native foods habits by selling Native Food Stuffs.</p>
            </div>
          </div>
        </div>
        <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 prod-bg">
          <div class="whlediv cf">
            <div class="imgDiv">
              <img src="image/quality.png" alt="" />
            </div>
            <div class="paraDiv">
              <h2>Quality</h2>
              <p>Our products are naturally grown, handpicked whole grains with no added colors and preservatives.</p>
            </div>
          </div>
        </div>
        <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 prod-bg mrglftt">
          <div class="whlediv cf">
            <div class="imgDiv">
              <img src="image/payment.png" alt="" />
            </div>
            <div class="paraDiv">
              <h2>Payment</h2>
              <p>You can pay online using your debit/credit card or netbanking<br><br> <br></p>
            </div>
          </div>
        </div>
      </div> 
      <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
        <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 prod-bg pull-right mrgrgt">
          <div class="whlediv cf">
            <div class="imgDiv1">
              <img src="image/security.png" alt="" />
            </div>
            <div class="paraDiv1">
              <h2>Security</h2>
              <p>Your transaction with our online store in secure with the highest level of transaction security available over internet.</p>
            </div>
          </div>
        </div>
        <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 prod-bg pull-right">
          <div class="whlediv cf">
            <div class="imgDiv1">
              <img src="image/packaging.png" alt="" />
            </div>
            <div class="paraDiv1">
              <h2>Packaging</h2>
              <p>Products that you buy at our online store is well packed in a moisture proof package ensuring the shell life by months.</p>
            </div>
          </div>
        </div>
        <div class="col-xs-12 col-sm-10 col-md-10 col-lg-10 prod-bg pull-right mrgrgt">
          <div class="whlediv cf">
            <div class="imgDiv1">
              <img src="image/delivery.png" alt="" />
            </div>
            <div class="paraDiv1">
              <h2>Delivery</h2>
              <p>Your order will be delivered at your doorstep anywhere in Chennai wihtin 48 hours & other parts of Tamil Nadu within 48 hours to 72 hours through reputed courier.</p>
            </div>
          </div>
        </div>
      </div>
    </div><!-- row -->
  </div><!-- container -->
</div><!-- hm_whyus -->



<?php echo $footer; ?>
<script type="text/javascript">
  $( function() {
    $( "#tabs" ).tabs();
  } );
  </script>
<script type="text/javascript">
$('.catDetailMenu').css('display','block');
$('.catMenu .list-unstyled').css('display','none');

$('.addToCart').on('click', function() { 
  var elem = $(this);
  var product_id = elem.data('product');
  $.ajax({
    url: 'index.php?route=checkout/cart/add',
    type: 'post',
    data: $('#product'+product_id+' [name=\'quantity\'], #product'+product_id+' input[type=\'hidden\'], #product'+product_id+' select'),
    dataType: 'json',
    beforeSend: function() {
     elem.button('loading');
    },
    complete: function() {
      elem.button('reset');
    },
    success: function(json) { 
      $('.alert, .text-danger').remove();
      $('.form-group').removeClass('has-error');

      if (json['error']) {
        if (json['error']['option']) {
          for (i in json['error']['option']) {
            var element = $('#input-option' + i.replace('_', '-'));
            
            if (element.parent().hasClass('input-group')) {
              $('.breadcrumb').after('<div class="alert alert-danger">' + json['error']['option'][i] + '</div>');
            } else {
              $('.breadcrumb').after('<div class="alert alert-danger">' + json['error']['option'][i] + '</div>');
            }
          }
        }
        
        if (json['error']['recurring']) {
          $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
        }
        
        // Highlight any found errors
        $('.text-danger').parent().addClass('has-error');
      }
      
      if (json['success']) { 
        $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        
        $('#cart-total').html(json['total']);

        $('#cart > ul').load('index.php?route=common/cart/info ul li');
      }
       $('html, body').animate({ scrollTop: 0 }, 'slow');

    },
    error: function(xhr, ajaxOptions, thrownError) { 
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});

$('.addToCartHotProd').on('click', function() { 
  var elem = $(this);
  var product_id = elem.data('hot-product');
  $.ajax({
    url: 'index.php?route=checkout/cart/add',
    type: 'post',
    data: { 'product_id' : $('#hot_product'+product_id+' input[type=\'hidden\']').val(), 'quantity' : $('#hot_product'+product_id+' [name=\'hot_prod_quantity\']').val() },
    dataType: 'json',
    beforeSend: function() {
     elem.button('loading');
    },
    complete: function() {
      elem.button('reset');
    },
    success: function(json) { 
      $('.alert, .text-danger').remove();
      $('.form-group').removeClass('has-error');

      if (json['error']) { 
        if (json['error']['option']) {
          for (i in json['error']['option']) {
            var element = $('#input-option' + i.replace('_', '-'));
            
            if (element.parent().hasClass('input-group')) {
              $('.breadcrumb').after('<div class="alert alert-danger">' + json['error']['option'][i] + '</div>');
            } else {
              $('.breadcrumb').after('<div class="alert alert-danger">' + json['error']['option'][i] + '</div>');
            }
          }
        }
        
        if (json['error']['recurring']) { alert("werwe");
          $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
        }
        
        // Highlight any found errors
        $('.text-danger').parent().addClass('has-error');
      }
      
      if (json['success']) { 
        $('.breadcrumb').after('<div class="alert alert-success">' + json['success'] + '<button type="button" class="close" data-dismiss="alert">&times;</button></div>');
        
        $('#cart-total').html(json['total']);

        $('#cart > ul').load('index.php?route=common/cart/info ul li');
      }
       $('html, body').animate({ scrollTop: 0 }, 'slow');

    },
    error: function(xhr, ajaxOptions, thrownError) { 
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});
</script>

