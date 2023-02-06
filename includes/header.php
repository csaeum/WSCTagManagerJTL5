<?php
/**
 * @package Plugin\wsc_tm
 * @author  Nicson & WebSeoConsulting
 * License GPLv2 : https://www.gnu.org/licenses/old-licenses/gpl-2.0.html
 */

	$header_Template = $plugin->getPaths()->getFrontendPath() . 'tpl/header.tpl';

	pq('head')->prepend(Shop::Smarty()->fetch($header_Template));

?>
