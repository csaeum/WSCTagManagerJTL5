{* Purchase - Abschluss Seite START *}
    {literal}
    'event': 'purchase',
    'ecommerce': {
        'currency': '{/literal}EUR{literal}',
        'transaction_id': '{/literal}{$Bestellung->cBestellNr}{literal}',
        'value': {/literal}{$Bestellung->fGesamtsumme|replace:",":"."}{literal},{/literal}

{* START coupon *}
        {if !isset($currentCouponName)}
            {literal}
                'coupon': '{/literal}{$smarty.session.Kupon.cCode}{literal}',
                'coupon1': '{/literal}{$_REQUEST['Kuponcode']}{literal}',
            {/literal}
        {/if}
{* ENDE coupon *}

    {literal}
        'shipping': {/literal}{$Bestellung->fVersand|replace:",":"."}{literal},
        'tax': {/literal}{$Bestellung->fSteuern|replace:",":"."}{literal},
        'items': [
    {/literal}

    {foreach $Bestellung->Positionen as $Artikel}

        {if !isset($counter)}{assign var='counter' value='1'}{/if}

        {literal}
            {
            'item_id': '{/literal}{$Artikel->cArtNr}{literal}',
            'item_name': '{/literal}{$Artikel->cName}{literal}',{/literal}

{* START affiliation *}
            {if isset($affiliation)}
                {literal}'affiliation': '{/literal}noch machen{literal}',{/literal}
            {/if}
{* ENDE affiliation *}

{* START coupon *}
            {if isset($currentCouponName)}
                {literal}
                    'coupon': '{/literal}{$_SESSION->Kupon->cCode}{literal}',
                    'coupon1': '{/literal}{$_REQUEST['Kuponcode']}{literal}',
                {/literal}
            {/if}
{* ENDE coupon *}

{* START discount *}
            {if $Artikel->Preise->Sonderpreis_aktiv == 'true'}
                {literal}'discount': {/literal}discount{literal},{/literal}
            {/if}
{* ENDE discount *}

        {literal}

            'index': {/literal}{$counter}{assign var='counter' value=$counter + 1}{literal},{/literal}

{* START item_brand *}
            {if isset($Artikel->Artikel->cHersteller)}
                {literal}'item_brand': '{/literal}{$Artikel->Artikel->cHersteller}{literal}',{/literal}
            {/if}
{* ENDE item_brand *}


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

{* START item_variant *}
            {if $Artikel->Artikel->isSimpleVariation == 'true'}
                {literal}'item_variant': '{/literal}einfacher Artikel{literal}',{/literal}
            {/if}
{* ENDE item_variant *}

        {assign var='GesamtpreismitEuro' value=$Artikel->cGesamtpreisLocalized[0] }
        {assign var='Gesamtpreis' value=$GesamtpreismitEuro|replace:" EUR":"" }

        {literal}
            'price': {/literal}{$Gesamtpreis|replace:",":"."}{literal},
            'quantity': {/literal}{$Artikel->nAnzahl|replace:",":"."}{literal},
            },
        {/literal}

    {/foreach}

        {literal}
        ],
            },
            'userData': {
                'sessionId': '{/literal}{$Bestellung->cSession}{literal}',
                'timestamp': '{/literal}{$smarty.now}{literal}',
                'orderValue': '{/literal}{$Bestellung->fGesamtsumme|replace:",":"."}{literal}',
                'usedCouponCode': '{/literal}Verwendeter Gutscheincode Gutscheincode{literal}',
                'consumerSalutation': '{/literal}{$Bestellung->oKunde->cAnredeLocalized}{literal}',
                'consumerFirstName': '{/literal}{$Bestellung->oKunde->cVorname}{literal}',
                'consumerLastName': '{/literal}{$Bestellung->oKunde->cNachname}{literal}',
                'consumerEmail': '{/literal}{$Bestellung->oKunde->cMail}{literal}',
                'consumerCountry': '{/literal}{$Bestellung->oKunde->cLand}{literal}',
                'consumerZipcode': '{/literal}{$Bestellung->oKunde->cPLZ}{literal}'
            }
        {/literal}
{* Purchase - Abschluss Seite ENDE *}