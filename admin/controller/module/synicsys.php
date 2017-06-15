<?php
class ControllerModuleSynicsys extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('module/synicsys');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('setting/setting');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('synicsys', $this->request->post);

			// $settings = $this->model_setting_setting->getSetting('synicsys'); 

			// echo '<pre>'; print_r($settings); exit;

			$this->session->data['success'] = $this->language->get('text_success');

			$this->response->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}

		$data['heading_title'] = $this->language->get('heading_title');		
		$data['text_edit'] = $this->language->get('text_edit');
		$data['text_yes'] = $this->language->get('text_yes');
		$data['text_no'] = $this->language->get('text_no');
		$data['text_enabled'] = $this->language->get('text_enabled');
		$data['text_disabled'] = $this->language->get('text_disabled');		
		$data['entry_status'] = $this->language->get('entry_status');
		$data['button_save'] = $this->language->get('button_save');
		$data['button_cancel'] = $this->language->get('button_cancel');
		$data['entry_website_url'] = $this->language->get('entry_website_url');
		$data['entry_working_key'] = $this->language->get('entry_working_key');
		$data['entry_sender_id'] = $this->language->get('entry_sender_id');
		$data['entry_admin1'] = $this->language->get('entry_admin1');
		$data['entry_admin2'] = $this->language->get('entry_admin2');
		$data['entry_admin3'] = $this->language->get('entry_admin3');
		$data['entry_admin4'] = $this->language->get('entry_admin4');
		$data['entry_admin_notify'] = $this->language->get('entry_admin_notify');
		$data['entry_user_reg_notify'] = $this->language->get('entry_user_reg_notify');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_module'),
			'href' => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('module/synicsys', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['action'] = $this->url->link('module/synicsys', 'token=' . $this->session->data['token'], 'SSL');

		$data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->post['synicsys_status'])) {
			$data['synicsys_status'] = $this->request->post['synicsys_status'];
		} else {
			$data['synicsys_status'] = $this->config->get('synicsys_status');
		}

		if (isset($this->request->post['synicsys_website_url'])) {
			$data['synicsys_website_url'] = $this->request->post['synicsys_website_url'];
		} else {
			$data['synicsys_website_url'] = $this->config->get('synicsys_website_url');
		}

		if (isset($this->request->post['synicsys_website_url'])) {
			$data['synicsys_working_key'] = $this->request->post['synicsys_working_key'];
		} else {
			$data['synicsys_working_key'] = $this->config->get('synicsys_working_key');
		}

		if (isset($this->request->post['synicsys_sender_id'])) {
			$data['synicsys_sender_id'] = $this->request->post['synicsys_sender_id'];
		} else {
			$data['synicsys_sender_id'] = $this->config->get('synicsys_sender_id');
		}

		if (isset($this->request->post['synicsys_admin1'])) {
			$data['synicsys_admin1'] = $this->request->post['synicsys_admin1'];
		} else {
			$data['synicsys_admin1'] = $this->config->get('synicsys_admin1');
		}

		if (isset($this->request->post['synicsys_admin2'])) {
			$data['synicsys_admin2'] = $this->request->post['synicsys_admin2'];
		} else {
			$data['synicsys_admin2'] = $this->config->get('synicsys_admin2');
		}

		if (isset($this->request->post['synicsys_admin3'])) {
			$data['synicsys_admin3'] = $this->request->post['synicsys_admin3'];
		} else {
			$data['synicsys_admin3'] = $this->config->get('synicsys_admin3');
		}

		if (isset($this->request->post['synicsys_admin4'])) {
			$data['synicsys_admin4'] = $this->request->post['synicsys_admin4'];
		} else {
			$data['synicsys_admin4'] = $this->config->get('synicsys_admin4');
		}	

		if (isset($this->request->post['synicsys_reg_notify'])) {
			$data['synicsys_reg_notify'] = $this->request->post['synicsys_reg_notify'];
		} else {
			$data['synicsys_reg_notify'] = $this->config->get('synicsys_reg_notify');
		}	

		if (isset($this->request->post['synicsys_admin_notify'])) {
			$data['synicsys_admin_notify'] = $this->request->post['synicsys_admin_notify'];
		} else {
			$data['synicsys_admin_notify'] = $this->config->get('synicsys_admin_notify');
		}	

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('module/synicsys.tpl', $data));
	}

	protected function validate() {
		if (!$this->user->hasPermission('modify', 'module/synicsys')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

		return !$this->error;
	}
}