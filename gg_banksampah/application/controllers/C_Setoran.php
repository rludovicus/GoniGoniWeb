<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_Setoran extends CI_Controller {

public function __construct()
{
	parent::__construct();
	$this->load->model('m_setoran','s');
	$this->load->model('m_nasabah','n');
	$this->load->model('m_kategorisampah','k');
}
	public function index()
	{
	if($this->session->userdata('username')){
	$data['setoran'] = $this->s->getalljoin($this->session->userdata('id_banksampah'))->result_array();
	//print_r($data);die();
	$this->load->view('main/header');
	$this->load->view('pages/setoran',$data);
	//$this->load->view('main/footer');	
		}
	else{
		redirect(base_url().'C_User','refresh');
	}
	}

	public function insertsetoranform()
	{
	if($this->session->userdata('username')){

	$data['nasabah'] = $this->n->getnasabahby($this->session->userdata('id_banksampah'))->result_array();
	$data['kat'] = $this->k->getAll($this->session->userdata('id_banksampah'))->result_array();

	$this->load->view('main/header');
	$this->load->view('pages/insertsetoran',$data);
	//$this->load->view('pages/super',$data);
	//$this->load->view('main/footer');		
	}
	else{
		redirect(base_url().'C_User','refresh');
	}

	}

	public function insertsetoran()
	{
	if($this->session->userdata('username')){
	$id_kategorisampah = $this->input->post('id_kategorisampah');
	$id_nasabah = $this->input->post('id_nasabah');
	$tgl_setorin = $this->input->post('tgl_setorin');
	$berat_setoran = $this->input->post('berat_setoran');
	$jenis_setoran = $this->input->post('jenis_setoran');
	$status_setoran = $this->input->post('status_setoran');
	$keterangan_setoran = $this->input->post('keterangan_setoran');
	$total_harga=0;
	$total_berat=0;
	if ($jenis_setoran == 'hibah') {
		# code...
		$status_setoran = 'selesai';
	}
	do {
		# code...
		$id_setoran ='S-';
		for ($i=1; $i <=5 ; $i++) { 
			# code...
			$nomor = rand(0,9);
			$id_setoran= $id_setoran.$nomor;
		}
		$ququ = $this->s->getby($id_setoran);
		//echo $ququ->num_rows();

	} while ($ququ->num_rows() > 0);
	//echo $id_setoran;
	if ($id_nasabah == "") {
		# code...
		$id_nasabah=null;
	}


	for ($i=0; $i <count($id_kategorisampah); $i++) { 
		# code...

		$data = $this->k->getby($id_kategorisampah[$i],$this->session->userdata('id_banksampah'))->row_array();
		if($jenis_setoran != 'hibah'){

		$harga[$i] = $data['harga'];
		$sub_harga[$i] = $berat_setoran[$i]*$harga[$i];
		}
		else {
		$harga[$i] = 0;
		$sub_harga[$i] = 0;
		}

	}
	for ($i=0; $i <count($sub_harga); $i++) { 
		# code...
		$total_harga += $sub_harga[$i];
		$total_berat += $berat_setoran[$i];

	}

	$data = array(
		'id_setoran' => $id_setoran,
		'jenis_setoran'=>$jenis_setoran,
		'total_berat'=>$total_berat,
		'total_harga'=>$total_harga,
		'id_banksampah' =>$this->session->userdata('id_banksampah'),
		'id_nasabah'=>$id_nasabah,
		'tgl_setorin'=>$tgl_setorin,
		'status_setoran'=>$status_setoran,
		'keterangan_setoran'=>$keterangan_setoran
	 );
	$query=$this->s->insertsetoran($data);
	for ($i=0; $i <count($id_kategorisampah); $i++) { 
		# code...
		$datas = array(
			'id_setoran' => $id_setoran ,
			'id_kategorisampah'=>$id_kategorisampah[$i],
			'berat/kg'=>$berat_setoran[$i],
			'sub_harga'=>$sub_harga[$i] );
		$this->s->insertdetail($datas);
	}
		$this->session->set_flashdata('inkatsuc', 'value');
		redirect(base_url().'C_Setoran','refresh');
	//echo($ququ);
	// print_r($harga);
	// echo"<br>";
	// print_r($id_kategorisampah);
	// echo"<br>";
	// print_r($berat_setoran);
	// echo"<br>";
	// print_r($sub_harga);
	// echo"<br>";
	// print_r($total);


	

	//echo($status_setoran);die();


	}
	else{
		redirect(base_url().'C_User','refresh');
	}

	}

}

/* End of file C_Setoran.php */
/* Location: ./application/controllers/C_Setoran.php */