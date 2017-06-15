<!DOCTYPE html>
<!--[if IE]><![endif]-->
<!--[if IE 8 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie8"><![endif]-->
<!--[if IE 9 ]><html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" class="ie9"><![endif]-->
<!--[if (gt IE 9)|!(IE)]><!-->
<html dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>">
<!--<![endif]-->
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><?php echo $title; ?></title>
<?php if (isset($_GET['filter']) || isset($_GET['order']) || isset($_GET['sort'])|| isset($_GET['limit']) || isset($_GET['page'])) { ?>
<meta name="robots" content="NOINDEX,FOLLOW" />
<?php } else { ?>
<meta name="robots" content="INDEX,FOLLOW" />
<?php } ?>
<style type="text/css">
  li.active {color: black;}
</style>
<base href="<?php echo $base; ?>" />
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content= "<?php echo $keywords; ?>" />
<?php } ?>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,600,700,300' rel='stylesheet' type='text/css'>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/jquery.fancybox.css">
<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<?php foreach ($styles as $style) { ?>
<link href="<?php echo $style['href']; ?>" type="text/css" rel="<?php echo $style['rel']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script src="catalog/view/javascript/common.js" type="text/javascript"></script>





<!--<script src="catalog/view/javascript/imagezoom.js" type="text/javascript"></script>-->
<?php foreach ($scripts as $script) { ?>
<script src="<?php echo $script; ?>" type="text/javascript"></script>

<?php } ?>
<?php echo $google_analytics; ?>
</head>
<body class="<?php echo $class; ?>">
<nav id="top">
  <div class="container">
  <div class="row">
    <div class="hidden-xs col-sm-12 col-md-7 col-lg-6  nopad welcometxt">Welcome to The Organic Base. We bring you the best organic products at your doorstep</div>
    <?php echo $language; ?>

    <div id="top-links" class="nav pull-right">
      <ul class="list-inline wishBk">
        <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"><!-- <i class="fa fa-user"></i>  --><span class=" hidden-sm"><?php echo $text_account; ?></span> <span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-menu-right">
            <?php if ($logged) { ?>
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
            <?php } else { ?>
            <li><a href="<?php echo $register; ?>"><?php echo $text_register; ?></a></li>
            <li><a href="<?php echo $login; ?>"><?php echo $text_login; ?></a></li>
            <?php } ?>
          </ul>
        </li>
        <li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><span class=" hidden-sm"><?php echo $text_wishlist; ?></span></a></li>
        <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><span class=" hidden-sm"><?php echo $text_checkout; ?></span></a></li>
        <!--<li><a href="<?php echo $wishlist; ?>" id="wishlist-total" title="<?php echo $text_wishlist; ?>"><i class="fa fa-heart"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_wishlist; ?></span></a></li>
        <li><a href="<?php echo $checkout; ?>" title="<?php echo $text_checkout; ?>"><i class="fa fa-share"></i> <span class="hidden-xs hidden-sm hidden-md"><?php echo $text_checkout; ?></span></a></li>-->
        <li><a href="<?php echo $login; ?>" title="<?php echo $text_checkout; ?>"><!-- <i class="fa fa-lock"></i> --> <span class=" hidden-sm"><?php echo $text_login; ?></span></a></li>
      </ul>
    </div>
  </div>
  </div>
</nav>
<header>
  <div class="container">
    <div class="row">
      <div class="col-sm-4 col-xs-4">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-sm-4 hidden-xs hidden-sm nopad">
      <?php echo $search; ?></div>
      <div class="col-md-2 col-sm-3 hidden-xs cartList"><?php echo $cart; ?><span class="cartTitle">MY CART</span></div>
      <div class="col-md-2 col-sm-3 hidden-xs">
        <div class="hShare">
          <span class="title">Share:</span>
          <span class='st_facebook' displayText='Facebook'></span>
          <span class='st_twitter' displayText='Tweet'></span>
          <span class='st_linkedin' displayText='LinkedIn'></span>
          <span class='st_googleplus' displayText='Google +'></span>
          <!--<span class='st_pinterest' displayText='Pinterest'></span>-->
          <span class='st_email' displayText='Email'></span>
        </div>
      </div>
    </div>
  </div>
</header>
<?php if ($categories) { ?>
<div class="menuBdr">
<div class="container">
  <div class="row topMenuHolder">
  <div class="bgPos cf">
    <div class="bgWrap"></div>
    <div class="col-sm-4 col-xs-12 col-md-3 col-lg-3 nopad ">
      <div class="poRel">
        <a href="javascript:void(0)" class="sBc cathrd">CATEGORIES <i class="fa fa-angle-down fandwn"></i></a>
        <nav id="menu" class="navbar <?php  $url = "http://$_SERVER[SERVER_NAME]$_SERVER[REQUEST_URI]"; if($url == $home || $url == $base){?>hmMnu<?php }else{?>innerDrop<?php }?>">
          <!-- <div class="navbar-header"><span id="category" class="visible-xs"><?php echo $text_category; ?></span>
            <button type="button" class="btn btn-navbar navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse"><i class="fa fa-bars"></i></button>
          </div> -->
          <div class=""> <!-- collapse navbar-collapse navbar-ex1-collapse -->
         
            <ul class="nav navbar-nav catMenu catDetailMenu">
              <?php $count =1; foreach ($categories as $category) { ?>
            <?php if ($category['children']) { ?>
              <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle"><?php echo $category['name']; ?></a>             
              <div class="dropdown-menu drpBox<?php echo $count; ?> <?php echo 'dropDwnBg'.$count; ?>">
                <div class="dropdown-inner cf">
                  <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                    <?php 
                    $childcount = 1;
                    foreach ($children as $child) {
                    if($childcount<=8){ ?>
                    <div class="navDdCatSec">
                      <h3 class="drpHdng hidden-xs hidden-sm"><a class="tophd" href="<?php echo $child['href']; ?>"><?php echo $child['name']; ?></a></h3>
                        <?php if($category['sub_children']){ ?>
                        <?php foreach (array_chunk($category['sub_children'], ceil(count($category['sub_children']) / $category['column'])) as $sub_children) { ?>
                        <ul class="">
                          <?php $subchildcount=1;foreach ($sub_children as $sub_child) { 
                            if($subchildcount<=7){
                              if($sub_child['parent_id']==$child['id']){?>
                                <li><a href="<?php echo $sub_child['href']; ?>"><?php echo $sub_child['name']; ?></a></li>
                            <?php $subchildcount++; }}                          
                            }
                            if($subchildcount>=2){?>
                              <li><a href="<?php echo $child['href']; ?>">more...</a></li>
                            <?php }?>
                        </ul>
                        <?php }} ?>
                    </div>
                    <?php $childcount++;}} ?>
                  <?php } ?>
                </div>
              </div><!-- dropdown-menu --> 
              <script>
              $(document).ready( function() {
                  var total = $(".drpBox<?php echo $count; ?> .dropdown-inner ul.column > li").size();
                  var count = 7;
                  var column = 0;
  
                  for (var i = 0; i < total; i += count) {
                    column++;
                    $(".drpBox<?php echo $count; ?> .dropdown-inner").append('<ul class="column' + column + '"></ul>');
                    $(".drpBox<?php echo $count; ?> .column" + column).html($(".drpBox<?php echo $count; ?> .column > li").splice(0, count));
                  }
                  $(".drpBox<?php echo $count; ?> .column").remove();
                  $(".column-sub").parent("li:nth-child(1)").addClass("dropDwnBg1");
                  $(".column-sub").parent("li:nth-child(9)").addClass("dropDwnBg2");
                  $(".column-sub").parent().parent().addClass("dDkids cf");
              });
              </script>
            </li>
                
                <?php } else { ?>
                <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
                <?php } ?>
              <?php $count++;} ?>
            <a href="product/category/viewlist" class="viewCat">View All Categories</a>
            </ul>

          </div>
      </nav>
      </div>
    </div>
    <div class="hidden-xs col-sm-8 col-md-9 col-lg-9 nopad">
      <a href="special-offers" class="splOff col-sm-3 col-xs-3">SPECIAL OFFERS</a>
      <a href="new-arrivalss" class="newArr col-sm-3 col-xs-3">NEW ARRIVALS</a>
      <div  class="freeShipp col-sm-6 col-xs-6"><div class="crclIcon"><i class="shipping"></i></div><p>FREE SHIPPING ON AND ABOVE  <span> &#8377;1000 </span> SHOPPING</p></div>
    </div>
<?php } ?>
<script>
	$(document).ready( function() {
    $('.price, .prodprice').html(function(i, v) {
        return v.replace(/Rs/g, 'Rs.');    
    });
			$(".dDgirls, .dDboys").append("<div class='bg'></div>");
    	});
</script>

