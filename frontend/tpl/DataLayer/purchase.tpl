{* Purchase - Abschluss Seite START *}
{literal}
    'event': 'purchase',
    'ecommerce': {
        'transaction_id': '{/literal}{$Bestellung->cBestellNr}{literal}',
        'affiliation': '{/literal}noch machen{literal}',
        'value': {/literal}{$Bestellung->fWarensumme|replace:",":"."|replace:" &euro;":""}{literal},
        'tax': {/literal}{$Bestellung->fSteuern|replace:",":"."|replace:" &euro;":""}{literal},
        'shipping': {/literal}{$Bestellung->fVersandKundenwaehrung|replace:",":"."|replace:" &euro;":""}{literal},
        'currency': '{/literal}EUR{literal}',
        'coupon': '{/literal}{$currentCouponName.ger}{literal}',
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
{* Purchase - Abschluss Seite ENDE *}