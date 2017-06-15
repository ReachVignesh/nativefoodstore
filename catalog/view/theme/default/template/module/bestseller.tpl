<h3 class="hmHdng"><?php echo $heading_title; ?></h3>
<div class="row" id="bestseller">
  <?php foreach ($products as $product) { ?>
  <div class="item">
    <div class="product-thumb transition">
      <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" /></a></div>
        <div class="button-group">
        <button type="button" onclick="cart.add('<?php echo $product['product_id']; ?>');"><?php if ($product['notify_enable']){ ?><i class="fa fa-bell"></i><?php }else{ ?><i class="fa fa-shopping-cart"></i> <?php } ?> <span class="hidden-xs hidden-sm hidden-md"><?php echo $product['button_cart']; ?></span></button>
        <button type="button" data-toggle="tooltip" title="<?php echo $button_wishlist; ?>" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>        
      </div>
      <div class="caption">
        <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
        <p><?php echo $product['description']; ?></p>
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
    </div>
  </div>
  <?php } ?>
</div>
<script type="text/javascript"><!--
$('#bestseller').owlCarousel({
	items: 4,
	autoPlay: false,
	navigation: true,
	navigationText: ['<i class="fa fa-angle-left ftrIcon fa-5x"></i>', '<i class="fa fa-angle-right ftrIcon fa-5x"></i>'],
	pagination: true
});
--></script>