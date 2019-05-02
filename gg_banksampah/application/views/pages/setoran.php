<div id="content">
  <div id="content-header">
    <div id="breadcrumb"> <a href="#" title="Go to Home" class="tip-bottom"><i class="icon-home"></i> Home</a> <a href="#" class="current">Tables</a> </div>
    <h1>Table Setoran Sampah</h1>

     <?php if($this->session->flashdata('inkatfail')){ ?>
                <div class="widget-box">
           <div class="alert alert-error">
              <button class="close" data-dismiss="alert"  >×</button>
              <strong>Gagal Menambahkan!</strong> Id Kategori Sampah Sudah Ada</div>
        </div>      <?php } ?> 

         <?php if($this->session->flashdata('inkatsuc')){ ?>
                <div class="widget-box">
           <div class="alert alert-success">
              <button class="close" data-dismiss="alert">×</button>
              <strong>Berhasil !</strong>Data Berhasil Ditambahkan </div>
        </div>      <?php } ?> 

        <?php if($this->session->flashdata('hapuskatsuc')){ ?>
                <div class="widget-box">
           <div class="alert alert-success">
              <button class="close" data-dismiss="alert">×</button>
              <strong>Berhasil !</strong>Data Berhasil Dihapus </div>
        </div>      <?php } ?> 
  </div>
  <div class="container-fluid">
    <hr>
        <div class="widget-box">
          <div class="widget-title"> 
            <span class="pull-right"><a href="<?php echo base_url()?>C_Setoran/insertsetoranform" class="btn btn-primary">Tambah</a> </span>

          </div>
          <div class="widget-content nopadding">
            <table class="table table-bordered data-table">
              <thead>
                <tr>
                  <th>Id Setoran</th>
                  <th>Id Nasabah/Nama</th>
                  <th>Jenis Setoran</th>
                  <th>Tgl Setoran Masuk</th>
                  <th>Tgl Prose Selesai</th>
                  <th>Total Berat Sampah</th>
                  <th>Total Harga Sampah</th>
                  <th>Status Setoran</th>
                  <th>Keterangan</th>
                  <th>Aksi</th>
                </tr>
              </thead>
              <tbody>
                <?php foreach($setoran as $s) { ?>
                <tr>
                  <td><?php echo $s['id_setoran']; ?></td>
                  <td><?php 
                  if ($s['id_nasabah'] == "") {
                    # code...
                    echo "Bukan Nasabah";
                  }
                  else{
                  echo $s['id_nasabah']." / ".$s['nama_nasabah']; 
                }
                  ?></td>
                  <td><?php echo $s['jenis_setoran']; ?></td>
                  <td><?php echo $s['tgl_setorin']; ?></td>
                  <td><?php echo $s['tgl_setordone']; ?></td>
                  <td><?php echo $s['total_berat']; ?></td>
                  <td><?php echo $s['total_harga']; ?></td>
                  <td><?php echo $s['status_setoran']; ?></td>
                  <td><?php echo $s['keterangan_setoran']; ?></td>
                  <td>aksi aksi aksi</td>
                </tr>
              <?php } ?>
              </tbody>

            </table>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<!--Footer-part-->
<script src="<?php echo base_url()?>assets/assettmp/js/bootstrap-colorpicker.js"></script> 
<script src="<?php echo base_url()?>assets/assettmp/js/bootstrap-datepicker.js"></script> 
<script src="<?php echo base_url()?>assets/assettmp/js/jquery.toggle.buttons.js"></script> 
<script src="<?php echo base_url()?>assets/assettmp/js/masked.js"></script> 
<script src="<?php echo base_url()?>assets/assettmp/js/matrix.form_common.js"></script>
<script src="<?php echo base_url()?>assets/assettmp/js/wysihtml5-0.3.0.js"></script> 
<script src="<?php echo base_url()?>assets/assettmp/js/jquery.peity.min.js"></script> 
<script src="<?php echo base_url()?>assets/assettmp/js/bootstrap-wysihtml5.js"></script> 
<script src="<?php echo base_url()?>assets/assettmp/js/jquery.min.js"></script> 
<script src="<?php echo base_url()?>assets/assettmp/js/jquery.ui.custom.js"></script> 
<script src="<?php echo base_url()?>assets/assettmp/js/bootstrap.min.js"></script> 
<script src="<?php echo base_url()?>assets/assettmp/js/jquery.uniform.js"></script> 
<script src="<?php echo base_url()?>assets/assettmp/js/select2.min.js"></script> 
<script src="<?php echo base_url()?>assets/assettmp/js/jquery.dataTables.min.js"></script> 
<script src="<?php echo base_url()?>assets/assettmp/js/matrix.tables.js"></script>
<script src="<?php echo base_url()?>assets/assettmp/js/matrix.interface.js"></script> 
<script src="<?php echo base_url()?>assets/assettmp/js/matrix.popover.js"></script>
<script>
  $('.textarea_editor').wysihtml5();
</script>