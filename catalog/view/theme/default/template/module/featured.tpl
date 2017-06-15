<h3 class="hmHdng"><?php echo $heading_title; ?></h3>
<h4 class="feaSubtit">Best Premium Quality Organic Farm Products for you</h4>
<div class="container">
<div class="row" id="feature">
  <?php foreach ($products as $product) { ?>
  <div class="col-xs-12 col-sm-4 col-md-3 col-lg-3 featBLk">
    <div class="product-thumb transition">
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
      
      <div class="caption caption1">
        <div class="prodDet prodDet1">
          <?php if($product['manufacturer']){?>
          	<p class="brndName"><span><a href="<?php echo HTTP_SERVER.$product['manufacturer']; ?>"><?php echo $product['manufacturer']; ?></a></span></p>
          <?php } ?>
          <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
          <!--<p><?php echo $product['description']; ?></p>-->
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
        <p class="price outstk">
          <?php if($product['stock'] < 1 ) { ?>
          <?php echo $text_stock_status; ?>
          <?php } ?>
          <?php if (!$product['special']) { ?>
          <span class="orgprice"><?php echo $product['price']; ?></span>
          <?php } else { ?>
          <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
          <span class="discount"><?php echo $product['discount']."%"; ?></span>
          <?php } ?>          
        </p>
        <?php } ?>
        <ul class="catSize cf">
          <?php foreach ($product['product_option_value'] as $option_value) { ?>
        <li><?php if ($option_value['quantity']>0) { echo $option_value['name']; } else { ?>
          <span class="outofstock"><?php echo $option_value['name'];?></span>
          <?php } ?></li>
        <?php } ?>
        </ul>
      </div>
      <div class="btnDet btnDet1">
      <?php if ($product['notify_enable']){ ?>
      	<button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="shopNwBtn"><i class="fa fa-bell"><span class=""></i><?php echo $product['button_cart']; ?></span></button>
      <?php }else{ ?>
        <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');" class="shopNwBtn"><i class="fa cartWhl"></i><span class=""> ADD</span></button>
      <?php } ?>  
      <!--   <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button> -->
      </div>         
    </div>
  </div>
  <?php } ?>
</div>
</div>
<script type="text/javascript"><!--
/*$('#feature').owlCarousel({
	items: 4,
	autoPlay: false,
    pagination : false,
    paginationNumbers : false,
	navigation: true,
	navigationText: ['<i class="fa fa-angle-left ftrIcon animate fa-5x"></i>', '<i class="fa fa-angle-right ftrIcon animate fa-5x"></i>']
});
*/--></script>
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