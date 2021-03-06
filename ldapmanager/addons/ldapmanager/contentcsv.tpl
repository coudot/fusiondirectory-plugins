<p>
{t}The CSV import plugin provides methods to generate user accounts from a file containing Semi-Colon Seperated Values. The administrator can decide which columns should be transfered to which attribute. Note that you must have at least the GIVENNAME and SURNAME set.{/t}
</p>
<p class="seperator">&nbsp;</p>

{if $fileup != TRUE}
<table>
  <tr>
    <td>
      <LABEL for="userfile">{t}Select CSV file to import{/t}</LABEL>
    </td>
    <td>
    <input type="hidden" name="MAX_FILE_SIZE" value="2097152">
    <input id="userfile" name="userfile" type="file" value="{t}Browse{/t}">
    </td>
  </tr>
  <tr>
    <td>
    <LABEL for="template">{t}Select template{/t}</LABEL>
    </td>
    <td>
    <select id="template" name="template" size="1" title="">
      {html_options options=$templates selected=""}
    </select>
    </td>

  </tr>
</table>
{elseif $sorted != FALSE}


<br>
    {if $error == FALSE}
       <b>{t}All entries have been written to the LDAP database successfully.{/t}</b>
    {else}
       <b style="color:red">{t}Oups. There was an error during the import of your data.{/t}</b>
  {/if}

<b>{t}Here is the status report for the import:{/t} </b>
<br>
<br>


  <table border="0" bgcolor="#FEFEFE">
    <tr>
      {foreach from=$head item=h}
      <td bgcolor="#BBBBBB">
        <b>{$h}</b>
      </td>
      {/foreach}
    </tr>
    {if $pointsbefore == TRUE}
    <tr>
      <td colspan={$i} bgcolor = "#EEEEEE">
        ...
      </td>
    </tr>
    {/if}

    {foreach from=$data item=row key=key}
    <tr>
      {foreach from=$data[$key] item=col key=key2}
      <td bgcolor="#EEEEEE">
        {$data[$key][$key2]}
      </td>
      {/foreach}
    </tr>
    {/foreach}
      {if $pointsafter == TRUE}
      <tr>
          <td colspan={$i} bgcolor = "#EEEEEE">
          ...
          </td>
      </tr>
      {/if}

  </table>

{else}
<br><b>{t}Selected Template{/t}:</b> {$tpl}
<br>
<br>
  <table border=0 bgcolor="#FEFEFE">
    {foreach from=$data[0] item=val key=key}
    <tr>
      <td bgcolor="#BBBBBB">
        <select name="row{$key}" size="1" title="">
             {html_options options=$attrs selected=$selectedattrs[$key]}
        </select>
      </td>
      {foreach from=$data item=val2 key=key2}
      <td bgcolor="#EEEEEE">
        {$data[$key2][$key]}&nbsp;
      </td>
      {/foreach}
    </tr>
    {/foreach}

  </table>

{/if}
<p class="plugbottom">
{if $fileup != TRUE}
  <input type="submit" value="{t}Import{/t}" name="fileup" >
{else}
{if $sorted == FALSE}
  <input name="sorted" value="{t}Import{/t}" type ="submit">
{else}
  <input type=submit name="back{$plug}" value="{msgPool type=backButton}">
{/if}
{/if}
</p>
<input type="hidden" name="ignore">
