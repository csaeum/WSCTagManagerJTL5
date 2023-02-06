{if $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerMatomo->value === 'on' && $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerMatomoPage->value === 'on'}

	{if $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerMatomoPageID->value !== 'X' && $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerMatomoPageID->value !== '' && $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerMatomoPage->value === 'on'}
		{literal}
			<!-- Matomo Image Tracker -->
				<noscript>
					<p><img src="{/literal}{$WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerMatomoURL->value|replace:' ':''}{literal}/matomo.php?idsite={/literal}{$WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerMatomoPageID->value|replace:' ':''}{literal}&amp;rec=1" style="border:0;" alt="" /></p>
				</noscript>
			<!-- End Matomo Image Tracker -->
		{/literal}
	{/if}

{/if}

{if $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerGoogle->value === 'on' && $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerGoogleTM->value === 'on'}

	{if $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerGoogleTagID->value !== 'GTM-xxxxxxx' && $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerGoogleTagID->value !== '' && $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerGoogleTM->value === 'on'}
		{literal}
			<!-- Google Tag Manager (noscript) -->
				<noscript>
					<iframe src="https://www.googletagmanager.com/ns.html?id={/literal}{$WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerGoogleTagID->value|replace:' ':''}{literal}" height="0" width="0" style="display:none;visibility:hidden"></iframe>
				</noscript>
			<!-- End Google Tag Manager (noscript) -->
		{/literal}
	{/if}

{/if}
