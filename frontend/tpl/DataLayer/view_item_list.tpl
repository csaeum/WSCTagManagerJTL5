{* Produkt View item List - Kategorieseite START *}
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
                'item_brand': '{/literal}{$Artikel->cHersteller}{literal}',{/literal}

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

                {literal}
                'item_list_name': 'Kategorie {/literal}item_list_name{literal}',{/literal}

                {if $Artikel->isSimpleVariation == 'true'}
                    {literal}'item_variant': '{/literal}einfacher Artikel{literal}',{/literal}
                {/if}

                'price': {/literal}{$Artikel->Preise->fVKBrutto|replace:",":"."|replace:" &euro;":""}{literal},
                'quantity': {/literal}{$Artikel->fMindestbestellmenge|replace:",":"."}{literal},
            },
        {/literal}
            {/foreach}
        {literal}
        ]
    }
{/literal}
{* Produkt View item List - Kategorieseite ENDE *}