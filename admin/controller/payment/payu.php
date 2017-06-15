<?php 
class ControllerPaymentPayu extends Controller {
	private $error = array(); 

	public function index() {
		$this->load->language('payment/payu');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
			
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('payu', $this->request->post);				
			
			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');
		$data['text_all_zones'] = $this->language->get('text_all_zones');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_live'] = $this->language->get('text_live');
		$data['text_successful'] = $this->language->get('text_successful');
		$data['text_fail'] = $this->language->get('text_fail');
		$data['demo'] = $this->language->get('demo');		
		$data['entry_merchant'] = $this->language->get('entry_merchant');
		$data['entry_salt'] = $this->language->get('entry_salt');
		$data['entry_test'] = $this->language->get('entry_test');
		$data['entry_total'] = $this->language->get('entry_total');	
		$data['entry_order_status'] = $this->language->get('entry_order_status');		
		$data['entry_geo_zone'] = $this->language->get('entry_geo_zone');
		$data['entry_status'] = $this->language->get('entry_status');
		$data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$data['help_password'] = $this->language->get('help_password');
		$data['help_total'] = $this->language->get('help_total');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
        $data['help_salt'] = $this->language->get('help_salt');
		$data['tab_general'] = $this->language->get('tab_general');

 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}
		
		if (isset($this->error['merchant'])) {
			$data['error_merchant'] = $this->error['merchant'];
		} else {
			$data['error_merchant'] = '';
		}



        if (isset($this->error['salt'])) {
			$data['error_salt'] = $this->error['salt'];
		} else {
			$data['error_salt'] = '';
		}




  		$data['breadcrumbs'] = array();

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_payment'),
			'href'      => $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);

   		$data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('payment/payu', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
				
		$data['action'] = $this->url->link('payment/payu', 'token=' . $this->session->data['token'], 'SSL');
		
		$data['cancel'] = $this->url->link('extension/payment', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->post['payu_merchant'])) {
			$data['payu_merchant'] = $this->request->post['payu_merchant'];
		} else {
			$data['payu_merchant'] = $this->config->get('payu_merchant');
		}
		
		if (isset($this->request->post['payu_salt'])) {
			$data['payu_salt'] = $this->request->post['payu_salt'];
		} else {
			$data['payu_salt'] = $this->config->get('payu_salt');
		}
		
		
		if (isset($this->request->post['payu_test'])) {
			$data['payu_test'] = $this->request->post['payu_test'];
		} else {
			$data['payu_test'] = $this->config->get('payu_test');
		}
		
		if (isset($this->request->post['payu_total'])) {
			$data['payu_total'] = $this->request->post['payu_total'];
		} else {
			$data['payu_total'] = $this->config->get('payu_total'); 
		} 
				
		if (isset($this->request->post['payu_order_status_id'])) {
			$data['payu_order_status_id'] = $this->request->post['payu_order_status_id'];
		} else {
			$data['payu_order_status_id'] = $this->config->get('payu_order_status_id'); 
		} 

		$this->load->model('localisation/order_status');
		
		$data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses();
		
		if (isset($this->request->post['payu_geo_zone_id'])) {
			$data['payu_geo_zone_id'] = $this->request->post['payu_geo_zone_id'];
		} else {
			$data['payu_geo_zone_id'] = $this->config->get('payu_geo_zone_id'); 
		} 
		
		$this->load->model('localisation/geo_zone');
										
		$data['geo_zones'] = $this->model_localisation_geo_zone->getGeoZones();
		
		if (isset($this->request->post['payu_status'])) {
			$data['payu_status'] = $this->request->post['payu_status'];
		} else {
			$data['payu_status'] = $this->config->get('payu_status');
		}
		
		if (isset($this->request->post['payu_sort_order'])) {
			$data['payu_sort_order'] = $this->request->post['payu_sort_order'];
		} else {
			$data['payu_sort_order'] = $this->config->get('payu_sort_order');
		}
        $data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

				
		$this->response->setOutput($this->load->view('payment/payu.tpl', $data));
	}

	private function validate() {
		if (!$this->user->hasPermission('modify', 'payment/payu')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->request->post['payu_merchant']) {
			$this->error['merchant'] = $this->language->get('error_merchant');
		}
			
		if (!$this->request->post['payu_salt']) {
			$this->error['salt'] = $this->language->get('error_salt');
		}
		
				
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>