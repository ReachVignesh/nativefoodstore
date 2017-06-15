<link href="catalog/view/javascript/jquery/magnific/magnific-popup.css" type="text/css" rel="stylesheet" media="screen" />
<style type="text/css">
.modal {
  z-index: 1041;
}
</style>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery/magnific/jquery.magnific-popup.min.js" type="text/javascript"></script>
<div class="modal-header">
   <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
   <h4 class="modal-title" id="myModalLabel">Quick View</h4>
</div>
<div class="modal-body">
<div class="">
  <div class="row" id="product"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="row">
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?>">
          <?php if ($thumb || $images) { ?>
          <ul class="thumbnails">
            <?php if ($thumb) { ?>
            <li><a class="thumbnail prdbimgImg" href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" data-imagezoom="true" /></a></li>
            <?php } ?>
            <?php if ($images) { ?>
            <?php foreach ($images as $image) { ?>
            <li class="image-additional"><a class="thumbnail" href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>"> <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" /></a></li>
            <?php } ?>
            <?php } ?>
          </ul>
          <?php } ?>
        </div>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-sm-6'; ?>
        <?php } else { ?>
        <?php $class = 'col-sm-5'; ?>
        <?php } ?>
        <div class="<?php echo $class; ?> prodDtl">
            <div class="row">
            <div class="col-md-9 col-xs-12 col-sm-12">
          <h1 class="hdng"><?php echo $heading_title; ?></h1>
           <?php if ($review_status) { ?>
            <div class="rating">
            <p>
              <?php for ($i = 1; $i <= 5; $i++) { ?>
              <?php if ($rating < $i) { ?>
              <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } else { ?>
              <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i><i class="fa fa-star-o fa-stack-1x"></i></span>
              <?php } ?>
              <?php } ?>
              <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a></p>
            </div>
          <?php } ?>
            </div>
            <div class="col-md-3 nopad hidden-xs hidden-sm">             <?php if ($manufacturers_img) { ?>
            <div class="brandImg">    
<a href="<?php echo $manufacturers; ?>" title="<?php echo $manufacturer; ?>"><?php echo ($manufacturers_img) ? '<img src="'.$manufacturers_img.'" alt="'.$manufacturer.'" />' : $manufacturers ;?></a>
            </div>
<?php } ?>                
            </div>
                </div>
          <ul class="list-unstyled prdCode cf">
            <!--<li class="col-md-6 nopad"><?php echo $text_model; ?> <?php echo $model; ?></li>-->            
            <li class="col-md-6 text-left nopad"><?php echo $text_stock; ?> <?php echo $stock; ?></li>
          </ul>
          <div class="pricCont cf">
            <div class="col-md-2 nopad">              
                <div class="col-md-3 nopad">
                  <label class="control-label linht" for="input-quantity"><?php echo $entry_qty; ?>:</label>
                </div>
                <!-- <div class="col-md-7 nopad pull-right">
                  <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
                  <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                </div> -->
                <div class="col-md-7 nopad pull-right">
                  <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" maxlength="3" class="form-control" onkeypress="return IsNumeric(event);" ondrop="return false;" onpaste="return false;"/>
                  <span id="error" style="color: Red; display: none">Input digits (0 - 9)</span>
                  <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                </div>
              </div>
            <div class="col-md-4 pull-right text-right nopad">              
              <?php if ($price) { ?>
              <ul class="list-unstyled prdprice text-right">
                <?php if (!$special) { ?>
                <li>
                  <h2 class="mT0 prodprice" data-actprice="<?php echo $price; ?>"><?php echo $price; ?></h2>
                </li>
                <?php } else { ?>
                <li><span style="text-decoration: line-through;"><?php echo $price; ?></span></li>
                <li>
                  <h2 class="mT0 prodprice" data-actprice="<?php echo $price; ?>"><?php echo $special; ?></h2>
                </li>
                <span class="discount"><?php echo $discount."%";?></span>
                <?php } ?>                
                <?php if ($points) { ?>
                <li><?php echo $text_points; ?> <?php echo $points; ?></li>
                <?php } ?>
                <?php if ($discounts) { ?>
                <li>
                  <hr>
                </li>
                <?php foreach ($discounts as $discount) { ?>
                <li><?php echo $discount['quantity']; ?><?php echo $text_discount; ?><?php echo $discount['price']; ?></li>
                <?php } ?>
                <?php } ?>
              </ul>
              <?php } ?>  
              </div>              
          </div>          
          <div>
            <?php if ($options) { ?>
            <!-- <h3><?php echo $text_option; ?></h3> -->
            <?php foreach ($options as $option) { ?>
            <?php if ($option['type'] == 'select') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                <?php if ($option_value['price']) { ?>
                (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                <?php } ?>
                </option>
                <?php } ?>
              </select>
            </div>
            <?php } ?>
            

            <?php if ($option['type'] == 'radio') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?> sizeBtns cf">
            <!-- <label class="control-label"><?php echo $option['name']; ?></label> -->
            <div id="input-option<?php echo $option['product_option_id']; ?> cf">
            <?php foreach ($option['product_option_value'] as $option_value) { 
              $price_prefix = "+";
              $option_price = 0;
              if ($option_value['price']) {
                $price_prefix = $option_value['price_prefix']; 
                $option_price = $option_value['opt_price'];
              }

              ?>
            <div class="radio">
            <label>
            <input type="radio" data-priceprefix ="<?php echo $price_prefix; ?>" data-optprice="<?php echo $option_price; ?>" name="option[<?php echo $option['product_option_id']; ?>]" <?php if ($option_value['quantity']<=0) { ?>disabled<?php }?> value="<?php echo $option_value['product_option_value_id']; ?>" />
            <div class="strke">
            <?php if ($option_value['quantity']>0) { ?>
            <?php echo $option_value['name']; ?>
            <?php } else { ?>
            <strike><?php echo $option_value['name']; ?></strike>
            <?php } ?>
            </div>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
            </label>
            </div>
            <?php } ?>
            </div>
            </div>
            <?php } ?>
          


            <?php if ($option['type'] == 'checkbox') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="checkbox">
                  <label>
                    <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'image') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <div id="input-option<?php echo $option['product_option_id']; ?>">
                <?php foreach ($option['product_option_value'] as $option_value) { ?>
                <div class="radio">
                  <label>
                    <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                    <img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" class="img-thumbnail" /> <?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label>
                </div>
                <?php } ?>
              </div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'text') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'textarea') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <textarea name="option[<?php echo $option['product_option_id']; ?>]" rows="5" placeholder="<?php echo $option['name']; ?>" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control"><?php echo $option['value']; ?></textarea>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'file') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label"><?php echo $option['name']; ?></label>
              <button type="button" id="button-upload<?php echo $option['product_option_id']; ?>" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-default btn-block"><i class="fa fa-upload"></i> <?php echo $button_upload; ?></button>
              <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" id="input-option<?php echo $option['product_option_id']; ?>" />
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'date') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group date">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-format="YYYY-MM-DD" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button class="btn btn-default" type="button"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'datetime') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group datetime">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-format="YYYY-MM-DD HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php if ($option['type'] == 'time') { ?>
            <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
              <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
              <div class="input-group time">
                <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['value']; ?>" data-format="HH:mm" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control" />
                <span class="input-group-btn">
                <button type="button" class="btn btn-default"><i class="fa fa-calendar"></i></button>
                </span></div>
            </div>
            <?php } ?>
            <?php } ?>
            <?php } ?>
            <?php if ($recurrings) { ?>
            <hr>
            <h3><?php echo $text_payment_recurring ?></h3>
            <div class="form-group required">
              <select name="recurring_id" class="form-control">
                <option value=""><?php echo $text_select; ?></option>
                <?php foreach ($recurrings as $recurring) { ?>
                <option value="<?php echo $recurring['recurring_id'] ?>"><?php echo $recurring['name'] ?></option>
                <?php } ?>
              </select>
              <div class="help-block" id="recurring-description"></div>
            </div>
            <?php } ?>
            <div class="crtbtn cf">
              <div class="col-md-5 nopad">
               <button type="button" id="button-cart" data-loading-text="<?php echo $text_loading; ?>" class="btn btn-primary btn-lg btn-block buynow"><span class="bagImg mybtm"><i></i><?php echo 'Buy Now'; ?></span></button>
              </div>
              <div class="col-md-5">
                 <div class="btn-group prdComWis">
                    <button type="button" class="btn btn-primary btn-lg btn-block mybtm" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i> <?php echo " Add to Wishlist"; ?></button>
                  </div>
              </div>      
            </div>
            <?php if ($minimum > 1) { ?>
            <div class="alert alert-info"><i class="fa fa-info-circle"></i> <?php echo $text_minimum; ?></div>
            <?php } ?>
          </div>
          <?php if ($review_status) { ?>
          <div class="rviw">
            <!-- AddThis Button BEGIN -->
            <div class="addthis_toolbox addthis_default_style"><a class="addthis_button_facebook_like" fb:like:layout="button_count"></a> <a class="addthis_button_tweet"></a> <a class="addthis_button_pinterest_pinit"></a> <a class="addthis_counter addthis_pill_style"></a></div>
            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-515eeaf54693130e"></script> 
            <!-- AddThis Button END --> 
          </div>
          <?php } ?>
          <!-- <div class="row">
            <div class="col-md-6">
              <h5 class="pinh5">Delivery Option</h5>
              <div class="input-group pincodeChk">
                <input type="text" name="pincode" value="" placeholder="Enter Your Pincode" class="form-control">
                <span class="input-group-btn">
                  <button type="button" class="btn btn-primary">Go</button>
                </span>
              </div>
            </div>
            <div class="col-md-4 resizeImg pull-right howToby">             
            </div>
          </div>
          <div class="row mT15">
            <div class="col-md-4">
                <div class="optbox cf">
                  <i class="col-md-4 icon1 nopad"></i>
                  <p class="col-md-8 nopad">DISPATCHED<br>IN 6-7 DAYS</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="optbox cf">
                  <i class="col-md-4 icon2 nopad"></i>
                  <p class="col-md-8 nopad">CASH ON<br>DELIVERY</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="optbox cf">
                  <i class="col-md-4 icon3 nopad"></i>
                  <p class="col-md-8 nopad">EASY<br>RESTURNS</p>
                </div>
            </div>  
          </div>
          <div class="row mT15 callUs">
            <div class="col-md-12">
                <h4>CALL TO ORDER: <span>+91-9972401313</span></h4>
                <p>or know more about functionality, fit or product. We are happy to assist.</p>
            </div>
          </div> -->
            <?php if ($products) { ?>
      <h3><?php echo $text_related; ?></h3>
      <div class="row">
        <?php $i = 0; ?>
        <?php foreach ($products as $product) { ?>
        <?php if ($column_left && $column_right) { ?>
        <?php $class = 'col-lg-6 col-md-6 col-sm-12 col-xs-12'; ?>
        <?php } elseif ($column_left || $column_right) { ?>
        <?php $class = 'col-lg-4 col-md-4 col-sm-6 col-xs-12'; ?>
        <?php } else { ?>
        <?php $class = 'col-lg-3 col-md-3 col-sm-6 col-xs-12'; ?>
        <?php } ?>
        <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12">
          <div class="product-thumb transition relatedPrd">
            <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
            <div class="caption">
              <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>                            
              <?php if ($product['price']) { ?>
              <p class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                 <span class="discount"><?php echo $discount."%";?></span>
                <?php } ?>
                <?php if ($product['tax']) { ?>
                <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
                <?php } ?>
              </p>
              <?php } ?>
            </div>
          </div>
        </div>
        <?php if (($column_left && $column_right) && ($i % 2 == 0)) { ?>
        <div class="clearfix visible-md visible-sm"></div>
        <?php } elseif (($column_left || $column_right) && ($i % 3 == 0)) { ?>
        <div class="clearfix visible-md"></div>
        <?php } elseif ($i % 4 == 0) { ?>
        <div class="clearfix visible-md"></div>
        <?php } ?>
        <?php $i++; ?>
        <?php } ?>
      </div>
      <?php } ?>
        </div>
      </div>      
      <?php if ($tags) { ?>
      <p><?php echo $text_tags; ?>
        <?php for ($i = 0; $i < count($tags); $i++) { ?>
        <?php if ($i < (count($tags) - 1)) { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
        <?php } else { ?>
        <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
        <?php } ?>
        <?php } ?>
      </p>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>

</div>
<script type="text/javascript">
        var specialKeys = new Array();
        specialKeys.push(8); //Backspace
        function IsNumeric(e) {
            var keyCode = e.which ? e.which : e.keyCode
            var ret = ((keyCode >= 48 && keyCode <= 57) || specialKeys.indexOf(keyCode) != -1);
            return ret;
        }
</script>
<script type="text/javascript"><!--
$('select[name=\'recurring_id\'], input[name="quantity"]').change(function(){
	$.ajax({
		url: 'index.php?route=product/product/getRecurringDescription',
		type: 'post',
		data: $('input[name=\'product_id\'], input[name=\'quantity\'], select[name=\'recurring_id\']'),
		dataType: 'json',
		beforeSend: function() {
			$('#recurring-description').html('');
		},
		success: function(json) {
			$('.alert, .text-danger').remove();
			
			if (json['success']) {
				$('#recurring-description').html(json['success']);
			}
		}
	});
});
</script> 
<script type="text/javascript">
$('.modal-body #button-cart').on('click', function() {
  $.ajax({
    url: 'index.php?route=checkout/cart/add',
    type: 'post',
    data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
    dataType: 'json',
    beforeSend: function() {
      $('#button-cart').button('loading');
    },
    complete: function() {
      $('#button-cart').button('reset');
    },
    success: function(json) {
      $('.alert, .text-danger').remove();
      $('.form-group').removeClass('has-error');

      if (json['error']) {
        if (json['error']['option']) {
          for (i in json['error']['option']) {
            var element = $('#input-option' + i.replace('_', '-'));
            
            if (element.parent().hasClass('input-group')) {
              $('.modal-body').before('<div class="alert alert-danger">' + json['error']['option'][i] + '</div>');
            } else {
             $('.modal-body').before('<div class="alert alert-danger">' + json['error']['option'][i] + '</div>');
            }
          }
        }
        
        if (json['error']['recurring']) {
          $('.modal-body').before('<div class="text-danger">' + json['error']['recurring'] + '</div>');
        }
        
        // Highlight any found errors
        $('.text-danger').parent().addClass('has-error');
      }
      
      if (json['success']) {
        $('.modal-body').before('<div class="alert alert-success">' + json['success'] + '</div>');
        
        $('#cart-total').html(json['total']);

        $('#cart > ul').load('index.php?route=common/cart/info ul li');
      }
    }
  });
});

var wishlist = {
  'add': function(product_id) {
    $.ajax({
      url: 'index.php?route=account/wishlist/add',
      type: 'post',
      data: 'product_id=' + product_id,
      dataType: 'json',
      success: function(json) {
        $('.alert').remove();

        if (json['success']) {
          $('.modal-body').before('<div class="alert alert-success"><i class="fa fa-check-circle"></i> ' + json['success'] + '</div>');
        }

        if (json['info']) {
          $('.modal-body').before('<div class="alert alert-info"><i class="fa fa-info-circle"></i> ' + json['info'] + '</div>');
        }

        $('#wishlist-total').html(json['total']);

      }
    });
  },
  'remove': function() {

  }
}
//--></script> 
<script type="text/javascript"><!--
$('.modal-body .thumbnails').magnificPopup({
	type:'image',
	delegate: 'a',
	gallery: {
		enabled: true,
	}
});
$(".sizeBtns [type=radio]").change(function(){
  var currency = $(".prodprice").text().match(/[a-zA-Z]+/)[0];
  var priceprefix = $(this).data('priceprefix');
  var optprice = $(this).data('optprice');
  var actprice = $(".prodprice").data('actprice').match(/\d+/)[0];
  if(priceprefix=="+"){
    optprice = Number(parseInt(actprice)) + Number(optprice);
  }
  else if(priceprefix=="-"){
    optprice = Number(parseInt(actprice)) - Number(optprice);
  }
  else{
    optprice = actprice;
  }
  var total = $("#input-quantity").val();
  optprice = Number(parseInt(total)) * Number(optprice) ;
  $(".prodprice").text(currency+optprice);
});
$("#input-quantity").keyup(function(){

    function commaSeparateNumber(val){
      while (/(\d+)(\d{3})/.test(val.toString())){
        val = val.toString().replace(/(\d+)(\d{3})/, '$1'+','+'$2');
      }
      return val;
    }
    var total = $("#input-quantity").val();
    var price = $(".prodprice").data('actprice').replace(/,/g, '').match(/\d+/)[0];
    var result= Number(parseInt(total)) * Number(price) ;
    var newprice=commaSeparateNumber(result);
    $(".prodprice").text("Rs"+newprice);
  });

//--></script> 