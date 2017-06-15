<div id="banner<?php echo $module; ?>" class="owl-carousel" >
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
<script type="text/javascript">
$('#banner<?php echo $module; ?>').owlCarousel({
	items: 4,
	autoPlay: true,
	slideSpeed : 8000,
  paginationSpeed : 9000,
	rewindSpeed : 12000,
	singleItem: true,
	navigation: false,
	pagination: false,
	transitionStyle: 'fade'
});
</script>
