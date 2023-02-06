<?php
/**
 * Created by nicson.de
 *
 * Project: nicson_google_manager
 *
 * License GPLv2 : https://www.gnu.org/licenses/old-licenses/gpl-2.0.html
 *
 *
 */
namespace Plugin\WSCTagManagerJTL5\licence;

use JTL\Plugin\LicenseInterface;

class WSCTagManagerJTL5_Licence implements LicenseInterface{
    public function checkLicence($cLicence){
        return true;
	}
}
?>
