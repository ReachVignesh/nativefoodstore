<?php
class ControllerToolXLSImport extends Controller {
  private $error = array();
  public function index() {
    $this->load->language('tool/xls_import');
    $this->load->model('tool/xls_import');
    $this->document->setTitle($this->language->get('heading_title'));
    $data['heading_title'] = $this->language->get('heading_title');
    $data['button_import'] = $this->language->get('button_import');
    $data['entry_description'] = $this->language->get('entry_description');

    $data['breadcrumbs'] = array();
    $data['breadcrumbs'][] = array(
      'text' => $this->language->get('text_home'),
      'href' => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      'separator' => FALSE
    );
    $data['breadcrumbs'][] = array(
      'text' => $this->language->get('heading_title'),
      'href' => $this->url->link('tool/xls_import',
      'token=' . $this->session->data['token'], 'SSL'),
      'separator' => ' :: '
    );

// link for form action
    $data['action'] = $this->url->link('tool/xls_import', 'token=' . $this->session->data['token'], 'SSL');


// LOGIC
    if (($this->request->server['REQUEST_METHOD'] == 'POST') && ($this->validate())) {
      if ((isset ($this->request->files['uploadZIP']))) {
        $file = $this->request->files['uploadZIP']['tmp_name'];
        if ($this->model_tool_xls_import->upload($file)) {
          $this->session->data['success'] = $this->language->get('text_success');
          $this->response->redirect($this->url->link('tool/xls_import', 'token=' . $this->session->data['token'], 'SSL'));
        }
        else {
          $this->error['warning'] = $this->language->get('error_upload');
        }
      }
    }

    $data['error_select_file'] = $this->language->get('error_select_file');
    $data['error_post_max_size'] = str_replace('%1', ini_get('post_max_size'), $this->language->get('error_post_max_size'));
    $data['error_upload_max_filesize'] = str_replace('%1', ini_get('upload_max_filesize'), $this->language->get('error_upload_max_filesize'));

    if (isset ($this->error['warning'])) {
      $data['error_warning'] = $this->error['warning'];
    }
    else {
      $data['error_warning'] = '';
    }
    if (isset ($this->session->data['success'])) {
      $data['success'] = $this->session->data['success'];
      unset ($this->session->data['success']);
    }
    else {
      $data['success'] = '';
    }

//----------------Standard controller part--------------------------------------

$data['header'] = $this->load->controller('common/header');
		$data['column_left'] = $this->load->controller('common/column_left');
		$data['footer'] = $this->load->controller('common/footer');

		$this->response->setOutput($this->load->view('tool/xls_import.tpl', $data));
		
		
   
  }
  private function validate() {
    if (!$this->user->hasPermission('modify', 'tool/xls_import')) {
      $this->error['warning'] = $this->language->get('error_permission');
    }
    if (!$this->error) {
      return TRUE;
    }
    else {
      return FALSE;
    }
  }
}
?>