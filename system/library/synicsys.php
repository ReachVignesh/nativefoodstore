<?php

class Synicsys{

	protected $url = "http://alerts.synicsys.com/api/web2sms.php";	

	public function send($to, $params)
	{	 
		if ($to) {	
			$ch = curl_init($this->url);			
			curl_setopt($ch, CURLOPT_POST, 1);			
			curl_setopt($ch, CURLOPT_POSTFIELDS, "workingkey=".$params['working_key']."&sender=" . $params['sender_id'] . "&to=" . $to . "&message=" . $params['message'] . "");			
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);			
			$res = curl_exec($ch);	
			return $res;
		}	
	}
}