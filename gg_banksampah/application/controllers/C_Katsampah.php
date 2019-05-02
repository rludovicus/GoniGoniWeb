<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_Katsampah extends CI_Controller {

public function __construct()
{
	parent::__construct();
	$this->load->model('M_kategorisampah','kat');
}
	public function index()
	{
		if($this->session->userdata('username')){
			$data['kat'] = $this->kat->getAll($this->session->userdata('id_banksampah'))->result_array();
			$this->load->view('main/header');
			$this->load->view('pages/kelolakatsampah',$data);
			$this->load->view('main/footer');
		}
		else{
			redirect(base_url().'C_User','refresh');
		}
	}

	public function tambahkategori()
	{
		# code...
		if($this->session->userdata('username')){

		if($this->kat->getby($this->input->post('id_kategorisampah'),$this->session->userdata('id_banksampah'))->num_rows() > 0) {
			
			$this->session->set_flashdata('inkatfail', 'value');
			redirect(base_url().'C_Katsampah','refresh');
		}
		else {
		$data = array(
		'id_kategorisampah'=>$this->input->post('id_kategorisampah'),
		'id_banksampah'=>$this->session->userdata('id_banksampah'),
		'golongan'=>$this->input->post('golongan'),
		'jenis'=>$this->input->post('jenis'),
		'harga'=>$this->input->post('harga'),
		'deskripsi_kat'=>$this->input->post('deskripsi_kat')
		);

		$this->kat->insertkat($data);
		$this->session->set_flashdata('inkatsuc', 'value');
		redirect(base_url().'C_Katsampah','refresh');
	}
}
			else{
			redirect(base_url().'C_User','refresh');
		}
	}

		public function hapuskat($id)
		{
			# code...
		if($this->session->userdata('username')){
			$hapus = $this->kat->hapuskat($id,$this->session->userdata('id_banksampah'));
			if($hapus){
				$this->session->set_flashdata('hapuskatsuc', 'value');
				redirect(base_url().'C_Katsampah','refresh');
			}

		}
		else{
			redirect(base_url().'C_User','refresh');
		}

		}

		public function editkatform($id)
		{
			# code...
		if($this->session->userdata('username')){
			$data['kat'] = $this->kat->getby($id,$this->session->userdata('id_banksampah'))->row_array();
			$this->load->view('main/header');
			$this->load->view('pages/editkat',$data);
			$this->load->view('main/footer');
			
		}
		else{
			redirect(base_url().'C_User','refresh');
		}

		}

			public function editkategori($point)
	{
		# code...
		if($this->session->userdata('username')){

		if($this->kat->cekid($this->input->post('id_kategorisampah'),$this->session->userdata('id_banksampah'))->num_rows() > 0 && $this->input->post('id_kategorisampah') != $point ) {
			
			$this->session->set_flashdata('inkatfail', 'value');
			redirect(base_url().'C_Katsampah','refresh');
		}
		else {
		$data = array(
		'id_kategorisampah'=>$this->input->post('id_kategorisampah'),
		'golongan'=>$this->input->post('golongan'),
		'jenis'=>$this->input->post('jenis'),
		'harga'=>$this->input->post('harga'),
		'deskripsi_kat'=>$this->input->post('deskripsi_kat')
		);

		$this->kat->editkat($data,$this->session->userdata('id_banksampah'),$point);
		$this->session->set_flashdata('inkatsuc', 'value');
		redirect(base_url().'C_Katsampah','refresh');
	}
}
			else{
			redirect(base_url().'C_User','refresh');
		}
	}
}

/* End of file C_Katsampah.php */
/* Location: ./application/controllers/C_Katsampah.php */