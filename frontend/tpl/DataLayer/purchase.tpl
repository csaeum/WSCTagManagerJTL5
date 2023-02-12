{* Purchase - Abschluss Seite START *}

    {foreach $Bestellung->Positionen as $vorArtikel}
{* START nPosTyp 3 = Coupon *}
{* nPosTyp auf https://forum.jtl-software.de/threads/hilfe-bei-wf-benoetigt-postitionstyp-coupon.196669/#post-1050265 *}
        {if $vorArtikel->nPosTyp == '3'}
            {assign var='couponWSCname' value={$vorArtikel->cName}}
            {assign var='couponWSCWertmitEuro' value={$vorArtikel->cGesamtpreisLocalized[0]}}
            {assign var='couponWSCWertmitKomma' value=$couponWSCWertmitEuro|replace:" EUR":""}
            {assign var='couponWSCWert' value=$couponWSCWertmitKomma|replace:",":"."}
            {assign var='grandTotalWSCWert' value={math equation="x + y" x=$Bestellung->fGesamtsumme y=$couponWSCWert}}
        {/if}
{* START nPosTyp 3 = Coupon *}
    {/foreach}

    {literal}
    'event': 'purchase',
    'ecommerce': {
        'currency': '{/literal}{$smarty.session.cWaehrungName}{literal}',
        'transaction_id': '{/literal}{$Bestellung->cBestellNr}{literal}',
        'value': {/literal}{$Bestellung->fGesamtsumme|replace:",":"."}{literal},{/literal}

{* START coupon *}
        {if $couponWSCname != ''}
            {literal}'coupon': '{/literal}{$couponWSCname}{literal}',{/literal}
        {/if}
{* ENDE coupon *}

    {literal}
        'shipping': {/literal}{$Bestellung->fVersand|replace:",":"."}{literal},
        'tax': {/literal}{$Bestellung->fSteuern|replace:",":"."}{literal},{/literal}

{* Der Gesamtumsatz der Bestellung, einschließlich Steuern und Versand, abzüglich etwaiger Rabatte. *}
        {if $grandTotalWSCWert != ''}
            {literal}'grandTotal': {/literal}{$grandTotalWSCWert}{literal},{/literal}
        {else}
            {literal}'grandTotal': {/literal}{$Bestellung->fGesamtsumme|replace:",":"."}{literal},{/literal}
        {/if}

{* Die Gesamtsumme der Bestellung ohne Versandkosten *}
        {literal}'subTotal': {/literal}{$Bestellung->fWarensumme|replace:",":"."}{literal},{/literal}

{* START discount *}
{* Rabatt angeboten? Standardmäßig falsch. Andernfalls sollten Sie einen numerischen Wert angeben. *}
        {if $Artikel->Preise->Sonderpreis_aktiv == 'true'}
            {literal}'discount': {/literal}discount{literal},{/literal}
        {/if}
{* ENDE discount *}
    {literal}
        'items': [
    {/literal}

    {foreach $Bestellung->Positionen as $Artikel}

        {if !isset($counter)}{assign var='counter' value='1'}{/if}

        {literal}
            {
        {/literal}

{* START item_id *}
            {if $Artikel->cArtNr !== ''}
                {literal}'item_id': '{/literal}{$Artikel->cArtNr}{literal}',{/literal}
            {/if}
{* ENDE item_id *}

                {literal}'item_name': '{/literal}{$Artikel->cName}{literal}',{/literal}

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

{* START item_variant *}
            {if $Artikel->Artikel->isSimpleVariation == 'true'}
                {literal}'item_variant': '{/literal}einfacher Artikel{literal}',{/literal}
            {/if}
{* ENDE item_variant *}

        {assign var='GesamtpreismitEuro' value=$Artikel->cGesamtpreisLocalized[0]}
        {assign var='Gesamtpreis' value=$GesamtpreismitEuro|replace:" EUR":""}

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
                'orderValue': '{/literal}{$Bestellung->fWarensummeNetto|replace:",":"."}{literal}',
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