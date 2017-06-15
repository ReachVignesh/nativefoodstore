<div id="search" class="input-group">
  <input type="text" name="headsearch" value="<?php echo $search; ?>"  placeholder="<?php echo $text_search; ?>" class="form-control input-lg" />
  <span class="input-group-btn">
    <button type="button" class="btn btn-default btn-lg srchbtn"><i class="fa fa-search"></i></button>
  </span>
</div>
<script>
$('#search input[name=\'headsearch\']').parent().find('button').on('click', function() {
		url = $('base').attr('href') + 'index.php?route=product/search';
		var value = $('input[name=\'headsearch\']').val();
		if (value) {
			url += '&search=' + encodeURIComponent(value);
		}
		location = url;
	});

	$('#search input[name=\'headsearch\']').on('keydown', function(e) {
		if (e.keyCode == 13) {
			$('input[name=\'headsearch\']').parent().find('button').trigger('click');
		}
	});
</script>