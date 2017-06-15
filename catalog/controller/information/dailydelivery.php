<?php
class ControllerInformationDailyDelivery extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('information/dailydelivery');
		$this->load->model('catalog/dailydelivery');

		$this->document->setTitle($this->language->get('heading_title'));
		//$this->document->addScript('catalog/view/javascript/maps.js');
		//$this->document->addScript('catalog/view/javascript/jquery.min.js');
		//$this->document->addScript('catalog/view/javascript/jquery.geocomplete.min.js');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			
			$this->model_catalog_dailydelivery->addDailyProduct($this->request->post);
			$this->response->redirect($this->url->link('information/dailydelivery/success'));
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/dailydelivery')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_delivery'] 	= $this->language->get('text_delivery');
		$data['entry_name'] 	= $this->language->get('entry_name');
		$data['entry_email'] 	= $this->language->get('entry_email');
		$data['entry_phone']    = $this->language->get('entry_phone');
		$data['entry_location'] = $this->language->get('entry_location');
		$data['entry_products'] = $this->language->get('entry_products');

		$data['button_map'] = $this->language->get('button_map');

		if (isset($this->error['name'])) {
			$data['error_name'] = $this->error['name'];
		} else {
			$data['error_name'] = '';
		}

		if (isset($this->error['email'])) {
			$data['error_email'] = $this->error['email'];
		} else {
			$data['error_email'] = '';
		}

		if (isset($this->error['phone_number'])) {
			$data['error_phone'] = $this->error['phone_number'];
		} else {
			$data['error_phone'] = '';
		}

		if (isset($this->error['location'])) {
			$data['error_location'] = $this->error['location'];
		} else {
			$data['error_location'] = '';
		}

		if (isset($this->error['products'])) {
			$data['error_products'] = $this->error['products'];
		} else {
			$data['error_products'] = '';
		}

		$data['button_submit'] = $this->language->get('button_submit');

		$data['action'] = $this->url->link('information/dailydelivery');

		$data['store'] = $this->config->get('config_name');
		$data['address'] = nl2br($this->config->get('config_address'));
		$data['geocode'] = $this->config->get('config_geocode');
		$data['telephone'] = $this->config->get('config_telephone');
		$data['fax'] = $this->config->get('config_fax');
		$data['open'] = nl2br($this->config->get('config_open'));
		$data['comment'] = $this->config->get('config_comment');

		$data['locations'] = array();

		$this->load->model('localisation/location');

		foreach((array)$this->config->get('config_location') as $location_id) {
			$location_info = $this->model_localisation_location->getLocation($location_id);

			if ($location_info) {

				$data['locations'][] = array(
					'location_id' => $location_info['location_id'],
					'name'        => $location_info['name'],
					'address'     => nl2br($location_info['address']),
					'geocode'     => $location_info['geocode'],
					'telephone'   => $location_info['telephone'],
					'fax'         => $location_info['fax'],
					'open'        => nl2br($location_info['open']),
					'comment'     => $location_info['comment']
				);
			}
		}

		if (isset($this->request->post['name'])) {
			$data['name'] = $this->request->post['name'];
		} else {
			$data['name'] = $this->customer->getFirstName();
		}

		if (isset($this->request->post['email'])) {
			$data['email'] = $this->request->post['email'];
		} else {
			$data['email'] = $this->customer->getEmail();
		}

		if (isset($this->request->post['phone_number'])) {
			$data['phone_number'] = $this->request->post['phone_number'];
		} else {
			$data['phone_number'] = $this->customer->getTelephone();
		}

		if (isset($this->request->post['location'])) {
			$data['location'] = $this->request->post['location'];
		} else {
			$data['location'] = (isset($this->session->data['shipping_address']['city']) ?  $this->session->data['shipping_address']['city'] : "");
		}

		if (isset($this->request->post['products'])) {
			$data['products'] = $this->request->post['products'];
		} else {
			$data['products'] = array('Milk'=>'Milk-Litres','Slim-Milk'=>'Slim Milk-Litres','Butter'=>'Butter-Grams/Kilograms','Paneer'=>'Paneer-Grams/Kilograms','Ghee'=>'Ghee-Grams/Kilograms','Bread'=>'Bread-Pounds','Egg'=>'Egg-Units');
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/dailydelivery.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/information/dailydelivery.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/information/dailydelivery.tpl', $data));
		}
	}

	public function success() {
		$this->load->language('information/dailydelivery');

		$this->document->setTitle($this->language->get('heading_title'));

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/home')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('information/dailydelivery')
		);

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_message'] = $this->language->get('text_success');

		$data['button_continue'] = $this->language->get('button_continue');

		$data['continue'] = $this->url->link('common/home');

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/success.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/success.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/success.tpl', $data));
		}
	}

	protected function validate() {
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 32)) {
			$this->error['name'] = $this->language->get('error_name');
		}

		if (!preg_match('/^[^\@]+@.*.[a-z]{2,15}$/i', $this->request->post['email'])) {
			$this->error['email'] = $this->language->get('error_email');
		}

		if ((utf8_strlen($this->request->post['phone_number']) < 10) || (utf8_strlen($this->request->post['phone_number']) > 3000)) {
			$this->error['phone_number'] = $this->language->get('error_phone');
		}

		if (!$this->request->post['location']) {
			$this->error['location'] = $this->language->get('error_location');
		}

		return !$this->error;
	}
}
