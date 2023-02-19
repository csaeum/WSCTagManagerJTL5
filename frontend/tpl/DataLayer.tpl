{* Produkt View item - Produktdetail Seite START *}
{if $nSeitenTyp == 'X1X'}
    {include file="./DataLayer/view_item.tpl"}
{/if}
{* Produkt View item - Produktdetail Seite ENDE *}

{* Produkt View item List - Kategorieseite START *}
{if $nSeitenTyp == 'X2X'}
    {include file="./DataLayer/view_item_list.tpl"}
{/if}
{* Produkt View item List - Kategorieseite ENDE *}

{* Purchase - Abschluss Seite START *}
{if $nSeitenTyp == '33'}
    {include file="./DataLayer/purchase.tpl"}
{/if}
{* Purchase - Abschluss Seite ENDE *}