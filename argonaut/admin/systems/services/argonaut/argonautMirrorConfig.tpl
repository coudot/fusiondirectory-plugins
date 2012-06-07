<br/>
{render acl=$argonautMirrorConfigACL}
<table>
<tr><td colspan="2"><h3>Argonaut mirror settings:</h3></td></tr>
{foreach from=$attributes key=key item=value name=loop}
{if $smarty.foreach.loop.index == $crawlerIndice}
<tr><td colspan="2"><br/><h3>Argonaut Debconf Crawler config:</h3></td></tr>
{elseif $smarty.foreach.loop.index == $ldap2repIndice}
<tr><td colspan="2"><br/><h3>Argonaut Ldap2repository config:</h3></td></tr>
{/if}
<tr>
  <td><label for="{$key}">
  {if $key=='argonautMirrorDir'}
    {t}Local debian mirror directory{/t}
  {elseif $key=='argonautCrawlerPackagesFolder'}
    {t}Local packages folder{/t}
  {elseif $key=='argonautLdap2repProxy'}
    {t}Proxy{/t}
  {elseif $key=='argonautLdap2repErrors'}
    {t}Errors{/t}
  {elseif $key=='argonautLdap2repSource'}
    {t}Source{/t}
  {elseif $key=='argonautLdap2repGPGCheck'}
    {t}GPG Check{/t}
  {elseif $key=='argonautLdap2repContents'}
    {t}Contents{/t}
  {elseif $key=='argonautLdap2repVerbose'}
    {t}Verbose{/t}
  {/if}
  </label></td>
  <td><input id="{$key}" name="{$key}"
  {if in_array($key,$booleans)}
    type="checkbox"
    {if $value==1} checked="checked"{/if}
  {else}
    type="text"
    value="{$value}"
  {/if}
  /></td>
</tr>
{/foreach}
</table>
{/render}

<p class="seperator">&nbsp;</p>
<div style="width:100%; text-align:right;padding-top:10px;padding-bottom:3px;">
  <input type='submit' name='SaveService' value='{msgPool type=saveButton}'>
  &nbsp;
  <input type='submit' name='CancelService' value='{msgPool type=cancelButton}'>
</div>
<input type="hidden" name="argonautMirrorConfigPosted" value="1">