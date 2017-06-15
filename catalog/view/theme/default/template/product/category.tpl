<?php echo $header; ?>
<style type="text/css">
.poRel:hover .inrcat{top: -38px }
</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.2/themes/smoothness/jquery-ui.css">
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-ui.js"></script>
<script type="text/javascript" src="catalog/view/javascript/blockUi.js"></script>
<div class="container">
 <div class="row">
   <?php if ($thumb) { ?>
  <div class="cat_banner"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" /></div>
  <?php } ?>
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row catMain">
    <?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <div class="col-md-12 cstmHdng_h2 nopad">
      <div class="col-md-5 nopad mgrlft">
      <h2 class="mT0" ><?php echo $heading_title; ?></h2>
      </div>
       <div class="col-md-1 text-right nopad sort">
          <label class="control-label catlabel" for="input-sort"><?php echo $text_sort; ?></label>
        </div>
        <div class="col-md-3 text-right ">
          <select id="input-sort" class="form-control" onchange="location = this.value;">
            <?php foreach ($sorts as $sorts) { ?>
            <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
            <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
        <div class="col-md-1 text-right show">
          <label class="control-label catlabel" for="input-limit"><?php echo $text_limit; ?></label>
        </div>
        <div class="col-md-2 text-right mB20">
          <select id="input-limit" class="form-control" onchange="location = this.value;">
            <?php foreach ($limits as $limits) { ?>
            <?php if ($limits['value'] == $limit) { ?>
            <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
            <?php } else { ?>
            <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
            <?php } ?>
            <?php } ?>
          </select>
        </div>
      </div>
      <?php if ($thumb || $description) { ?>
      <div class="row">
        <?php if ($description) { ?>
        <?php } ?>
      </div>
      <!-- <hr> -->
      <?php } ?>    
      <?php if ($products) { ?>
      <div class="row">
        <div class="col-md-4">
          <div class="btn-group hidden-xs hidden-sm hidden-md hidden-lg">
            <button type="button" id="grid-view" class="btn btn-default icnActv" data-toggle="tooltip" title="<?php echo $button_grid; ?>"><i class="fa fa-th"></i></button>  
            <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="<?php echo $button_list; ?>"><i class="fa fa-th-list"></i></button>            
          </div>
        </div>
      </div>
      <br />
      <div class="row" id="loadproducts">

        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-list col-xs-12" id="product<?php echo $product['product_id']; ?>">
      <div class="product-thumb transition mb60">
      <div class="image mb40">
         
        <a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a>
      </div>

      <?php if ($product['options']) { ?>
        <?php foreach ($product['options'] as $option) { ?>
          <?php if ($option['type'] == 'select') { ?>
          <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
            <select data-product="<?php echo $product["product_id"]; ?>" name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control seloptions formInp slect">
              <?php foreach ($option['product_option_value'] as $option_value) { ?>
              <option data-priceprefix="<?php echo $option_value['price_prefix']; ?>" data-optprice="<?php echo $option_value['price']; ?>" value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>                      
              </option>
              <?php } ?>
              <input type="text" name="quantity" value="<?php echo $product['minimum']; ?>" class="inpt1">
            </select>
          </div>  
          <?php } ?>
        <?php } ?>
      <?php } else { ?>
      <input type="hidden" name="quantity" value="<?php echo $product['minimum']; ?>" class="inpt1">
      <?php } ?>

      <div class="caption">
        <div class="prodDet">
          <?php if($product['manufacturer']){?>
            <p class="brndName"><span><a href="<?php echo HTTP_SERVER.$product['manufacturer']; ?>"><?php echo $product['manufacturer']; ?></a></span></p>
          <?php } ?>
          <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
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
          <?php if($product['stock'] < 1 ) { ?>
          <?php echo $text_stock_status; ?>
          <?php } ?>  
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
          <input type="hidden" name="product_id" value="<?php echo $product["product_id"]; ?>"/>
          <?php if ($product['notify_enable']){ ?>
          <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>', '<?php echo $product['minimum']; ?>');">
          <i class="fa fa-bell"></i><?php }else{ ?>
          <button type="button" class="addToCart" data-product="<?php echo $product["product_id"]; ?>">
          <i class="fa fa-shopping-cart"></i> <?php } ?> <span class="hidden-xs hidden-sm hidden-md"><?php echo $product['button_cart']; ?></span></button>
        </div>
        <ul class="catSize cf">
        <?php if($page_category_id !=120) { ?>
          <?php foreach ($product['product_option_value'] as $option_value) { ?>
        <li><?php if ($option_value['quantity']>0) { echo $option_value['name']; } else { ?>
          <span class="outofstock"><?php echo $option_value['name'];?></span>
          <?php } ?></li>
        <?php } ?>
        <?php } ?>
        </ul>
      </div>      
    </div>
</div>
        <?php } ?>
      </div>
      <div class="row">
        <div class="col-sm-8  col-md-7 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-4 text-right mT37"><?php echo $results; ?></div>
      </div>
      <?php } ?>
      <?php if (!$categories && !$products) { ?>
      <p><?php echo $text_empty; ?></p>
      <div class="buttons">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php } ?>
      <?php echo $content_bottom; ?></div>
</div>
</div>
</div>
</div>
</div>
</div>
<div class="modal fade" id="quickView" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>

<script type="text/javascript">
$(document).delegate(".shopNwBtn","click",function(){
  $(".modal-content").empty();
});
$('body').on('hidden.bs.modal', '.modal', function () {
    $(this).removeData('bs.modal');
});
</script>
<?php echo $footer; ?>
 <script type="text/javascript">
// $('.sBc').click(function(){
//   $('.sBc i').toggleClass('iconRot');
//   $('.catDetailMenu').slideToggle(800);
// });

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
function optselect(elem){
  var product_id = elem.data('product');
  var currency = $("#product"+product_id+" .prodprice").html();
  var priceprefix = elem.find("option:selected").data('priceprefix');
  var optprice = elem.find("option:selected").data('optprice').match(/\d+/)[0];
  var actprice = $("#product"+product_id+" .prodprice").data('actprice').match(/\d+/)[0];
  if(priceprefix=="+"){
    optprice = Number(parseInt(actprice)) + Number(optprice);
  }
  else if(priceprefix=="-"){
    optprice = Number(parseInt(actprice)) - Number(optprice);
  }
  else{
    optprice = actprice;
  }
  var total = $("#product"+product_id+" input[name=\'quantity\']").val();
  optprice = Number(parseInt(total)) * Number(optprice) ;
  $("#product"+product_id+" .prodprice").html(currency.replace($("#product"+product_id+" .prodprice").text().match(/\d+/)[0], optprice));
}

$(".seloptions").change(function(){
  optselect($(this))
});

// </script>

