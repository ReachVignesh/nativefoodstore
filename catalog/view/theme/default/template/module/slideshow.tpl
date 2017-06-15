<div class="col-md-12 nopad">
 <div id="slideshow<?php echo $module; ?>" class="owl-carousel" style="opacity: 1;">
  <?php foreach ($banners as $banner) { ?>
  <div class="item">
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" class="img-responsive" />
    <?php } ?>
  </div>
  <?php } ?>
  </div>
  </div>
  <div class="col-md-12">
    <!-- <div class="container-fluid srvcProvide">
      <div class="row strOptn">
      <div class="col-md-3 col-sm-3 col-xs-12 optDv col1">
      <div class="cover"><div class="crclIcon"></div><p>ORGANIC DALS &amp; PULSES</p>
      </div>
    </div>
      <div class="col-md-3 col-sm-3 col-xs-12 optDv col2">
      <div class="cover"><div class="crclIcon"></div><p>FRUIT STORE
      </p></div>
    </div>
    <div class="col-md-3 col-sm-3 col-xs-12 optDv">
     <div class="cover"><div class="crclIcon"></div><p>HEALTH DRINKS
    </p></div>
    </div>
    </div>
    </div> -->
</div><!-- container-fluid -->
  </div>
</div>
</div>
</div>
<script type="text/javascript">
$('#slideshow<?php echo $module; ?>').owlCarousel({
	items: 6,
	autoPlay: 8000,
	singleItem: true,
	navigation: false,
	navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
	pagination: true
});
$('.offer-banner-section').owlCarousel({
  items:3,
  autoPlay: false,
 /* singleItem: true,*/
  navigation: true,
  navigationText: ['<i class="fa fa-chevron-left fa-5x"></i>', '<i class="fa fa-chevron-right fa-5x"></i>'],
  pagination: false
});
--></script>