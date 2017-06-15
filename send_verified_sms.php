<?php error_reporting(0);
		//print_r($_POST);
		if(isset($_POST['makeid']) && isset($_POST['user_id'])){
			include('config.php');
			$db_connect = mysql_connect(DB_HOSTNAME,DB_USERNAME,DB_PASSWORD)or die("could not connect to DB"); 
			mysql_select_db(DB_DATABASE,$db_connect)or die("could not find DB");
			
			if($_POST['user_type'] == 'site_user'){
				$res = mysql_query("SELECT telephone FROM `oc_customer` WHERE `customer_id` = '".$_POST['user_id']."'");
				$fetch = mysql_fetch_array($res);
				$tele_phone = $fetch['telephone'];
			}else{
				$tele_phone = $_POST['phoneNo'];
			}
			
			$res_send = mysql_query("SELECT value FROM `oc_setting` WHERE `key` = 'synicsys_sender_id'");
			$fetch_send = mysql_fetch_array($res_send);
			$synicsys_sender_id = $fetch_send['value'];
			
			$res_key = mysql_query("SELECT value FROM `oc_setting` WHERE `key` = 'synicsys_working_key'");
			$fetch_key = mysql_fetch_array($res_key);
			$synicsys_working_key = $fetch_key['value'];
			
			$urll = urlencode($_POST['makeid']." is your organic base verification code, please enter the code in to complete the order.");
			$curl = curl_init();
			curl_setopt_array($curl, array(
				CURLOPT_RETURNTRANSFER => 1,
				
				CURLOPT_URL => "http://alerts.synicsys.com/api/web2sms.php?workingkey=".$synicsys_working_key."&to=".$tele_phone."&sender=".$synicsys_sender_id."&message=".$urll,
				//CURLOPT_USERAGENT => 'Codular Sample cURL Request'
			));
			// Send the request & save response to $resp
			$resp = curl_exec($curl);
			// Close request to clear up some resources
			curl_close($curl);	
			echo $_POST['makeid'];
		}else{
			echo "not_ok";
		}
?>
