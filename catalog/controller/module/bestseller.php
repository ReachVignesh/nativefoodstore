<?php
class ControllerModuleBestSeller extends Controller {
	public function index($setting) {
		$this->load->language('module/bestseller');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->language('module/hb_oosnm');
		$hb_oosn_stock_status = $this->config->get('hb_oosn_stock_status');
		$hb_oosn_product_qty = $this->config->get('hb_oosn_product_qty');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		$results = $this->model_catalog_product->getBestSellerProducts($setting['limit']);

		if ($results) {
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
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
					'href'        => $this->url->link('product/product', 'product_id=' . $result['product_id']),
				);
			}

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/bestseller.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/bestseller.tpl', $data);
			} else {
				return $this->load->view('default/template/module/bestseller.tpl', $data);
			}
		}
	}
}