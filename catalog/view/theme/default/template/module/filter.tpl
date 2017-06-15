<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-ui.js"></script>
<div class="panel panel-default norad ">
  <!--<div class="panel-heading"><?php //echo $heading_title; ?></div>-->
  
  <div class="list-group">
    <?php foreach ($filter_groups as $filter_group) { ?>    
    <a class="list-group-item fltrHdng"><?php echo $filter_group['name']; ?> <i class="fa fa-angle-down"></i></a>    
    <div class="list-group-item">
      <div id="filter-group<?php echo $filter_group['filter_group_id']; ?>">
       <?php if($filter_group['filter_group_id']!=6){ ?>
       <!--<input type="text" id="dino-search_<?php echo $filter_group['filter_group_id']; ?>" placeholder="Search By <?php echo $filter_group['name']; ?>">  -->    
       <?php } ?>
        <?php foreach ($filter_group['filter'] as $filter) {
        $count = 0; $color=""; 
        $color = preg_replace('/\(([^()]*+|(?R))*\)\s*/', '', $filter['name']);
        $color = rtrim(str_replace(range(0,9),'',$color)," ");
        preg_match_all('/\(([A-Za-z0-9 ]+?)\)/', $filter['name'], $out);
      $count = $out[1][0];?>
        <?php if (in_array($filter['filter_id'], $filter_category)) { ?>
        <label class="checkbox" <?php if($filter_group['filter_group_id']==6){ ?> data-toggle="tooltip" data-placement="top" title="" data-original-title="<?php echo ucfirst(strtolower($color)); ?>" data-color="<?php echo strtolower($color); ?>" <?php }?>>
          <input name="filter[]" type="checkbox" <?php if($count==0){ ?>disabled<?php }?> value="<?php echo $filter['filter_id']; ?>" checked="checked" />
          <?php echo $filter['name']; ?></label>
        <?php } else { ?>
        <label  class="checkbox" <?php if($filter_group['filter_group_id']==6){ ?> data-toggle="tooltip" data-placement="top" title="" data-original-title="<?php echo ucfirst(strtolower($color)); ?>" data-color="<?php echo strtolower($color); ?>" <?php }?>>
          <input name="filter[]" type="checkbox" <?php if($count==0){ ?>disabled<?php }?> value="<?php echo $filter['filter_id']; ?>" />
          <?php echo $filter['name']; ?></label>
        <?php } ?>
        <?php } ?>
        </ul>
      </div>
    </div>
    <?php } ?>
  </div>
  <div class="panel-footer">
    <?php
    $amount_min = $min_product_price;$amount_max = $max_product_price;
    if(isset($_GET['amtmin']) && $_GET['amtmin']!=""){
      $amount_min = $_GET['amtmin'];
    }
    if(isset($_GET['amtmax']) && $_GET['amtmax']!=""){
      $amount_max = $_GET['amtmax'];
    }
    ?>
    <label for="amount">Price range:</label>
    <span id="amtmin"></span> - <span id="amtmax"></span>
    <input type="hidden" id="amount" readonly style="border:0; color:#f6931f; font-weight:bold;">
    <div id="slider-range"></div>
  </div>
</div>
<script type="text/javascript">
     /* $(document).ready(function(){
        var filter_grp_id = '<?php echo $filter_group["filter_group_id"]; ?>';
        var count = $("#filter-group"+filter_grp_id+" label").length;
        if(count >= 5) {
          $("#filter-group"+filter_grp_id).addClass('filterGrp'+filter_grp_id);
        }
        $("#dino-search_"+filter_grp_id).on("keyup click input", function () {
          if (this.value.length > 0) {
            $(".filterGrp"+filter_grp_id+" label").hide().filter(function () {
              return $(this).text().toLowerCase().indexOf($("#dino-search_"+filter_grp_id).val().toLowerCase()) != -1;
            }).show();
          }else {
            $(".filterGrp"+filter_grp_id+" label").show();
          }
        });
      });*/
        $(document).ready(function(){ 
            var count = $("#filter-group<?php echo $filter_group['filter_group_id']; ?> label").length;
            if(count >= 5) {
            $("#filter-group<?php echo $filter_group['filter_group_id']; ?>").addClass('filterGrp');
            }
        });
