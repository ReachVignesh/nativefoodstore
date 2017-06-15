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
<meta name="google-site-verification" content="CjuM0LkxFdjet5IugijVJ2Q0j-LFQO1NyX5fPThfi0s" />
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
<link href='https://fonts.googleapis.com/css?family=Quicksand:400,300,700' rel='stylesheet' type='text/css'>
<script src="catalog/view/javascript/jquery/jquery-2.1.1.min.js" type="text/javascript"></script>
<script src="catalog/view/javascript/jquery-ui.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/bootstrap/css/bootstrap.min.css" rel="stylesheet" media="screen" />
<script src="catalog/view/javascript/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<link href="catalog/view/javascript/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
<link href="//fonts.googleapis.com/css?family=Lato:300,400,700,900" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/jquery.fancybox.css">

<link href="catalog/view/theme/default/stylesheet/stylesheet.css" rel="stylesheet">
<link href="catalog/view/theme/default/stylesheet/media-query.css" rel="stylesheet">
<script src="http://maps.googleapis.com/maps/api/js?sensor=false&libraries=places" type="text/javascript"></script>
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
<!-- Google Tag Manager (noscript) -->
<noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-TXPFKVP"
height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
<!-- End Google Tag Manager (noscript) -->


<nav id="top">
  <div class="container">
  <div class="row">
    <div class="hidden-xs col-sm-12 col-md-7 col-lg-6  nopad welcometxt">Welcome to Native Foodstore</div>
    <?php echo $language; ?>

    <div id="top-links" class="nav pull-right">
      <ul class="list-inline wishBk">
        <?php if ($logged) { ?>
        <li class="dropdown"><a href="<?php echo $account; ?>" title="<?php echo $text_account; ?>" class="dropdown-toggle" data-toggle="dropdown"> <i class="fa fa-user"></i> <span class=" hidden-sm"><?php echo "Welcome ".ucwords($firstname); ?></span> <span class="caret"></span></a>
          <ul class="dropdown-menu dropdown-menu-right">
            <li><a href="<?php echo $account; ?>"><?php echo $text_account; ?></a></li>
            <li><a href="<?php echo $order; ?>"><?php echo $text_order; ?></a></li>
            <li><a href="<?php echo $transaction; ?>"><?php echo $text_transaction; ?></a></li>
            <li><a href="<?php echo $download; ?>"><?php echo $text_download; ?></a></li>
            <li><a href="<?php echo $logout; ?>"><?php echo $text_logout; ?></a></li>
          </ul>
        </li>
        <?php } else { ?>
    		<?php } ?>
        <li class="text-left"><a href="<?php echo $register; ?>" title="<?php echo $register; ?>"><span class=""><?php echo $text_register; ?></span></a></li>
        <?php if (!$logged) { ?>
        <li class="text-right prdli"><a href="<?php echo $login; ?>" title="<?php echo $text_checkout; ?>"><!-- <i class="fa fa-lock"></i> --> <span class=""><?php echo $text_login; ?></span></a></li>
        <?php } ?>
      </ul>
    </div>

    <div class="share-btn">
        <li>
          <a target="_blank" href="https://www.facebook.com/nativefoodstore/">
            <i class="fa fa-facebook" aria-hidden="true"></i>
          </a></li>
        <li>
          <a href="https://twitter.com/nativefoodstore" target="_blank">
            <i class="fa fa-twitter" aria-hidden="true"></i>
          </a>
        </li>
        <li>
         <a href="https://plus.google.com/107598561877544934568"><i class="fa fa-google-plus" aria-hidden="true"></i>
         </a>
         </li>
        <li>
          <a href="https://in.pinterest.com/nativefoodstore/" target="_blank">
        <i class="fa fa-pinterest" aria-hidden="true"></i>
        </a>
        </li>
        <li>
          <a href="https://www.instagram.com/nativefoodstoreofficial"><i class="fa fa-instagram" aria-hidden="true"></i>
        </a>
        </li>
      </div>
  </div>
  </div>
 <!--   -->
</nav>
<header>
  <div class="container">
    <div class="row">
      <div class="col-sm-5 col-xs-4 medhedd">
        <div id="logo">
          <?php if ($logo) { ?>
          <a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" class="img-responsive" /></a>
          <?php } else { ?>
          <h1><a href="<?php echo $home; ?>"><?php echo $name; ?></a></h1>
          <?php } ?>
        </div>
      </div>
      <div class="col-sm-4 hidden-sm nopad">
      <?php echo $search; ?></div>
      <div class="cartt hidden-sm nopad mt40"><?php echo $cart; ?></div>
    </div>
  </div>

<?php if ($categories) { ?>
<div class="menuBdr">
<div class="container">
  <div class="row topMenuHolder">
  <div class="bgPos cf">
    <div class="bgWrap"></div>
    <div class="shop_cat nopad ">
      <div class="poRel">
        <a href="javascript:void(0)" class="sBc cathrd">SHOP BY CATEGORIES</a>
        <nav id="menu" class="navbar <?php  $url = "http://$_SERVER[SERVER_NAME]$_SERVER[REQUEST_URI]"; if($url == $home || $url == $base){?>hmMnu<?php }else{?>innerDrop<?php }?>">
          <div class="">
         
            <ul class="nav navbar-nav catMenu catDetailMenu inrcat">
              <?php $count =1; foreach ($categories as $category) { ?>
            <?php if ($category['children']) { ?>
              <li class="dropdown"><a href="<?php echo $category['href']; ?>" class="dropdown-toggle"><?php echo $category['name']; ?></a>             
              <div class="dropdown-menu drpBox<?php echo $count; ?> <?php echo 'dropDwnBg'.$count; ?>">
                <div class="dropdown-inner cf">
                  <?php foreach (array_chunk($category['children'], ceil(count($category['children']) / $category['column'])) as $children) { ?>
                    <?php 
                    $childcount = 1;
                    foreach ($children as $child) {
                    if($childcount<=15){ ?>
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
              </div>
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
    <div class="hidden-xs nxt_lnk nopad">
      <a href="about-us" class="splOff col-sm-3 col-xs-3">ABOUT US</a>
      <a href="information/contact" class="splOff col-sm-3 col-xs-3">CONTACT US</a>
      <a href="http://blog.nativefoodstore.com/" class="splOff col-sm-3 col-xs-3">BLOG</a>
    </div>
<?php } ?>
</div>
</div>
</div>
</div>
</header>
<script>
	$(document).ready( function() {
    $('.price, .prodprice').html(function(i, v) {
        return v.replace(/Rs/g, 'Rs.');    
    });
			$(".dDgirls, .dDboys").append("<div class='bg'></div>");
    	});

    var user_logged = "<?php echo $logged; ?>";
    if(user_logged){
      $("ul").removeClass("wishBk");
    }
</script>

<script type="text/javascript">
  $(document).ready(function(){
  $(window).bind('scroll', function() {
    var navHeight = 100; // custom nav height
    ($(window).scrollTop() > navHeight) ? $('header').addClass('goToTop') : $('header').removeClass('goToTop');
  });
});
</script>
