<?php
class ModelCatalogDailyDelivery extends Model {
	public function addDailyProduct($data) {
		//$this->event->trigger('pre.admin.product.add', $data);
		$products = array_combine(array_filter($data['products']),array_filter($data['quantity']));
		
		$this->db->query("INSERT INTO " . DB_PREFIX . "daily_delivery_customers SET name = '" . $this->db->escape($data['name']) . "', email	 = '" . $this->db->escape($data['email']) . "', phone_number = '" . $this->db->escape($data['phone_number']) . "', location = '" . $this->db->escape($data['location']) . "', products = '" . json_encode($products) . "', date_added = NOW()");

		$daily_delivery_id = $this->db->getLastId();
	}
}		