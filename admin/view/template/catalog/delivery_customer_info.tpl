<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right"><a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
      <h1><?php echo $heading_title; ?></h1>
      <ul class="breadcrumb">
        <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
        <?php } ?>
      </ul>
    </div>
  </div>
  <div class="container-fluid">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-list"></i> <?php echo $heading_title; ?></h3>
      </div>
      <div class="panel-body">
            <table class="table table-bordered">
              <tr>
                <td><?php echo $text_name; ?></td>
                <td><?php echo $name; ?></td>
              </tr>
              <tr>
                <td><?php echo $text_email; ?></td>
                <td><a href="mailto:<?php echo $email; ?>"><?php echo $email; ?></a></td>
              </tr>
              <tr>
                <td><?php echo $text_phone; ?></td>
                <td><?php echo $phone; ?></td>
              </tr>
                <tr>
                <td><?php echo $text_location; ?></td>
                <td><?php echo $location; ?></td>
              </tr>
              <tr>
                <td><?php echo $text_products; ?></td><td>
              <?php foreach ($products as $key => $value) { ?>
                <?php echo $key." ".$value."<br>"; ?>
              <?php } ?>
              </td></tr>
              <tr>
                <td><?php echo $text_date_added; ?></td>
                <td><?php echo $date_added; ?></td>
              </tr>
            </table>
    </div>
  </div>
</div>
<?php echo $footer; ?> 