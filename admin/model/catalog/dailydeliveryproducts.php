<?php
class ModelCatalogDailyDeliveryProducts extends Model {
	
	public function getTotalDeliveryEnquiries() {
		$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "customer_group");

		return $query->row['total'];
		$sql = "SELECT COUNT(*) AS total FROM `" . DB_PREFIX . "daily_delivery_customers`";
		$query = $this->db->query($sql);
		return $query->row['total'];
	}

	public function deleteDeliveryCustomer($daily_customer_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "daily_delivery_customers WHERE daily_customer_id = '" . (int)$daily_customer_id . "'");
	}

	public function getDeliveryEnquiries($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "daily_delivery_customers dc";

		$sort_data = array(
			'dc.name',
			'dc.sort_order'
		);

		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];
		} else {
			$sql .= " ORDER BY dc.name";
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}

		if (isset($data['start']) || isset($data['limit'])) {
			if ($data['start'] < 0) {
				$data['start'] = 0;
			}

			if ($data['limit'] < 1) {
				$data['limit'] = 20;
			}

			$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
		}

		$query = $this->db->query($sql);

		return $query->rows;
	}

	public function getDeliveryCustomer($daily_customer_id) {
		$sql = "SELECT * FROM " . DB_PREFIX . "daily_delivery_customers dc WHERE daily_customer_id = '" . (int)$daily_customer_id . "'";
		$query = $this->db->query($sql);		

		return $query->row;
	}
}	

	