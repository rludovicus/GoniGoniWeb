<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_User extends CI_Controller {

public function __construct()
{
	parent::__construct();
	$this->load->model('M_profile','p');
	$this->load->model('m_wallet','w');
}
	public function index()
	{
		if (isset($_COOKIE['username']) && isset($_COOKIE['password'])) {
			# code...
			$hasil= $this->p->getbyjoin($_COOKIE['username'],$_COOKIE['password']);
			if($hasil->num_rows() > 0){
			$datax = $hasil->result_array();
			//print_r($datax); die();
			$array = array(
				'id_banksampah' => $datax[0]['id_banksampah'],
				'username'=>$datax[0]['username'],	
				'id_induk'=> $datax[0]['id_induk'],
				'nomor_wallet' => $datax[0]['nomor_wallet'],
				'nama_banksampah'=> $datax[0]['nama_banksampah'],
				'nohp_banksampah'=> $datax[0]['nohp_banksampah'],
				'email_banksampah'=> $datax[0]['email_banksampah'],
				'alamat_banksampah'=> $datax[0]['alamat_banksampah'],
				'status'=> $datax[0]['status'],
				'saldo'=> $datax[0]['saldo']

			);
			$this->session->set_userdata($array);
			//echo "string";
			redirect(base_url().'C_Dashboard','refresh');

		}
		}
		else{
		$this->load->view('pages/login');
	}
	}

	public function insertdata()
	{
		# code...
		$hasil='';
		for($i=1; $i<5; $i++ ){
			$no = rand(0,5);
			$hasil = $hasil.$no;

		}
		$nowallet = $hasil.substr(
			$this->input->post('nohp'), 6);
		$data = array(
			'nomor_wallet'=> $nowallet,
			'saldo'=>'0',
			'limit_wallet'=>'10000000'
		);
		$res = $this->w->insert($data);
		if($res){
			if ($this->input->post('idinduk')== '') {
				# code...
				$induk = null;
			}
			else{
				$induk = $this->input->post('idinduk');
			}
		$data = array(
			'nama_banksampah'=>$this->input->post('namabs'),
			'nomor_wallet'=>$nowallet,
			'username'=>$this->input->post('username'),
			'password'=>do_hash($this->input->post('password'),'md5'),
			'alamat_banksampah'=>$this->input->post('alamat'),
			'id_induk'=> $induk,
			'nohp_banksampah'=>$this->input->post('nohp'),
			'email_banksampah'=>$this->input->post('email'),
			'status'=>'baru',
			'longitude'=>'0',
			'latitude'=>'0'
		);
		$this->p->insertprofile($data);
		$this->session->set_flashdata('insertp', 'Selamat anda sudah terdaftar');
		redirect(base_url().'C_User','refresh');
	}

	}

	public function ceklogin()
	{
		# code...
		$username = $this->input->post('username');
		$password = do_hash($this->input->post('password'),'md5');
		$remember = $this->input->post('remember');
		$hasil=$this->p->getbyjoin($username,$password);
		if($hasil->num_rows() > 0){
			$datax = $hasil->result_array();
			//print_r($datax); die();
			if($remember == 'yes'){
				setcookie('username',$username,time() + (86400*30), "/");
				setcookie('password',$password,time() + (86400*30), "/");
			}
			$array = array(
				'id_banksampah' => $datax[0]['id_banksampah'],
				'username'=>$datax[0]['username'],	
				'id_induk'=> $datax[0]['id_induk'],
				'nomor_wallet' => $datax[0]['nomor_wallet'],
				'nama_banksampah'=> $datax[0]['nama_banksampah'],
				'nohp_banksampah'=> $datax[0]['nohp_banksampah'],
				'email_banksampah'=> $datax[0]['email_banksampah'],
				'alamat_banksampah'=> $datax[0]['alamat_banksampah'],
				'status'=> $datax[0]['status'],
				'saldo'=> $datax[0]['saldo']

			);
			$this->session->set_userdata($array);
			//echo "string";
			redirect(base_url().'C_Dashboard','refresh');

		}
		else{
			$this->session->set_flashdata('logail', 'value');
			redirect(base_url().'C_User','refresh');
		}
	}


	public function regisform()
	{
		# code...
		$this->load->view('pages/registration');
	}

	public function logout()
	{
		# code...
		$this->session->sess_destroy();
		setcookie('username',"",0,"/");
		setcookie('password',"",0,"/");
		redirect(base_url().'C_User','refresh');
	}
	
}

/* End of file C_User.php */
/* Location: ./application/controllers/C_User.php */
?>