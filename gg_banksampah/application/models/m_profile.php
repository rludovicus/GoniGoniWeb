<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_profile extends CI_Model {

	public function insertprofile($data)
	{
		# code...
		$this->db->insert('banksampah', $data);
	}

	public function getby1($param,$val)
	{
		# code...
		$this->db->where('$param', $val);
		return $this->db->get('banksampah');
	}
	public function getbyjoin($username,$password)
	{
		# code...
	$this->db->where('username',$username);
	$this->db->where('password',$password);
	$this->db->join('goniwallet', 'goniwallet.nomor_wallet = banksampah.nomor_wallet');
	return $query = $this->db->get('banksampah');
 

	}
}

/* End of file m_profile.php */
/* Location: ./application/models/m_profile.php */