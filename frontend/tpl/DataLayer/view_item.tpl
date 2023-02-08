{* Produkt View item - Produktdetail Seite START *}
{literal}
    'event': 'view_item',
    'ecommerce': {
        'items': [
            {
                'item_id': '{/literal}{$Artikel->cArtNr}{literal}',
                'item_name': '{/literal}{$Artikel->cName}{literal}',
                'affiliation': '{/literal}affili{literal}',
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
                    {literal}'item_variant': '{/literal}einfacher Artikel{literal}',{/literal}
                {/if}
                {literal}'price': {/literal}{$Artikel->Preise->fVKBrutto|replace:",":"."|replace:" &euro;":""}{literal},
                'quantity': {/literal}{$Artikel->fMindestbestellmenge|replace:",":"."}{literal},
            }
        ]
    }
{/literal}
{* Produkt View item - Produktdetail Seite ENDE *}