<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_nasabah extends CI_Model {

public function getnasabahby($id)
{
	# code...
	return $this->db->query("SELECT banksampah.id_banksampah,banksampah.nama_banksampah,nasabah.id_nasabah,nasabah.nama_nasabah,join_akun.tanggal_join FROM join_akun JOIN banksampah using(id_banksampah) JOIN nasabah using(id_nasabah) WHERE banksampah.id_banksampah='$id'");
	

}
}

/* End of file m_nasabah.php */
/* Location: ./application/models/m_nasabah.php */

?>