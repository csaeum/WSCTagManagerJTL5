{* START WSC DataLayer *}
  {if $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerDataLayer->value == 'on'}

    {if $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerDataLayerMatomo->value == 'on'}

      {* ANFANG des Kopfes *}
      {literal}
        <script>
          window._mtm = window._mtm || [];
          window._mtm.push({ ecommerce: null });
          window._mtm.push({
      {/literal}
      {* ENDE des Kopfes *}

            {include file="./DataLayer.tpl"}

      {* ANFANG des Fußes *}
      {literal}
          });
        </script>
      {/literal}
      {* ENDE des Fußes *}

    {/if}

    {if $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerDataLayerGoogle->value == 'on'}

      {* ANFANG des Kopfes *}
      {literal}
        <script>
          window.dataLayer = window.dataLayer || [];
          window.dataLayer.push({ ecommerce: null });
          window.dataLayer.push({
            {/literal}
            {* ENDE des Kopfes *}

            {include file="./DataLayer.tpl"}

            {* ANFANG des Fußes *}
            {literal}
          });
        </script>
      {/literal}
      {* ENDE des Fußes *}

    {/if}

{/if}

{* ENDE WSC DataLayer *}

{* Start WSC Matomo *}

  {if $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerMatomo->value == 'on'}

    {if $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerMatomoTMID->value != 'XxxXXxxX' && $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerMatomoTMID->value != '' && $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerMatomoTM->value == 'on'}
      <!-- Start Matomo Tag Manager -->
          {literal}<script>
              var _mtm = window._mtm = window._mtm || [];
              _mtm.push({'mtm.startTime': (new Date().getTime()), 'event': 'mtm.Start'});
              var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
              g.async=true; g.src='{/literal}{$WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerMatomoURL->value|replace:' ':''}{literal}/js/container_{/literal}{$WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerMatomoTMID->value|replace:' ':''}{literal}.js'; s.parentNode.insertBefore(g,s);
          </script>{/literal}
      <!-- End Matomo Tag Manager -->
    {/if}

    {if $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerMatomoPageID->value != 'X' && $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerMatomoPageID->value != '' && $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerMatomoPage->value == 'on'}
      <!-- Start Matomo Page Code -->
          {literal}<script>
              var _paq = window._paq = window._paq || [];
              _paq.push(['trackPageView']);
              _paq.push(['enableLinkTracking']);{/literal}
              {* tracker methods like "setCustomDimension" should be called before "track PageView" *}
              {if $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerMatomoPageIDSubdomains->value == 'on' }
                  {literal}_paq.push(["setCookieDomain", "*.HOST"]);{/literal}
              {/if}
              {if $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerMatomoPageIDnoTracking->value == 'on' }
                  {literal}_paq.push(["setDoNotTrack", true]);{/literal}
              {/if}
              {if $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerMatomoPageIDnoCookies->value == 'on' }
                  {literal}_paq.push(["disableCookies"]);{/literal}
              {/if}
              {literal}
              (function() {
                  var u="{/literal}{$WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerMatomoURL->value|replace:' ':''}{literal}/";
                  _paq.push(['setTrackerUrl', u+'matomo.php']);
                  _paq.push(['setSiteId', '{/literal}{$WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerMatomoPageID->value|replace:' ':''}{literal}']);
                  var d=document, g=d.createElement('script'), s=d.getElementsByTagName('script')[0];
                  g.async=true; g.src=u+'matomo.js'; s.parentNode.insertBefore(g,s);
              })();
          </script>{/literal}
      <!-- End Matomo Page Code -->
    {/if}
  {/if}

{* End WSC Matomo *}

{* Start WSC Google *}

  {if $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerGoogle->value == 'on'}

    {if $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerGoogleTagID->value != 'GTM-xxxxxxx' && $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerGoogleTagID->value != '' && $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerGoogleTM->value == 'on'}
            <!-- Google Tag Manager -->
                {literal}<script>
                    (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
                    new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
                    j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
                    'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
                    })(window,document,'script','dataLayer','{/literal}{$WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerGoogleTagID->value|replace:' ':''}{literal}');
                </script>{/literal}
            <!-- End Google Tag Manager -->
    {/if}

    {if $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerGoogleA4ID->value != 'G-xxxxxxxxxx' && $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerGoogleA4ID->value != '' && $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerGoogleA4->value == 'on'}
            <!-- Global site tag (gtag.js) - Google Analytics 4 -->
                {literal}<script async src="https://www.googletagmanager.com/gtag/js?id={/literal}{$WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerGoogleA4ID->value|replace:' ':''}{literal}"></script>
                <script>
                    window.dataLayer = window.dataLayer || [];
                    function gtag(){dataLayer.push(arguments);}
                    gtag('js', new Date());
                    gtag('config', '{/literal}{$WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerGoogleA4ID->value|replace:' ':''}{literal}');
                </script>{/literal}
    {/if}

    {if $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerGoogleUAID->value != 'UA-xxxxxxxx-x' && $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerGoogleUAID->value != '' && $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerGoogleUA->value == 'on'}
            <!-- Global site tag (gtag.js) - Google Universal Analytics -->
                {literal}<script async src="https://www.googletagmanager.com/gtag/js?id={/literal}{$WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerGoogleUAID->value|replace:' ':''}{literal}"></script>
                <script>
                    window.dataLayer = window.dataLayer || [];
                    function gtag(){dataLayer.push(arguments);}
                    gtag('js', new Date());
                    gtag('config', '{/literal}{$WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerGoogleUAID->value|replace:' ':''}{literal}'{/literal}{if $WSCTagManagerJTL5_SettingAssoc_arr.wscTagManagerGoogleAnonymizeIP->value == 'on'}{literal}, { 'anonymize_ip': true }{/literal}{/if});
                {literal}</script>{/literal}
    {/if}
  {/if}

{* End WSC Google *}