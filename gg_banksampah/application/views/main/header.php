<!DOCTYPE html>
<html lang="en">
<head>
<title>Gonigoni Bank Sampah</title>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="<?php echo base_url()?>assets/assettmp/css/bootstrap.min.css" />
<link rel="stylesheet" href="<?php echo base_url()?>assets/assettmp/css/bootstrap-responsive.min.css" />
<link rel="stylesheet" href="<?php echo base_url()?>assets/assettmp/css/fullcalendar.css" />
<link rel="stylesheet" href="<?php echo base_url()?>assets/assettmp/css/colorpicker.css" />
<link rel="stylesheet" href="<?php echo base_url()?>assets/assettmp/css/datepicker.css" />
<link rel="stylesheet" href="<?php echo base_url()?>assets/assettmp/css/uniform.css" />
<link rel="stylesheet" href="<?php echo base_url()?>assets/assettmp/css/select2.css" />
<link rel="stylesheet" href="<?php echo base_url()?>assets/assettmp/css/matrix-style.css" />
<link rel="stylesheet" href="<?php echo base_url()?>assets/assettmp/css/matrix-media.css" />
<link rel="stylesheet" href="<?php echo base_url()?>assets/assettmp/css/bootstrap-wysihtml5.css" />
<link href="<?php echo base_url()?>assets/assettmp/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="<?php echo base_url()?>assets/assettmp/stylesheet" href="css/jquery.gritter.css" />
<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
</head>
<body>

<!--Header-part-->
<div id="header">
  <h1><a href="dashboard.html">Gonigoni Bank Sampah</a></h1>
</div>
<!--close-Header-part--> 


<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse">
  <ul class="nav">
    <li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text">Welcome User</span><b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a href="#"><i class="icon-user"></i> My Profile</a></li>
        <li class="divider"></li>
        <li><a href="#"><i class="icon-check"></i> My Tasks</a></li>
        <li class="divider"></li>
        <li><a href="login.html"><i class="icon-key"></i> Log Out</a></li>
      </ul>
    </li>
    <li class="dropdown" id="menu-messages"><a href="#" data-toggle="dropdown" data-target="#menu-messages" class="dropdown-toggle"><i class="icon icon-envelope"></i> <span class="text">Messages</span> <span class="label label-important">5</span> <b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a class="sAdd" title="" href="#"><i class="icon-plus"></i> new message</a></li>
        <li class="divider"></li>
        <li><a class="sInbox" title="" href="#"><i class="icon-envelope"></i> inbox</a></li>
        <li class="divider"></li>
        <li><a class="sOutbox" title="" href="#"><i class="icon-arrow-up"></i> outbox</a></li>
        <li class="divider"></li>
        <li><a class="sTrash" title="" href="#"><i class="icon-trash"></i> trash</a></li>
      </ul>
    </li>
    <li class=""><a title="" href="#"><i class="icon icon-cog"></i> <span class="text">Settings</span></a></li>
    <li class=""><a title="" href="<?php echo base_url()?>C_user/logout"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
  </ul>
</div>
<!--close-top-Header-menu-->
<!--start-top-serch-->
<div id="search">
  <input type="text" placeholder="Search here..."/>
  <button type="submit" class="tip-bottom" title="Search"><i class="icon-search icon-white"></i></button>
</div>
<!--close-top-serch-->
<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
  <ul>
    <?php $uriSegments = explode("/", parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH));
    //echo $uriSegments[2];
     ?>
    <li class="<?php if($uriSegments[2]=='C_Dashboard') echo'active'?>"><a href="<?php echo base_url(); ?>C_Dashboard"><i class="icon icon-home"></i> <span>Dashboard</span></a> </li>
    <li class="<?php if($uriSegments[2]=='C_Katsampah') echo'active'?>"> <a href="<?php echo base_url(); ?>C_Katsampah"><i class="icon icon-tag"></i> <span>Kelola Kategori Sampah</span></a> </li>
    <li class="submenu <?php if($uriSegments[2]=='C_Setoran' || $uriSegments[2]=='C_Sampahkeluar') echo'active'?>"> <a href="#"><i class="icon icon-leaf"></i> <span>Transaksi Sampah</span> <span class="label label-important"></span></a>
      <ul>
        <li class="<?php if($uriSegments[2]=='C_Setoran') echo'active'?>"><a href="<?php echo base_url();?>C_Setoran">Setoran</a></li>
        <li><a href="form-validation.html">Sampah Keluar</a></li>
      </ul>
    </li>
    <li> <a href="widgets.html"><i class="icon icon-inbox"></i> <span>Widgets</span></a> </li>
    <li><a href="tables.html"><i class="icon icon-th"></i> <span>Tables</span></a></li>
    <li><a href="grid.html"><i class="icon icon-fullscreen"></i> <span>Full width</span></a></li>
    <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i> <span>Forms</span> <span class="label label-important">3</span></a>
      <ul>
        <li><a href="form-common.html">Basic Form</a></li>
        <li><a href="form-validation.html">Form with Validation</a></li>
        <li><a href="form-wizard.html">Form with Wizard</a></li>
      </ul>
    </li>
    <li><a href="buttons.html"><i class="icon icon-tint"></i> <span>Buttons &amp; icons</span></a></li>
    <li><a href="interface.html"><i class="icon icon-pencil"></i> <span>Eelements</span></a></li>
    <li class="submenu"> <a href="#"><i class="icon icon-file"></i> <span>Addons</span> <span class="label label-important">5</span></a>
      <ul>
        <li><a href="index2.html">Dashboard2</a></li>
        <li><a href="gallery.html">Gallery</a></li>
        <li><a href="calendar.html">Calendar</a></li>
        <li><a href="invoice.html">Invoice</a></li>
        <li><a href="chat.html">Chat option</a></li>
      </ul>
    </li>
    <li class="submenu"> <a href="#"><i class="icon icon-info-sign"></i> <span>Error</span> <span class="label label-important">4</span></a>
      <ul>
        <li><a href="error403.html">Error 403</a></li>
        <li><a href="error404.html">Error 404</a></li>
        <li><a href="error405.html">Error 405</a></li>
        <li><a href="error500.html">Error 500</a></li>
      </ul>
    </li>
</div>
<!--sidebar-menu-->



