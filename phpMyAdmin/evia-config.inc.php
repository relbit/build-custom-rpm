<?php
/* vim: set expandtab sw=4 ts=4 sts=4: */
/**
 * phpMyAdmin sample configuration, you can use it as base for
 * manual configuration. For easier setup you can use setup/
 *
 * All directives are explained in Documentation.html and on phpMyAdmin
 * wiki <http://wiki.phpmyadmin.net>.
 *
 * @package PhpMyAdmin
 */

/*
 * This is needed for cookie based authentication to encrypt password in
 * cookie
 */
$cfg['blowfish_secret'] = 'a8b7c6d'; /* YOU MUST FILL IN THIS FOR COOKIE AUTH! */

/*
 * Servers configuration
 */
$i = 0;

/*
 * First server
 */
$i++;
/* Authentication type */
$cfg['Servers'][$i]['extension']     = 'mysqli';
$cfg['Servers'][$i]['auth_type']     = 'signon';
$cfg['Servers'][$i]['SignonSession'] = 'SignonSession';
$cfg['Servers'][$i]['SignonURL']     = '../signon.php';
$cfg['Servers'][$i]['hide_db']       = 'information_schema'; 

/*
 * relbit custom settings
 */
$cfg['ShowStats']             = FALSE;
$cfg['ShowPhpInfo']           = FALSE;  // show php info link 
$cfg['ShowServerInfo']        = FALSE;
$cfg['ThemeDefault']          = 'original';
$cfg['PmaNoRelation_DisableWarning'] = true;
$cfg['ShowCreateDb']          = FALSE;
$cfg['HideServerLinksTabs']   = array('status', 'settings', 'vars');
$cfg['VersionCheck']          = FALSE;
/*
 * Directories for saving/loading files from server
 */
$cfg['UploadDir'] = '';
$cfg['SaveDir'] = '';

/*
 * You can find more configuration options in Documentation.html
 * or here: http://wiki.phpmyadmin.net/pma/Config
 */
?>
