<?php
/**
 * @package Plugin\wsc_tm
 * @author  Nicson & WebSeoConsulting
 * License GPLv2 : https://www.gnu.org/licenses/old-licenses/gpl-2.0.html
 */

	$body_Template = $plugin->getPaths()->getFrontendPath() . 'tpl/body.tpl';

	pq('body')->prepend(Shop::Smarty()->fetch($body_Template));

?>
