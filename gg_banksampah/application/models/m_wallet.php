<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_wallet extends CI_Model {

public function insert($data)
{
	# code...
	return $this->db->insert('goniwallet', $data);
}
	

}

/* End of file m_wallet.php */
/* Location: ./application/models/m_wallet.php */