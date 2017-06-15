<?php echo $header; ?>
<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?>"><?php echo $content_top; ?>
      <h1><?php echo $heading_title; ?></h1>
      <div class="panel panel-default">
      </div>
     <!--  <p>1. Buy now grocery for making your breakfast, experience the comfort of shopping from anywhere.</p> -->
      <p class="dlypara">Order grocery for making your breakfast, we will deliver at your door step. Experience the comfort of shopping from home.</p>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <h3><?php echo $text_delivery; ?></h3>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
            <div class="col-sm-10">
              <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-phone_number"><?php echo $entry_phone; ?></label>
            <div class="col-sm-10">
              <input type="text" name="phone_number" value="<?php echo $phone_number; ?>" id="input-phone_number" class="form-control" />
              <?php if ($error_phone) { ?>
              <div class="text-danger"><?php echo $error_phone; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-location"><?php echo $entry_location; ?></label>
            <div class="col-sm-10">
              <input type="text" name="location" value="<?php echo $location; ?>" id="input-location" class="form-control" />
              <?php if ($error_location) { ?>
              <div class="text-danger"><?php echo $error_location; ?></div>
              <?php } ?>
            </div>
          </div>
           <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-entry_products"><?php echo $entry_products; ?></label>
            <div class="col-sm-10">
              <div class="radio">
              <div class="parnt cf">
                <?php foreach($products as $key => $value) { $value = explode('-', $value);?>
                <div class="cf">
                <div class="chckbtn">
                <input type="checkbox" name="products[]" value="<?php echo $key; ?>" id="input-products" /><?php echo $value[0];?>
                </div>

                <div class="inpt">
                <input type="text" name="quantity[]" id="input-quantity" placeholder="<?php echo $value[1];?>"/></br>
                </div>
               </div>
                <?php } ?>
                 </div>
              </div>  
              <?php if ($error_products) { ?>
              <div class="text-danger"><?php echo $error_products; ?></div>
              <?php } ?>
            </div>
          </div>
        </fieldset>
        <div class="buttons btnn">
          <div class="pull-center txtcntr">
            <input class="btn btn-primary mnbtn" type="submit" value="<?php echo $button_submit; ?>" />
          </div>
        </div>
      </form>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
</div>
</div>
</div>
<?php echo $footer; ?>
<!--<script>
$(function () { 
  $("#location").geocomplete({
    details: ".geo-details",
    detailsAttribute: "data-geo"
  });

});
</script>-->