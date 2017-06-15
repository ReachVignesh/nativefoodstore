 <?php
ini_set('display_errors',1);
$PayuMoney_BASE_URL = "https://www.payumoney.com/payment/payment/chkMerchantTxnStatus?";

$action = '';
$posted = array();
if(!empty($_POST)) {

  foreach($_POST as $key => $value) {
     
   $posted[$key] = htmlentities($value, ENT_QUOTES);
  }
  //var_dump($posted);
  
  $postData = array();
  $postData['merchantKey']=$posted['merchantKey'];
  unset($posted['merchantKey']);
  $postData['merchantTransactionIds']=$posted['merchantTransactionIds'];
  unset($posted['merchantTransactionIds']);
  $postNow = http_build_query($postData);

  //$postNow = $postNow .'&jsonSplits=['.$postNow.']';
  var_dump($postNow);
  $response = curlCall($PayuMoney_BASE_URL.$postNow,TRUE);
  var_dump($response);
  
}
/*foreach ($posted as $key => $value) {
    echo "posted[".$key."]=".$value."<br>";
}*/
//echo $posted;
$formError = 0;



function curlCall($postUrl, $toSend) {
   
  $ch = curl_init();
   
  curl_setopt($ch, CURLOPT_POST, 1);
  curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
  curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
  curl_setopt($ch, CURLOPT_POSTFIELDS, $toSend);
  curl_setopt($ch, CURLOPT_URL, $postUrl);
  curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);

  $header = array(
     'Authorization: NW1nmoWfcWTNfBblbM8gg7Dzzu3NETUBaKLYF8zp+mg='
  );
  curl_setopt($ch, CURLOPT_HTTPHEADER, $header);
   
  $out = curl_exec($ch);
  //if got error
  if (curl_errno($ch)) {
    $c_error = curl_error($ch);
    if (empty($c_error)) {
      $c_error = 'Some server error';
    }
    return array('curl_status' => 'FAILURE', 'error' => $c_error);
  }
  $out = trim($out);
  return array('curl_status' => 'SUCCESS', 'result' => $out);
}


?>

<html>
  <body >
    <h2>PayuMoney Form</h2>
    <br/>
	
	<form action="<?php echo $action; ?>" method="post" name="PayuMoneyForm">
	<input name ="merchantKey" value="8GsO9jXv" type="hidden"/>
      <table>
        <tr>
          <td><b>Mandatory Parameters</b></td>
        </tr>
		<tr>
          <td>Merchant Transaction ID: </td>
          <td><input name="merchantTransactionIds" id="merchantTransactionIds" value="<?php echo (empty($posted['merchantTransactionId'])) ? '' : $posted['merchantTransactionIds']; ?>" /></td>
        </tr>
		</table>
		<input type="submit" value="submit"/>
    </form>

  </body>
</html>
