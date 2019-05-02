<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_setoran extends CI_Model {

public function insertsetoran($data)
{
	# code...
	$this->db->insert('setoran', $data);
}

public function getalljoin($id)
{
	# code...
	$this->db->where('id_banksampah', $id);
	$this->db->join('setoran_detail', 'setoran_detail.id_setoran = setoran.id_setoran');
	$this->db->join('nasabah', 'nasabah.id_nasabah = setoran.id_nasabah','left');
	$this->db->group_by('setoran.id_setoran');
	return $this->db->get('setoran');
}

public function getby($id)
{
	# code...
	$this->db->where('id_setoran', $id);
	return $this->db->get('setoran');
}
public function insertdetail($data)
{
	# code...
	$this->db->insert('setoran_detail', $data);
}
	

}

/* End of file m_setoran.php */
/* Location: ./application/models/m_setoran.php */
?>