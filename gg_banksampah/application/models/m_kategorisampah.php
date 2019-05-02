<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_kategorisampah extends CI_Model {

public function getAll($id)
{
	# code...
	$this->db->where('id_banksampah', $id);
	return $this->db->get('kategorisampah');
}

public function getby($data,$id)
{
	# code...
	$this->db->where('id_banksampah', $id);
	$this->db->where('id_kategorisampah', $data);
	return $this->db->get('kategorisampah');
}


public function insertkat($data)
{
	# code...
	return $this->db->insert('kategorisampah', $data);
}

public function hapuskat($data,$id)
{
	# code...
	$this->db->where('id_banksampah', $id);
	$this->db->where('id_kategorisampah', $data);
	return $this->db->delete('kategorisampah');
}

public function editkat($data,$id,$point)
{
	# code...
	$this->db->where('id_banksampah', $id);
	$this->db->where('id_kategorisampah', $point);
	$this->db->update('kategorisampah', $data);
}


}

/* End of file m_kategorisampah.php */
/* Location: ./application/models/m_kategorisampah.php */