 
<?php
use Restserver\Libraries\REST_Controller;
defined('BASEPATH') OR exit('No direct script access allowed');
require APPPATH . 'libraries/REST_Controller.php';
require APPPATH . 'libraries/Format.php';
class Mahasiswa extends REST_Controller {

	
	 public function fufu_get()
	 	{
	 		# code...


	 		$this->load->model('m_mhs','mhs');
	 		$mahasiswa = $this->mhs->getmhs();

	 		if($mahasiswa){
	 		 $this->response([
                    'status' => TRUE,
                    'data' => $mahasiswa
                ], REST_Controller::HTTP_NOT_FOUND);
	 	}	

	 }
	

}

/* End of file mahasiswa.php */
/* Location: ./application/controllers/api/mahasiswa.php */