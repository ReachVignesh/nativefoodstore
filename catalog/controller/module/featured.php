<?php
class ControllerModuleFeatured extends Controller {
	public function index($setting) {
		$this->load->language('module/featured');

		$data['heading_title'] = $this->language->get('heading_title');

		$data['text_tax'] = $this->language->get('text_tax');
		$data['text_stock'] = $this->language->get('text_stock');
		$data['text_stock_status'] = $this->language->get('text_stock_status');

		$data['button_cart'] = $this->language->get('button_cart');
		$data['button_wishlist'] = $this->language->get('button_wishlist');
		$data['button_compare'] = $this->language->get('button_compare');

		$this->load->language('module/hb_oosnm');
		$hb_oosn_stock_status = $this->config->get('hb_oosn_stock_status');
		$hb_oosn_product_qty = $this->config->get('hb_oosn_product_qty');

		$this->load->model('catalog/product');

		$this->load->model('tool/image');

		$data['products'] = array();

		if (!$setting['limit']) {
			$setting['limit'] = 4;
		}

		$products = array_slice($setting['product'], 0, (int)$setting['limit']);
		$data['options'] = array();
		foreach ($products as $product_id) {
			$product_info = $this->model_catalog_product->getProduct($product_id);

			if ($product_info) {
				if ($product_info['image']) {
					$image = $this->model_tool_image->resize($product_info['image'], $setting['width'], $setting['height']);
				} else {
					$image = $this->model_tool_image->resize('placeholder.png', $setting['width'], $setting['height']);
				}

				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}

				//-----------Discount-----------
				if ((float)$product_info['special']) {
					$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
					$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
					$discount_price=$product_info['price'] - $product_info['special'];
					$discount = round(($discount_price/$product_info['price']) * 100);
				} else {
					$special = false;
					$discount=false;
				}
				//-----------Discount-----------

				if ($this->config->get('config_tax')) {
					$tax = $this->currency->format((float)$product_info['special'] ? $product_info['special'] : $product_info['price']);
				} else {
					$tax = false;
				}

				if ($this->config->get('config_review_status')) {
					$rating = $product_info['rating'];
				} else {
					$rating = false;
				}
				$product_option_value_data = array();
				foreach ($this->model_catalog_product->getProductOptions ($product_info['product_id']) as $option) {
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
					'product_id'  => $product_info['product_id'],
					'quantity'  => $product_info['quantity'],
					'stockstatusid'  => $product_info['stock_status_id'],
					'button_cart'	=> (($product_info['quantity'] < $hb_oosn_product_qty) && (($product_info['stock_status_id'] == $hb_oosn_stock_status) or ($hb_oosn_stock_status == 0)))? $this->language->get('button_notify_button'):$this->language->get('button_cart'),
					'notify_enable'	=> (($product_info['quantity'] < $hb_oosn_product_qty) && (($product_info['stock_status_id'] == $hb_oosn_stock_status) or ($hb_oosn_stock_status == 0)))? true:false,
					'thumb'       => $image,
					'name'        => $product_info['name'],
					'description' => utf8_substr(strip_tags(html_entity_decode($product_info['description'], ENT_QUOTES, 'UTF-8')), 0, $this->config->get('config_product_description_length')) . '..',
					'price'       => $price,
					'special'     => $special,
					'product_option_value' => $product_option_value_data,
					'manufacturer'    => $product_info['manufacturer'],
					'tax'         => $tax,
					'rating'      => $rating,
					'stock'       => $product_info['quantity'],
					'href'        => $this->url->link('product/product', 'product_id=' . $product_info['product_id']),
					'quickhref'   => HTTP_SERVER."index.php?route=product/product/quickview&product_id=" . $product_info['product_id'],
				);
			}
		}

		if ($data['products']) {
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/featured.tpl')) {
				return $this->load->view($this->config->get('config_template') . '/template/module/featured.tpl', $data);
			} else {
				return $this->load->view('default/template/module/featured.tpl', $data);
			}
		}
	}
}