</script>
<script type="text/javascript"><!--
    $("#filter-group6 .checkbox").each(function(){
      var color = $(this).data("color");
      $(this).wrap('<div data-filter="'+color+'">');
      $(this).parent('div').css("background",color);
    });
    $("#filter-group6 :checkbox:checked").each(function(){
      $(this).parent().parent().addClass("active");
    });
    $("#filter-group6 :checkbox:disabled").each(function(){
      $(this).parent().parent().addClass("disable");
    });

    $('input[name^=\'filter\']').on('change', function() {
      filter = [];
  
  $('input[name^=\'filter\']:checked').each(function(element) {
    filter.push(this.value);
  });
  
  //location = '<?php echo $action; ?>&filter=' + filter.join(',');
  window.history.pushState("","",'<?php echo $action; ?>&filter=' + filter.join(','));
  $.ajax({
    url: '<?php echo $action; ?>&filter=' + filter.join(','),
    type: 'post',   
    cache: false,
    contentType: false,
    processData: false,   
    beforeSend: function() {
      $('#content').block({message:'<img src="<?php echo HTTP_SERVER; ?>image/ajax-loader.gif">'}); 
      //$("#content").fadeOut("slow");
    },
    complete: function() {        
      //$("#content").fadeIn("slow");
      $('#content').unblock();
    },    
    success: function(data) {
      $("body").empty().append(data);     
    },      
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
  });
  $(document).ready(function () {
    $('.fltrHdng').click(function() {
     $(this).toggleClass('iconRot2').next('.list-group-item').slideToggle();
    })
    // filter dinosaurs as you type 
    $("#dino-search").on("keyup click input", function () {
    if (this.value.length > 0) {
      $(".filterGrp label").hide().filter(function () {
        return $(this).text().toLowerCase().indexOf($("#dino-search").val().toLowerCase()) != -1;
      }).show();
    }
    else {
      $(".filterGrp label").show();
    }
    });
  });
  setTimeout(function(){
    var filter_len = $('input[name^=\'filter\']:checked').length
    $("#auto_filter_values").empty();
    if(filter_len>1){
      $("#auto_filter_values").append('<div class="afr clearall">Clear All filters</div>')  
    }
    $('input[name^=\'filter\']:checked').each(function(element) { 
      $("#auto_filter_values").append('<div class="afr" data-val="'+this.value+'">'+$(this).parent().text().replace(/\(([A-Za-z0-9 ]+?)\)/, '')+'</div>')
    });
    }, 100);  
    $(document).delegate(".clearall","click",function(){
      location = '<?php echo $action; ?>';
    });
    $(document).delegate(".afr","click",function(){
      var filter_id = parseInt($(this).data("val"));
      $('input:checkbox[value="'+filter_id+'"]').attr("checked",false);
      filter = [];
      $('input[name^=\'filter\']:checked').each(function(element) {
      filter.push(this.value);
      });
      window.history.pushState("","",'<?php echo $action; ?>&filter=' + filter.join(','));
      $.ajax({
      url: '<?php echo $action; ?>&filter=' + filter.join(','),
      type: 'post',   
      cache: false,
      contentType: false,
      processData: false,   
      beforeSend: function() {
        $('#content').block({message:'<img src="<?php echo HTTP_SERVER; ?>image/ajax-loader.gif">'}); 
        //$("#content").fadeOut("slow");
      },
      complete: function() {  
        $(this).remove();
        //$("#content").fadeIn("slow");
        $('#content').unblock();
      },    
      success: function(data) {
        $("body").empty().append(data);
      },      
      error: function(xhr, ajaxOptions, thrownError) {
        alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
      }
      });
    });
    $( "#slider-range" ).slider({
      range: true,
      min: <?php echo $min_product_price; ?>,
      max: <?php echo $max_product_price; ?>,
      values: [ <?php echo $amount_min; ?>, <?php echo $amount_max; ?> ],
      create: function (event, ui) {
             $( "#amount" ).val( "Rs " + $( "#slider-range" ).slider( "values", 0 ) +"  -  Rs " +
            $( "#slider-range" ).slider( "values", 1 ) );
            $('#amtmin').text('Rs '+$("#slider-range").slider("values")[0]);
            $('#amtmax').text('Rs '+$("#slider-range").slider("values")[1]);
      },
      slide: function( event, ui ) {
				    $('#amtmin').text('Rs '+$("#slider-range").slider("values")[0]);
            $('#amtmax').text('Rs '+$("#slider-range").slider("values")[1]);
            $( "#amount" ).val( "Rs " + ui.values[ 0 ] + "  -  Rs " + ui.values[ 1 ] );
      },
      stop: function (event, ui) {
            filter = [];
            $('input[name^=\'filter\']:checked').each(function(element) {
              filter.push(this.value);
            });
            amount=[];
            var amtmin = ui.values[0];
            var amtmax = ui.values[1];
            amount.push(amtmin,amtmax);
            $('#amtmin').text('Rs '+$("#slider-range").slider("values")[0]);
            $('#amtmax').text('Rs '+$("#slider-range").slider("values")[1]);
            window.history.pushState("","",'<?php echo $action; ?>&filter=' + filter.join(',')+'&amtmin=' + amtmin+'&amtmax='+amtmax);
            $("body").load('<?php echo $action; ?>&filter=' + filter.join(',')+'&amtmin=' + amtmin+'&amtmax='+amtmax);
      }
    });

//--></script> 
