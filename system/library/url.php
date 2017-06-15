<?php
class Url {
	private $domain;
	private $ssl;
	private $rewrite = array();

	public function __construct($domain, $ssl = '') {
		$this->domain = $domain;
		$this->ssl = $ssl;
	}

	public function addRewrite($rewrite) {
		$this->rewrite[] = $rewrite;
	}

	public function link($route, $args = '', $secure = false) {
		if (!$secure) {
			$url = $this->domain;
		} else {
			$url = $this->ssl;
		}

		$url .= 'index.php?route=' . $route;

		if ($args) {
			$url .= str_replace('&', '&amp;', '&' . ltrim($args, '&'));
		}

		foreach ($this->rewrite as $rewrite) {
			$url = $rewrite->rewrite($url);
		}

		return $url;
	}
	/*public function link($route, $args = '', $connection = 'NONSSL') {
		if ('NONSSL' == $connection) {
			$url = $this->domain;
		} else {
			$url = $this->ssl;  
		}

		if ('common/home' == $route) {
			if ($args) {
				$url .= '?' . str_replace('&', '&amp;', '&' . ltrim($args, '&')); 
			}
		} else {
				$url .= 'index.php?route=' . $route;
			if ($args) {
				$url .= str_replace('&', '&amp;', '&' . ltrim($args, '&')); 
			}
		}

		foreach ($this->rewrite as $rewrite) {
			$url = $rewrite->rewrite($url);
		}
		return $url;
	}*/
}
