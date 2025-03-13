<!-- {$smarty.template} -->
<div class="card" id="main_menu">

    <section>
        <h2>Global Search</h2>
        <form method=GET class=form action="">
            <div class="input-group">
                <input type="text" id=q name=q class="form-control" value="{$q}" autofocus="autofocus"
                       placeholder="Global search (mailbox, alias ...)"
                       aria-label="Global Search">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="submit">Search</button>
                </span>
            </div>
        </form>


        {if !empty($domains)}
            <h3>Domains</h3>
            <ul>
                {foreach from=$domains item=row}
                    <li>Domain: <a
                                href="list-virtual.php?domain={$row['domain']|escape:url}">{$row['domain']}</a>
                    </li>
                {/foreach}
            </ul>
        {/if}

        {if !empty($mailboxes)}
            <h3>Mailboxes</h3>
            <ul>
                {foreach from=$mailboxes item=row}
                    <li>Mailbox: <a
                                href="edit.php?table=mailbox&edit={$row['username']|escape:url}">{$row['username']}</a>
                    </li>
                {/foreach}
            </ul>
        {/if}


        {if !empty($aliases)}
            <h3>Aliases</h3>
            <ul>
                {foreach from=$aliases item=row}
                    <li>Alias: <a
                                href="edit.php?table=alias&edit={$row['address']|escape:url}">{$row['address']}</a>
                    </li>
                {/foreach}
            </ul>
        {/if}
    </section>

    <section>
        <h2>Dashboard</h2>
        <table class="table">
            <div class="row align-items-start" style="border-bottom: 1px;">
                <div class="col-2 d-grid gap-2 m-1"><a style="text-align:left; padding-left:15px" class="btn btn-primary btn-block"
                                       href="{#url_list_domain#}"><i class="bi bi-grid-fill"
                                                                        aria-hidden="true"></i> {$PALANG.pMenu_overview}
                    </a></div>
                <div class="col">{$PALANG.pMain_overview}</div>
            </div>
            <div class="row align-items-start">
                <div class="col-2 d-grid gap-2 m-1"><a style="text-align:left; padding-left:15px" class="btn btn-primary btn-block"
                                       href="{#url_create_alias#}"><span class="bi bi-plus-circle-fill"
                                                                         aria-hidden="true"></span> {$PALANG.add_alias}
                    </a>
                </div>
                <div class="col">{$PALANG.pMain_create_alias}</div>
            </div>
            <div class="row align-items-start">
                <div class="col-2 d-grid gap-2 m-1"><a style="text-align:left; padding-left:15px" class="btn btn-primary btn-block"
                                       href="{#url_create_mailbox#}"><span class="bi bi-inbox"
                                                                           aria-hidden="true"></span> {$PALANG.add_mailbox}
                    </a></div>
                <div class="col">{$PALANG.pMain_create_mailbox}</div>
            </div>
            {if $CONF.sendmail==='YES'}
                <div class="row align-items-start">
                    <div class="col-2 d-grid gap-2 m-1"><a style="text-align:left; padding-left:15px" class="btn btn-primary btn-block"
                                           href="{#url_sendmail#}"><span class="bi bi-send"
                                                                         aria-hidden="true"></span> {$PALANG.pMenu_sendmail}
                        </a></div>
                    <div class="col">{$PALANG.pMain_sendmail}</div>
                </div>
            {/if}
            {if $CONF.dkim==='YES' && (
            $authentication_has_role.global_admin ||
            (isset($CONF.dkim_all_admins) && $CONF.dkim_all_admins === 'YES') )
            }
                <div class="row align-items-start">
                    <div class="col-2 d-grid gap-2 m-1"><a style="text-align:left; padding-left:15px" class="btn btn-primary btn-block"
                                           href="{#url_dkim#}"><span class="bi bi-star-fill"
                                                                     aria-hidden="true"></span> {$PALANG.pMenu_dkim}</a>
                    </div>
                    <div class="col">{$PALANG.pMain_dkim}</div>
                </div>
            {/if}
            <div class="row align-items-start">
                <div class="col-2 d-grid gap-2 m-1"><a style="text-align:left; padding-left:15px" class="btn btn-primary btn-block"
                                       href="{#url_password#}"><span class="bi bi-lock"
                                                                     aria-hidden="true"></span> {$PALANG.pMenu_password}
                    </a>
                </div>
                <div class="col">{$PALANG.pMain_password}</div>
            </div>
            {* viewlog *}
            {if $CONF.logging==='YES'}
                <div class="row align-items-start">
                    <div class="col-2 d-grid gap-2 m-1"><a style="text-align:left; padding-left:15px" class="btn btn-primary btn-block"
                                           href="{#url_viewlog#}"><span class="bi bi-file-earmark"
                                                                        aria-hidden="true"></span> {$PALANG.pMenu_viewlog}
                        </a></div>
                    <div class="col">{$PALANG.pMain_viewlog}</div>
                </div>
            {/if}
            <div class="row align-items-start">
                <div class="col-2 d-grid gap-2 m-1"><a style="text-align:left; padding-left:15px"
                                                             class="btn btn-primary btn-block"
                                                             href="{#url_logout#}"><span
                                style="padding-left: 5px;" class="bi bi bi-box-arrow-right"
                                aria-hidden="true"></span> {$PALANG.pMenu_logout}</a></div>
                <div class="col">{$PALANG.pMain_logout}</div>
            </div>
        </table>
    </section>
</div>
