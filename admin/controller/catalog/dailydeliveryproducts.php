<?php
class ControllerCatalogDailyDeliveryProducts extends Controller {
	private $error = array();

	public function index() {
		$this->load->language('catalog/daily_delivery_products');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/dailydeliveryproducts');

		$this->getList();
	}

	protected function getList() {
		if (isset($this->request->get['sort'])) {
			$sort = $this->request->get['sort'];
		} else {
			$sort = 'cgd.name';
		}

		if (isset($this->request->get['order'])) {
			$order = $this->request->get['order'];
		} else {
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['breadcrumbs'] = array();

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('text_home'),
			'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
		);

		$data['breadcrumbs'][] = array(
			'text' => $this->language->get('heading_title'),
			'href' => $this->url->link('catalog/dailydeliveryproducts', 'token=' . $this->session->data['token'] . $url, 'SSL')
		);

		$data['delete'] = $this->url->link('catalog/dailydeliveryproducts/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$data['daily_delivery_products'] = array();

		$filter_data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_limit_admin'),
			'limit' => $this->config->get('config_limit_admin')
		);

		$enquiry_customer_total = $this->model_catalog_dailydeliveryproducts->getTotalDeliveryEnquiries();

		$results = $this->model_catalog_dailydeliveryproducts->getDeliveryEnquiries($filter_data);

		foreach ($results as $result) {
			$data['daily_delivery_products'][] = array(
				'daily_customer_id' => $result['daily_customer_id'],
				'name'              => ucwords($result['name']),
				'email'             => $result['email'],
				'phone_number'      => $result['phone_number'],
				'location'          => ucwords($result['location']),
				'products'          => $result['products'],
				'date_added'        => $result['date_added'],
				'view'              => $this->url->link('catalog/dailydeliveryproducts/info', 'token=' . $this->session->data['token'] . '&daily_customer_id=' . $result['daily_customer_id'] . $url, 'SSL')
			);
		}

		$data['heading_title'] = $this->language->get('heading_title');
		
		$data['text_list'] = $this->language->get('text_list');
		$data['text_no_results'] = $this->language->get('text_no_results');
		$data['text_confirm'] = $this->language->get('text_confirm');

		$data['column_name'] = $this->language->get('column_name');
		$data['column_sort_order'] = $this->language->get('column_sort_order');
		$data['column_action'] = $this->language->get('column_action');
		$data['column_email'] = $this->language->get('column_email');
		$data['column_phone'] = $this->language->get('column_phone');
		$data['column_location'] = $this->language->get('column_location');
		$data['column_products'] = $this->language->get('column_products');
		$data['column_date_added'] = $this->language->get('column_date_added');

		$data['button_add'] = $this->language->get('button_add');
		$data['button_edit'] = $this->language->get('button_edit');
		$data['button_delete'] = $this->language->get('button_delete');
		$data['button_view'] = $this->language->get('button_view');

		if (isset($this->error['warning'])) {
			$data['error_warning'] = $this->error['warning'];
		} else {
			$data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$data['success'] = $this->session->data['success'];

			unset($this->session->data['success']);
		} else {
			$data['success'] = '';
		}

		if (isset($this->request->post['selected'])) {
			$data['selected'] = (array)$this->request->post['selected'];
		} else {
			$data['selected'] = array();
		}

		$url = '';

		if ($order == 'ASC') {
			$url .= '&order=DESC';
		} else {
			$url .= '&order=ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}

		$data['sort_name'] = $this->url->link('catalog/dailydeliveryproducts', 'token=' . $this->session->data['token'] . '&sort=dc.name' . $url, 'SSL');
		$data['sort_sort_order'] = $this->url->link('catalog/dailydeliveryproducts', 'token=' . $this->session->data['token'] . '&sort=dc.sort_order' . $url, 'SSL');

		$url = '';

		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}

		$pagination = new Pagination();
		$pagination->total = $enquiry_customer_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_limit_admin');
		$pagination->url = $this->url->link('catalog/dailydeliveryproducts', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$data['pagination'] = $pagination->render();

		$data['results'] = sprintf($this->language->get('text_pagination'), ($enquiry_customer_total) ? (($page - 1) * $this->config->get('config_limit_admin')) + 1 : 0, ((($page - 1) * $this->config->get('config_limit_admin')) > ($enquiry_customer_total - $this->config->get('config_limit_admin'))) ? $enquiry_customer_total : ((($page - 1) * $this->config->get('config_limit_admin')) + $this->config->get('config_limit_admin')), $enquiry_customer_total, ceil($enquiry_customer_total / $this->config->get('config_limit_admin')));

		$data['sort'] = $sort;
		$data['order'] = $order;

		$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('catalog/daily_delivery_enquiries.tpl', $data));
	}

	public function delete() {
		$this->load->language('catalog/daily_delivery_products');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->load->model('catalog/dailydeliveryproducts');

		if (isset($this->request->post['selected'])) {
			foreach ($this->request->post['selected'] as $daily_customer_id) {
				$this->model_catalog_dailydeliveryproducts->deleteDeliveryCustomer($daily_customer_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}

			$this->response->redirect($this->url->link('catalog/dailydeliveryproducts', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getList();
	}

	public function info() {
		$this->load->model('catalog/dailydeliveryproducts');

		if (isset($this->request->get['daily_customer_id'])) {
			$daily_customer_id = $this->request->get['daily_customer_id'];
		} else {
			$daily_customer_id = 0;
		}

		$delivery_customer_info = $this->model_catalog_dailydeliveryproducts->getDeliveryCustomer($daily_customer_id);

		if ($delivery_customer_info) {
			$this->load->language('catalog/daily_delivery_products');

			$this->document->setTitle($this->language->get('heading_title'));

			$data['heading_title'] = $this->language->get('heading_title');

			$data['text_name'] = $this->language->get('column_name');
			$data['column_sort_order'] = $this->language->get('column_sort_order');
			$data['text_action'] = $this->language->get('column_action');
			$data['text_email'] = $this->language->get('column_email');
			$data['text_phone'] = $this->language->get('column_phone');
			$data['text_location'] = $this->language->get('column_location');
			$data['text_products'] = $this->language->get('column_products');
			$data['text_date_added'] = $this->language->get('column_date_added');
			$data['button_cancel'] = $this->language->get('button_cancel');

			$data['name'] = $delivery_customer_info['name'];
			$data['email'] = $delivery_customer_info['email'];
			$data['phone'] = $delivery_customer_info['phone_number'];
			$data['location'] = $delivery_customer_info['location'];
			$data['products'] = json_decode($delivery_customer_info['products']);
			$data['date_added'] = $delivery_customer_info['date_added'];

			$data['breadcrumbs'] = array();

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('text_home'),
				'href' => $this->url->link('common/dashboard', 'token=' . $this->session->data['token'], 'SSL')
			);

			$data['breadcrumbs'][] = array(
				'text' => $this->language->get('heading_title'),
				'href' => $this->url->link('catalog/dailydeliveryproducts', 'token=' . $this->session->data['token'], 'SSL')
			);
			$data['cancel'] = $this->url->link('catalog/dailydeliveryproducts', 'token=' . $this->session->data['token'], 'SSL');

			$data['header'] = $this->load->controller('common/header');
			$data['column_left'] = $this->load->controller('common/column_left');
			$data['footer'] = $this->load->controller('common/footer');

			$this->response->setOutput($this->load->view('catalog/delivery_customer_info.tpl', $data));
		}
	}				

}	