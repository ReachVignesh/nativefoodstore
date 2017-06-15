<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="button" data-toggle="tooltip" title="<?php echo $button_delete; ?>" class="btn btn-danger" onclick="confirm('<?php echo $text_confirm; ?>') ? $('#delivery_customer').submit() : false;"><i class="fa fa-trash-o"></i></button>
      </div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <?php if ($error_warning) { ?>
    <div class="alert alert-danger"><i class="fa fa-exclamation-circle"></i> <?php echo $error_warning; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <?php if ($success) { ?>
    <div class="alert alert-success"><i class="fa fa-check-circle"></i> <?php echo $success; ?>
      <button type="button" class="close" data-dismiss="alert">&times;</button>
    </div>
    <?php } ?>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $text_list; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $delete; ?>" method="post" enctype="multipart/form-data" id="delivery_customer">
          <div class="table-responsive">
            <table class="table table-bordered table-hover">
              <thead>
                <tr>
                  <td style="width: 1px;" class="text-center"><input type="checkbox" onclick="$('input[name*=\'selected\']').prop('checked', this.checked);" /></td>
                  <td class="text-left"><?php if ($sort == 'dc.name') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_name; ?></a>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $column_name; ?></a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'dc.email') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_email; ?>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $column_email; ?></a>
                    <?php } ?></td>
                  <td class="text-left"><?php if ($sort == 'dc.phone_number') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_phone; ?>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $column_phone; ?></a>
                    <?php } ?>
                    </td>
                  <td class="text-left"><?php if ($sort == 'dc.location') { ?>
                    <a href="<?php echo $sort_name; ?>" class="<?php echo strtolower($order); ?>"><?php echo $column_location; ?>
                    <?php } else { ?>
                    <a href="<?php echo $sort_name; ?>"><?php echo $column_location; ?></a>
                    <?php } ?>
                    </td>
                  <td class="text-left"><?php echo $column_products; ?></td>  
                  <td class="text-left"><?php echo $column_date_added; ?></td>
                  <td class="text-right"><?php echo $column_action; ?></td>
                </tr>
              </thead>
              <tbody>
                <?php if ($daily_delivery_products) { ?>
                <?php foreach ($daily_delivery_products as $daily_delivery_customer) { ?>
                <tr>
                  <td class="text-center"><?php if (in_array($daily_delivery_customer['daily_customer_id'], $selected)) { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $daily_delivery_customer['daily_customer_id']; ?>" checked="checked" />
                    <?php } else { ?>
                    <input type="checkbox" name="selected[]" value="<?php echo $daily_delivery_customer['daily_customer_id']; ?>" />
                    <?php } ?></td>
                  <td class="text-left"><?php echo $daily_delivery_customer['name']; ?></td>
                  <td class="text-left"><?php echo $daily_delivery_customer['email']; ?></td>
                  <td class="text-left"><?php echo $daily_delivery_customer['phone_number']; ?></td>
                  <td class="text-left"><?php echo $daily_delivery_customer['location']; ?></td>
                  <td class="text-left"><?php $products = json_decode($daily_delivery_customer['products'], true); foreach($products as $key => $value) { ?>
                  <?php echo $key." ".$value."<br>"; ?>
                  <?php  } ?></td>
                  <td class="text-left"><?php echo date_format(date_create($daily_delivery_customer['date_added']),'d-m-Y | H:i'); ?></td>
                  <td class="text-right"><a href="<?php echo $daily_delivery_customer['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-primary"><i class="fa fa-eye"></i></a></td>
                </tr>
                <?php } ?>
                <?php } else { ?>
                <tr>
                  <td class="text-center" colspan="8"><?php echo $text_no_results; ?></td>
                </tr>
                <?php } ?>
              </tbody>
            </table>
          </div>
        </form>
        <div class="row">
          <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
          <div class="col-sm-6 text-right"><?php echo $results; ?></div>
        </div>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?> 