{* Produkt View item - Produktdetail Seite START *}

{if $nSeitenTyp == '1'}

    {literal}
        'event': 'view_item',
        'ecommerce': {
            'items': [
                {
                    'item_id': '{/literal}{$Artikel->cArtNr}{literal}',
                    'item_name': '{/literal}{$Artikel->cName}{literal}',
                    'affiliation': '{/literal}{if isset($smarty.cookies.partner)}{$smarty.cookies.partner|escape}{else}kein_Partner{/if}{literal}',
                    'currency': '{/literal}EUR{literal}',{/literal}

{* START Discount *}
                    {if $Artikel->Preise->Sonderpreis_aktiv == 'true'}
                        {literal}'discount': {/literal}discount{literal},{/literal}
                    {/if}
{* ENDE Discount *}

                    {literal}'item_brand': '{/literal}{$Artikel->cHersteller}{literal}',{/literal}

{* START Category Schleife *}
                    {foreach $AktuelleKategorie->cKategoriePfad_arr as $cat}
                        {if !isset ($counter)}
                            {assign var='counter' value='1'}
                        {/if}
                        {if $counter === '1'}
                            {literal}'item_category': '{/literal}{$cat}{literal}',{/literal}
                            {assign var='counter' value=$counter + 1}
                        {else}
                            {literal}'item_category{/literal}{$counter}'{literal}: '{/literal}{$cat}{literal}',{/literal}
                        {assign var='counter' value=$counter + 1}
                        {/if}
                    {/foreach}
{* ENDE Category Schleife *}

                    {if $Artikel->isSimpleVariation == 'true'}
                        {literal}'item_variant': '{/literal}{$Artikel->cName}{literal}',{/literal}
                    {/if}
                    {literal}'price': {/literal}{$Artikel->Preise->fVKBrutto|replace:",":"."|replace:" &euro;":""}{literal},
                    'quantity': {/literal}{$Artikel->fPackeinheit|replace:",":"."}{literal},
                }
            ]
        }
    {/literal}
{/if}
{* Produkt View item - Produktdetail Seite ENDE *}

{* Produkt View item List - Kategorieseite START *}
{if $nSeitenTyp == '2'}

    {literal}
        'event': 'view_item_list',
        'ecommerce': {
            'items': [
            {/literal}
                {foreach $Suchergebnisse->getProducts() as $Artikel}
                    {if !isset ($counter)}
                        {assign var='counter' value='1'}
                    {/if}
            {literal}
                {
                    'item_id': '{/literal}{$Artikel->cArtNr}{literal}',
                    'item_name': '{/literal}{$Artikel->cName}{literal}',
                    'affiliation': '{/literal}affi{literal}',
                    'currency': '{/literal}EUR{literal}',{/literal}

{* START Discount *}
                    {if $Artikel->Preise->rabatt >= '0'}
                        {literal}'discount': {/literal}discount{literal},{/literal}
                    {/if}
{* ENDE Discount *}

                    {literal}
                    'index': {/literal}{$counter}{assign var='counter' value=$counter + 1}{literal},
                    'item_brand': '{/literal}{$Artikel->cHersteller}{literal}',
                    'item_category': '{/literal}item_category{literal}',
                    'item_list_name': 'Kategorie {/literal}item_list_name{literal}',
                    'item_variant': '{/literal}item_variant{literal}',
                    'price': {/literal}{$Artikel->Preise->fVKBrutto|replace:",":"."|replace:" &euro;":""}{literal},
                    'quantity': {/literal}{$Artikel->fPackeinheit|replace:",":"."}{literal},
                },
            {/literal}
                {/foreach}
            {literal}
            ]
        }
    {/literal}
{/if}
{* Produkt View item List - Kategorieseite ENDE *}

{* Purchase - Abschluss Seite START *}
{if $nSeitenTyp == '33'}
    {literal}
        'event': 'purchase',
        'ecommerce': {
            'transaction_id': '{/literal}{$Bestellung->cBestellNr}{literal}',
            'affiliation': '{/literal}noch machen{literal}',
            'value': {/literal}{$Bestellung->fWarensumme|replace:",":"."|replace:" &euro;":""}{literal},
            'tax': {/literal}{$Bestellung->fSteuern|replace:",":"."|replace:" &euro;":""}{literal},
            'shipping': {/literal}{$Bestellung->fVersandKundenwaehrung|replace:",":"."|replace:" &euro;":""}{literal},
            'currency': '{/literal}EUR{literal}',
            'coupon': '',
            'items': [
    {/literal}

        {foreach $Bestellung->Positionen as $Artikel}

            {if !isset ($counter)}
                {assign var='counter' value='1'}
            {/if}

            {literal}
                {
                'item_id': '{/literal}{$Artikel->cArtNr}{literal}',
                'item_name': '{/literal}{$Artikel->cName}{literal}',
                'affiliation': '{/literal}noch machen{literal}',
                'currency': '{/literal}EUR{literal}',{/literal}

{* START Discount *}
                {if $Artikel->Preise->Sonderpreis_aktiv == 'true'}
                    {literal}'discount': {/literal}discount{literal},{/literal}
                {/if}
{* ENDE Discount *}

            {literal}
                'index': {/literal}{$counter}{assign var='counter' value=$counter + 1}{literal},
                'price': {/literal}{$Artikel->Preise->fVKBrutto|replace:",":"."|replace:" &euro;":""}{literal},
                'quantity': {/literal}{$Artikel->fPackeinheit|replace:",":"."}{literal},
                },
            {/literal}

        {/foreach}

    {literal}
            ]
        },
        'userData': {
        'sessionId': '{/literal}{$session_id}{literal}',
        'timestamp': '{/literal}{$smarty.now}{literal}',
        'orderValue': '{/literal}{$Bestellung->fWarensumme|replace:",":"."|replace:" &euro;":""}{literal}',
        'usedCouponCode': '{/literal}Verwendeter Gutscheincode Gutscheincode{literal}',
        'consumerSalutation': '{/literal}{$Kunde->cAnredeLocalized}{literal}',
        'consumerFirstName': '{/literal}{$Kunde->cVorname}{literal}',
        'consumerLastName': '{/literal}{$Kunde->cNachname}{literal}',
        'consumerEmail': '{/literal}{$Kunde->cMail}{literal}',
        'consumerCountry': '{/literal}{$Kunde->cLand}{literal}',
        'consumerZipcode': '{/literal}{$Kunde->cPLZ}{literal}'
        }
    {/literal}

{/if}
{* Purchase - Abschluss Seite ENDE *}