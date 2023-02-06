<?php declare(strict_types=1);
/**
 * @package Plugin\WSCTagManagerJTL5
 * @author  Nicson & WebSeoConsulting
 * License GPLv2 : https://www.gnu.org/licenses/old-licenses/gpl-2.0.html
 */

namespace Plugin\WSCTagManagerJTL5;

use JTL\Events\Dispatcher;
use JTL\Plugin\Bootstrapper;
use JTL\Smarty\JTLSmarty;
use JTL\Shop;
use JTL\Consent\Item;

use JTL\Session\Frontend;

class Bootstrap extends Bootstrapper {

    public function boot(Dispatcher $dispatcher): void {

        parent::boot($dispatcher);
        $plugin = $this->getPlugin();
        $db     = $this->getDB();
        $cache  = $this->getCache();

    		$dispatcher->listen('shop.hook.' . \CONSENT_MANAGER_GET_ACTIVE_ITEMS, [$this, 'addGAConsentItem']);

        $dispatcher->listen('shop.hook.' . \HOOK_SMARTY_INC, function ($args) use ($plugin, $db, $cache) {
    			  Shop::Smarty()->assign('WSCTagManagerJTL5_SettingAssoc_arr', $this->getPlugin()->getConfig()->getAssoc());
    		});

        $dispatcher->listen('shop.hook.' . \HOOK_SMARTY_OUTPUTFILTER, function ($args) use ($plugin, $db, $cache) {
    			  require_once $plugin->getPaths()->getBasePath() . 'includes/header.php';
    		});

        $dispatcher->listen('shop.hook.' . \HOOK_SMARTY_OUTPUTFILTER, function ($args) use ($plugin, $db, $cache) {
    			  require_once $plugin->getPaths()->getBasePath() . 'includes/body.php';
    		});

        $dispatcher->listen('shop.hook.' .\HOOK_SMARTY_INC, function (array $args) {
            $smarty = $args['smarty'];
            $smarty->assign('WSCTest', 'Hello from WSC');
            $smarty->assign('WSCCart', Frontend::getCart());
        });

    }

    public function renderAdminMenuTab(string $tabName, int $menuID, JTLSmarty $smarty): string {

        $tplPath = $this->getPlugin()->getPaths()->getAdminPath() . 'templates/';

        if ($tabName === 'Allgemeine Hinweise') {
            return $smarty->assign('some_variable', 123)
                ->fetch($tplPath . 'hinweise.php');
        }

        if ($tabName === 'Cookies') {
            return $smarty->assign('some_variable', 123)
                ->fetch($tplPath . 'cookies.php');
        }

        return parent::renderAdminMenuTab($tabName, $menuID, $smarty);
    }

  	public function addGAConsentItem(array $args): void	{
    		$lastID = $args['items']->reduce(static function ($result, Item $item) {
    				$value = $item->getID();

    				return $result === null || $value > $result ? $value : $result;
    		}) ?? 0;
  	}

}
?>
