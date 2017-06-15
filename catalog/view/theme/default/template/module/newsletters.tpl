<script>
		function subscribe()
		{
			var emailpattern = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
			var email = $('#txtemail').val();
			if(email != "")
			{
				if(!emailpattern.test(email))
				{
					alert("Invalid Email");
					return false;
				}
				else
				{
					$.ajax({
						url: 'index.php?route=module/newsletters/news',
						type: 'post',
						data: 'email=' + $('#txtemail').val(),
						dataType: 'json',
						
									
						success: function(json) {
						
						alert(json.message);
						
						}
						
					});
					return false;
				}
			}
			else
			{
				alert("Email Is Require");
				$(email).focus();
				return false;
			}
			

		}
	</script>
	

<h2 class="new_hd"><?php echo $heading_title; ?></h2>
<div class="">
<div class="row">
	<div class="">
	<form action="" method="post">
		<div class="form-group required lblDet">
            <label class="col-sm-8 control-label" for="input-firstname">Enter Your Email</label>
            <div class="col-sm-10 txtfrm padL">
              <input type="email" name="txtemail" id="txtemail" value="" placeholder="" class="form-control input-lg"  /> 
    	       
            </div>
		</div>
		<div class="form-group required">
            <div class="col-sm-10 padL">
              <button type="submit" class="btn btn-default btn-lg" onclick="return subscribe();">Subscribe</i></button>  
    	       
            </div>
		</div>
		</form>
     </div>     
</div>
</div>
