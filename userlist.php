<?php
	require_once('runtime.php');
	require_once('lib/classes/core/userlist.class.php');
	
	$smarty->assign('message', Message::getMessage());
	
	if(empty($_GET['section'])) {
		if (UserManagement::checkPermission(4)) {
			$smarty->assign('userlist', UserList::getList());
		
			$smarty->display("header.tpl.php");
			$smarty->display("userlist.tpl.php");
			$smarty->display("footer.tpl.php");
		} else {
			$message[] = array("Nur eingeloggte Benutzer dürfen die Benutzerliste einsehen!", 2);
			Message::setMessage($message);
			header('Location: ./login.php');
		}
	} elseif($_GET['section']=="export_vcard30") {
		if (UserManagement::checkPermission(4)) {
			header("Content-Type: text/plain");
			header("Content-Disposition: attachment; filename=netmon_userlist.vcf");
			echo UserList::exportUserListAsvCard30();
		} else {
			$message[] = array("Nur eingeloggte Benutzer dürfen die Beutzerliste exportieren!", 2);
			Message::setMessage($message);
			header('Location: ./login.php');
		}
	}
?>