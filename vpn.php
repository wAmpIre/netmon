<?php

  require_once('./config/runtime.inc.php');
  require_once('./lib/classes/core/vpn.class.php');
  require_once('./lib/classes/core/helper.class.php');
  
  $Vpn = new Vpn;

    if ($_GET['section'] == "new") {
      $ip = Helper::getIpDataByIpId($_GET['ip_id']);
      UserManagement::isOwner($smarty, $ip['user_id']);
      $smarty->assign('message', Message::getMessage());
      $smarty->assign('net_prefix', $GLOBALS['net_prefix']);
      $smarty->assign('data', Helper::getIpDataByIpId($_GET['ip_id']));
      $smarty->assign('expiration', $GLOBALS['expiration']);

		$smarty->display("header.tpl.php");
		$smarty->display("sslcertificate_new.tpl.php");
		$smarty->display("footer.tpl.php");
    }

	if ($_GET['section'] == "generate") {
		$ip = Helper::getIpDataByIpId($_GET['ip_id']);
		UserManagement::isOwner($smarty, $ip['user_id']);
		$keys = Vpn::generateKeys($_GET['ip_id'], $_POST['organizationalunitname'], $_POST['commonname'], $_POST['emailaddress'], $_POST['privkeypass'], $_POST['privkeypass_chk'], $_POST['numberofdays']);
		if ($keys['return']) {
			Vpn::saveKeysToDB($_GET['ip_id'], $keys['vpn_client_cert'], $keys['vpn_client_key']);
			Vpn::writeCCD($_GET['ip_id']);
//			Vpn::downloadKeyBundle($_GET['ip_id']);
			header('Location: ./vpn.php?section=download&ip_id='.$_GET['ip_id']);
		} else {
			header('Location: ./vpn.php?section=new&ip_id='.$_GET['ip_id']);
		}
	}

	if ($_GET['section'] == "download") {
		$ip = Helper::getIpDataByIpId($_GET['ip_id']);
		if (!empty($ip['vpn_server_ca']) AND !empty($ip['vpn_client_cert']) AND !empty($ip['vpn_client_key'])) {
			UserManagement::isOwner($smarty, $ip['user_id']);
			$Vpn->downloadKeyBundle($_GET['ip_id']);
			$smarty->assign('message', Message::getMessage());
		} else {
			$message[] = array("Es sind nicht genügen Informationen vorhanden, um die Keys zum Download bereit zu stellen.", 2);
			$message[] = array("Warscheinlich müssen haben sie die Keys noch nicht erstellt.", 2);
			Message::setMessage($message);
			header('Location: ./ip.php?id='.$_GET['ip_id']);
		}
	}

/*    if ($_GET['section'] == "edit") {
		$ip_data = Helper::getIpDataByIpId($_GET['ip_id']);
		UserManagement::isOwner($smarty, $ip_data['user_id']);

		$smarty->assign('net_prefix', $GLOBALS['net_prefix']);
		$ip_data = Helper::getIpDataByIpId($_GET['ip_id']);
		$smarty->assign('ip_data', $ip_data);
		$smarty->assign('ccd', Vpn::getCCD($_GET['ip_id']));

     	$smarty->display("header.tpl.php");
		$smarty->display("vpn_edit.tpl.php");
		$smarty->display("footer.tpl.php");
    }*/

    if ($_GET['section'] == "info") {
      $ip = Helper::getIpDataByIpId($_GET['ip_id']);
      UserManagement::isOwner($smarty, $ip['user_id']);
    	if (!empty($ip['vpn_server_ca']) AND !empty($ip['vpn_client_cert']) AND !empty($ip['vpn_client_key'])) {
		$smarty->assign('net_prefix', $GLOBALS['net_prefix']);
		$smarty->assign('vpn_config', $Vpn->getVpnConfig($_GET['ip_id']));
		$smarty->assign('certificate_data', $Vpn->getCertificateInfo($_GET['ip_id']));
		$smarty->assign('ccd', $Vpn->getCCD($_GET['ip_id']));
		$smarty->display("header.tpl.php");
		$smarty->display("sslcertificate_info.tpl.php");
		$smarty->display("footer.tpl.php");
	    } else {
	        $message[] = array("Es sind nicht genügen Informationen vorhanden um die Keys bereit zu stellen.", 2);
    	  	$message[] = array("Warscheinlich müssen haben sie die Keys noch nicht erstellt.", 2);
      		Message::setMessage($message);
		header('Location: ./ip.php?id='.$_GET['ip_id']);
    	}
    }

    if ($_GET['section'] == "regenerate_ccd_subnet") {
	//Only owner and Root can access this site.
	if (!UserManagement::checkPermission(32, $_SESSION['user_id']))
		UserManagement::denyAccess();
	  $smarty->assign('net_prefix', $GLOBALS['net_prefix']);
      $smarty->assign('subnets', Helper::getSubnetsByUserId($_SESSION['user_id']));
      $smarty->display("header.tpl.php");
      $smarty->display("regenerate_ccd_subnet.tpl.php");
      $smarty->display("footer.tpl.php");
    }
    if ($_GET['section'] == "insert_regenerate_ccd_subnet") {
		$subnet = Helper::getSubnetById($_POST['subnet_id']);

	//Only owner and Root can access this site.
	if (!UserManagement::checkIfUserIsOwnerOrPermitted(64, $subnet['user_id']))
		UserManagement::denyAccess();

      Vpn::regenerateCCD($_POST['subnet_id']);
      header('Location: subnet.php?id='.$_POST['subnet_id']);
    }

    if ($_GET['section'] == "insert_regenerate_ccd") {
		$Vpn->writeCCD($_GET['ip_id']);

		header('Location: ip.php?id='.$_GET['ip_id']);
	}

    if ($_GET['section'] == "insert_delete_ccd") {
      $Vpn->deleteCCD($_GET['ip_id']);
      header('Location: ip.php?id='.$_GET['ip_id']);
    }
?>