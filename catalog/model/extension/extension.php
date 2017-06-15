<?php
class ModelExtensionExtension extends Model {
	function getExtensions($type) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "extension WHERE `type` = '" . $this->db->escape($type) . "'");

		return $query->rows;
	}

	public function getPincode() {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "delivery_pincode");

		return $query->rows;	
	}

	public function getCheckingPincode($pincode) {
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "delivery_pincode WHERE pincode = '". $pincode ."' AND location_status = 1");

		return $query->row;	
	}
}