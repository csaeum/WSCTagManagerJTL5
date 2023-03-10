{* Purchase - Abschluss Seite START *}
{foreach $Bestellung->Positionen as $vorArtikel}

    {* START nPosTyp 3 = Coupon *}
    {* nPosTyp auf https://forum.jtl-software.de/threads/hilfe-bei-wf-benoetigt-postitionstyp-coupon.196669/#post-1050265 *}
    {if $vorArtikel->nPosTyp == '3'}
        {assign var='couponWSCname' value={$vorArtikel->cName}}
        {assign var='couponWSCWertmitEuro' value={$vorArtikel->cGesamtpreisLocalized[0]}}
        {assign var='couponWSCWertmitKomma' value=$couponWSCWertmitEuro|replace:" EUR":""}
        {assign var='couponWSCWert' value=$couponWSCWertmitKomma|replace:",":"."}
    {/if}
    {* ENDE nPosTyp 3 = Coupon *}

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

{foreach $WSCCart->PositionenArr as $Artikel}

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
    {if $Artikel->Artikel->Preise->Sonderpreis_aktiv == '1'}
    {literal}'discount': {/literal}{math equation="(x - y) * z" x=$Artikel->Artikel->Preise->alterVK[0] y=$Artikel->Artikel->Preise->fVK[0] z=$Artikel->nAnzahl}{literal},{/literal}
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
    {literal}'item_variant': '{/literal}{foreach $Artikel->WarenkorbPosEigenschaftArr as $WarenkorbPosEigenschaft}{$WarenkorbPosEigenschaft->cEigenschaftName} = {$WarenkorbPosEigenschaft->cEigenschaftWertName} | {/foreach}{literal}',{/literal}
    {/if}
    {* ENDE item_variant *}

    {assign var='GesamtpreismitEuro' value=$Artikel->cGesamtpreisLocalized[0].EUR}
    {assign var='GesamtpreisPunkte' value=$GesamtpreismitEuro|replace:" &euro;":""}
    {assign var='Gesamtpreis' value=$GesamtpreisPunkte|replace:".":""}

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