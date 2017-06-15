<?php echo $header; ?><?php echo $column_left; ?>
<div id="content">
  <div class="page-header">
    <div class="container-fluid">
      <div class="pull-right">
        <button type="submit" form="form-synicsys" data-toggle="tooltip" title="<?php echo $button_save; ?>" class="btn btn-primary"><i class="fa fa-save"></i></button>
        <a href="<?php echo $cancel; ?>" data-toggle="tooltip" title="<?php echo $button_cancel; ?>" class="btn btn-default"><i class="fa fa-reply"></i></a></div>
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
    <div class="panel panel-default">
      <div class="panel-heading">
        <h3 class="panel-title"><i class="fa fa-pencil"></i> <?php echo $text_edit; ?></h3>
      </div>
      <div class="panel-body">
        <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form-synicsys" class="form-horizontal">
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_status; ?></label>
            <div class="col-sm-10">
              <select name="synicsys_status" id="input-status" class="form-control">
                <?php if ($synicsys_status) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>          
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_user_reg_notify; ?></label>
            <div class="col-sm-10">
              <select name="synicsys_reg_notify" id="input-status" class="form-control">
                <?php if ($synicsys_reg_notify) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_website_url; ?></label>
            <div class="col-sm-10">
              <input type="text" name="synicsys_website_url" value="<?php echo $synicsys_website_url; ?>" placeholder="<?php echo $entry_website_url; ?>" id="input-width" class="form-control" />             
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_working_key; ?></label>
            <div class="col-sm-10">
              <input type="text" name="synicsys_working_key" value="<?php echo $synicsys_working_key; ?>" placeholder="<?php echo $entry_working_key; ?>" id="input-width" class="form-control" />              
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_sender_id; ?></label>
            <div class="col-sm-10">
              <input type="text" name="synicsys_sender_id" value="<?php echo $synicsys_sender_id; ?>" placeholder="<?php echo $entry_sender_id; ?>" id="input-width" class="form-control" />              
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-status"><?php echo $entry_admin_notify; ?></label>
            <div class="col-sm-10">
              <select name="synicsys_admin_notify" id="input-status" class="form-control">
                <?php if ($synicsys_admin_notify) { ?>
                <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
                <option value="0"><?php echo $text_disabled; ?></option>
                <?php } else { ?>
                <option value="1"><?php echo $text_enabled; ?></option>
                <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
                <?php } ?>
              </select>
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_admin1; ?></label>
            <div class="col-sm-10">
              <input type="text" name="synicsys_admin1" value="<?php echo $synicsys_admin1; ?>" placeholder="<?php echo $entry_admin1; ?>" id="input-width" class="form-control" />             
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_admin2; ?></label>
            <div class="col-sm-10">
              <input type="text" name="synicsys_admin2" value="<?php echo $synicsys_admin2; ?>" placeholder="<?php echo $entry_admin2; ?>" id="input-width" class="form-control" />             
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_admin3; ?></label>
            <div class="col-sm-10">
              <input type="text" name="synicsys_admin3" value="<?php echo $synicsys_admin3; ?>" placeholder="<?php echo $entry_admin3; ?>" id="input-width" class="form-control" />             
            </div>
          </div>
          <div class="form-group">
            <label class="col-sm-2 control-label" for="input-width"><?php echo $entry_admin4; ?></label>
            <div class="col-sm-10">
              <input type="text" name="synicsys_admin4" value="<?php echo $synicsys_admin4; ?>" placeholder="<?php echo $entry_admin4; ?>" id="input-width" class="form-control" />             
            </div>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<?php echo $footer; ?>