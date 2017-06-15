<?php
class ControllerCommonHome extends Controller {
	public function index() {
		$this->document->setTitle($this->config->get('config_meta_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));
		$this->document->setKeywords($this->config->get('config_meta_keyword'));

		if (isset($this->request->get['route'])) {
			$this->document->addLink(HTTP_SERVER, 'canonical');
		}

		$data['column_left'] = $this->load->controller('common/column_left');
		$data['column_right'] = $this->load->controller('common/column_right');
		$data['content_top'] = $this->load->controller('common/content_top');
		$data['content_bottom'] = $this->load->controller('common/content_bottom');
		$data['footer'] = $this->load->controller('common/footer');
		$data['header'] = $this->load->controller('common/header');

		//For Best Sellers
		$this->load->language('module/hb_oosnm');
		$hb_oosn_stock_status = $this->config->get('hb_oosn_stock_status');
		$hb_oosn_product_qty = $this->config->get('hb_oosn_product_qty');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		$results = $this->model_catalog_product->getBestSellerProducts(3);

		if ($results) {
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], 270, 183);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', 270, 183);
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				/*if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}*/

				//-----------Discount-----------
				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
					$discount_price=$result['price'] - $result['special'];
					$discount = round(($discount_price/$result['price']) * 100);
				} else {
					$special = false;
					$discount=false;
				}
				//-----------Discount-----------

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$result['special'] ? $result['special'] : $result['price']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}
				
				$product_option_value_data = array();
				foreach ($this->model_catalog_product->getProductOptions ($result['product_id']) as $option) {
					foreach ($option['product_option_value'] as $option_value) {
						$product_option_value_data[] = array(
						'product_option_value_id' => $option_value['product_option_value_id'],
						'option_value_id'         => $option_value['option_value_id'],
						'name'                    => $option_value['name'],
						'quantity'				=>$option_value['quantity']
						);
					}
				} 
				
				

				$data['products'][] = array(
					'discount'		=> $discount,
					'product_id'  => $result['product_id'],
					'quantity'  => $result['quantity'],
					'stockstatusid'  => $result['stock_status_id'],
					'button_cart'	=> (($result['quantity'] < $hb_oosn_product_qty) && (($result['stock_status_id'] == $hb_oosn_stock_status) or ($hb_oosn_stock_status == 0)))? $this->language->get('button_notify_button'):$this->language->get('button_cart'),
					'notify_enable'	=> (($result['quantity'] < $hb_oosn_product_qty) && (($result['stock_status_id'] == $hb_oosn_stock_status) or ($hb_oosn_stock_status == 0)))? true:false,
					'thumb'       => $image,
					'name'        => $result['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($result['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'product_option_value' => $product_option_value_data,
					'tax'         => $tax,
					'rating'      => $rating,
					'minimum'     => $result['minimum'],
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
				);
			}
		}
		//echo "<pre>";print_r($data['products']);die;

		//For Hot products
		$data['hot_products'] = array();
		$discount = '';
		$hot_product_list = $this->model_catalog_product->getHotProducts();
		if(!empty($hot_product_list)) {
			foreach ($hot_product_list as $hot_products) {
			if(!empty($hot_products)) {	
				if ($hot_products['image']) {
					$image = $this->model_tool_image->resize($hot_products['image'], 270, 183);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', 270, 183);
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($hot_products['price'], $hot_products['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				if ((float)$hot_products['special']) {
					$special = $this->currency->format($this->tax->calculate($hot_products['special'], $hot_products['tax_class_id'], $this->config->get('config_tax')));
					$price = $this->currency->format($this->tax->calculate($hot_products['price'], $hot_products['tax_class_id'], $this->config->get('config_tax')));
					$discount_price=$hot_products['price'] - $hot_products['special'];
					$discount = round(($discount_price/$hot_products['price']) * 100);
				} else {
					$special = false;
					$discount=false;
				}

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$hot_products['special'] ? $hot_products['special'] : $hot_products['price']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $hot_products['rating'];
				} else {
					$rating = false;
				}

				$product_option_value_data = array();
				foreach ($this->model_catalog_product->getProductOptions ($hot_products['product_id']) as $option) {
					foreach ($option['product_option_value'] as $option_value) {
						$product_option_value_data[] = array(
						'product_option_value_id' => $option_value['product_option_value_id'],
						'option_value_id'         => $option_value['option_value_id'],
						'name'                    => $option_value['name'],
						'quantity'				=>$option_value['quantity']
						);
					}
				} 

				$data['hot_products'][] = array(
				'discount'		=> $discount,
				'product_id'  => $hot_products['product_id'],
				'quantity'  => $hot_products['quantity'],
				'stockstatusid'  => $hot_products['stock_status_id'],
				'button_cart'	=> (($hot_products['quantity'] < $hb_oosn_product_qty) && (($hot_products['stock_status_id'] == $hb_oosn_stock_status) or ($hb_oosn_stock_status == 0)))? $this->language->get('button_notify_button'):$this->language->get('button_cart'),
				'notify_enable'	=> (($hot_products['quantity'] < $hb_oosn_product_qty) && (($hot_products['stock_status_id'] == $hb_oosn_stock_status) or ($hb_oosn_stock_status == 0)))? true:false,
				'thumb'       => $image,
				'name'        => $hot_products['name'],
				'description' => utf8_substr(strip_tags(html_entity_decode($hot_products['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
				'price'       => $price,
				'special'     => $special,
				'product_option_value' => $product_option_value_data,
				'tax'         => $tax,
				'rating'      => $rating,
				'minimum'     => $hot_products['minimum'],
				'href'        => $this->url->link('product/product', 'product_id=' . $hot_products['product_id']),
			);
			}				
			}
			
		}
			

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->response->setOutput($this->load->view($this->config->get('config_template') . '/template/common/home.tpl', $data));
		} else {
			$this->response->setOutput($this->load->view('default/template/common/home.tpl', $data));
		}
	}
}