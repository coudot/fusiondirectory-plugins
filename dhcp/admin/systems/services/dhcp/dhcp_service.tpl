<p><b>{t}Generic{/t}</b></p>

<table width="100%">
 <tr>
  <td width="50%">
{render acl=$acl}
  <input id='authoritative' type=checkbox name="authoritative" value="1" {if $authoritative} checked {/if}> {t}Authoritative service{/t}<br>
{/render}
  <br>
  {t}Dynamic DNS update{/t}
{render acl=$acl}
  <select name='ddns_update_style'  title='{t}Dynamic DNS update style{/t}' size="1">
       {html_options values=$ddns_styles output=$ddns_styles selected=$ddns_update_style}
  </select>
{/render}
  </td>

  <td style='vertical-align:top'>

   <table>
    <tr>
      <td>{t}Default lease time (s){/t}</td>
      <td>
{render acl=$acl}
      <input type='text' name='default_lease_time' size='25' maxlength='80' value='{$default_lease_time}' title='{t}Enter default lease time in seconds.{/t}'>
{/render}
      </td>
    </tr>
    <tr>
      <td>{t}Maximum lease time (s){/t}</td>
      <td>
{render acl=$acl}
      <input type='text' name='max_lease_time' size='25' maxlength='80' value='{$max_lease_time}' title='{t}Enter maximum lease time in seconds.{/t}'>
{/render}
      </td>
    </tr>
   </table>

  </td>

 </tr>
</table>

<p class="seperator"></p>

<!-- Place cursor in correct field -->
<script type="text/javascript">
  <!-- // First input field on page
  focus_field('authoritative');
  -->
</script>
