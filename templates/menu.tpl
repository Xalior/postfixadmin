<!-- {$smarty.template} -->
{strip}
    {if !empty($smarty.get) && !empty($smarty.get.domain)}
        {*** zuweisung muss eleganter gehen ***}
        {assign var="url_domain" value=$smarty.get.domain}
        {assign var="url_domain" value="&amp;domain={$url_domain|escape:url}"}
    {/if}
{/strip}

{strip}

    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand" href='main.php'><img id="login_header_logo" src="{$CONF.theme_logo|default:'images/postbox.png'}" alt="Logo"/></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    {* list-admin *}
                    {if $authentication_has_role.global_admin}
                        {strip}
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" href="#" role="button">
                                    <i class="bi bi-list-task"></i> {$PALANG.pAdminMenu_list_admin}</a>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="{#url_list_admin#}"><span class="bi bi-list" aria-hidden="true"></span> {$PALANG.pAdminMenu_list_admin}</a></li>
                                    <li><a class="dropdown-item" href="{#url_create_admin#}"><span class="bi bi-plus" aria-hidden="true"></span> {$PALANG.pAdminMenu_create_admin}</a></li>
                                </ul>
                            </li>
                        {/strip}
                    {else}
                        <li class="nav-item">
                            <a class="nav-link" href="{#url_main#}"><i class="bi bi-home"> {$PALANG.pMenu_main}</a></li>
                    {/if}
                    {* list-domain *}
                    {strip}
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" href="#" role="button">
                                <i class="bi bi-view-stacked"></i> {$PALANG.pAdminMenu_list_domain}</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="{#url_list_domain#}"><span class="bi bi-view-stacked" aria-hidden="true"></span> {$PALANG.pAdminMenu_list_domain}</a></li>
                                {if $authentication_has_role.global_admin}
                                    <li><a class="dropdown-item" href="{#url_edit_domain#}"><span class="bi bi-plus" aria-hidden="true"></span> {$PALANG.pAdminMenu_create_domain}</a></li>
                                {/if}
                            </ul>
                        </li>
                    {/strip}
                    {* list-virtual *}
                    {strip}
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" href="#" role="button">
                                <i class="bi bi-card-list"></i> {$PALANG.pAdminMenu_list_virtual}</a>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="{#url_list_virtual#}"><i class="bi bi-card-list"></i> {$PALANG.pAdminMenu_list_virtual}</a></li>
                                <li><a class="dropdown-item" href="{#url_create_mailbox#}{$url_domain}"><i class="bi bi-inbox"></i> {$PALANG.add_mailbox}</a></li>
                                <li><a class="dropdown-item" href="{#url_create_alias#}{$url_domain}"><i class="bi bi-plus-circle-fill"></i> {$PALANG.add_alias}</a></li>
                                {if $boolconf_alias_domain}
                                    <li>
                                        <a class="dropdown-item" href="{#url_create_alias_domain#}{$url_domain}"><i class="bi bi-plus"></i> {$PALANG.add_alias_domain}</a>
                                    </li>
                                {/if}
                            </ul>
                        </li>
                    {/strip}
                    {* fetchmail *}
                    {if $CONF.fetchmail==='YES'}
                        {strip}
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" href="#" role="button">
                                    <i class="bi bi-mailbox"></i> {$PALANG.pMenu_fetchmail}</a>
                                <ul class="dropdown-menu">
                                    <li><a class="nav-link" href="{#url_fetchmail#}"><i class="bi bi-mailbox"></i> {$PALANG.pMenu_fetchmail}</a></li>
                                    <li><a class="nav-link" href="{#url_fetchmail_new_entry#}"><i class="bi bi-plus"></i> {$PALANG.pFetchmail_new_entry}</a></li>
                                </ul>
                            </li>
                        {/strip}
                    {/if}
                    {* sendmail *}
                    {if $CONF.sendmail==='YES'}
                        {strip}
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" href="#" role="button">
                                    <i class="bi bi-mailbox-flag"></i> {$PALANG.pMenu_sendmail}
                                </a>
                                <ul class="dropdown-menu">
                                    <li><a class="nav-link" href="{#url_sendmail#}"><i class="bi bi-send"></i> {$PALANG.pMenu_sendmail}</a></li>
                                    {if $authentication_has_role.global_admin || (isset($CONF.sendmail_all_admins) && $CONF.sendmail_all_admins === 'YES') }
                                        <li>
                                            <a class="nav-link" href="{#url_broadcast_message#}"><i class="bi bi-share"></i> {$PALANG.pAdminMenu_broadcast_message}</a>
                                        </li>
                                    {/if}
                                </ul>
                            </li>
                        {/strip}
                    {/if}
                    {* dkim *}
                    {if $CONF.dkim==='YES' && (
                        $authentication_has_role.global_admin ||
                        (isset($CONF.dkim_all_admins) && $CONF.dkim_all_admins === 'YES') )
                    }
                        {strip}
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" href="#" role="button">
                                    <i class="bi bi-star-fill"></i> {$PALANG.pMenu_dkim}</a>
                                <ul class="dropdown-menu">
                                    <li><a class="nav-link" href="{#url_dkim#}"><i class="bi bi-star-fill"></i> {$PALANG.pMenu_dkim}</a></li>
                                    <li><a class="nav-link" href="{#url_dkim_signing#}"><i class="bi bi-list"></i> {$PALANG.pMenu_dkim_signing}</a></li>
                                    <li><a class="nav-link" href="{#url_dkim_newkey#}"><i class="bi bi-plus"></i> {$PALANG.pDkim_new_key}</a></li>
                                    <li><a class="nav-link" href="{#url_dkim_newsign#}"><i class="bi bi-plus"></i> {$PALANG.pDkim_new_sign}</a></li>
                                </ul>
                            </li>
                        {/strip}
                    {/if}
                    {* TOTP *}
                    {if $CONF.totp==='YES'}
                        {strip}
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false" href="#" role="button">
                                    <i class="bi bi-lock-fill"></i> {$PALANG.pMenu_security} </a>
                                <ul class="dropdown-menu">
                                    <li><a class="nav-link" href="{#url_password#}"><i class="bi bi-lock-fill"></i> {$PALANG.pMenu_password}</a></li>
                                    <li><a class="nav-link" href="{#url_totp#}"><i class="bi bi-lock-fill"></i> {$PALANG.pMenu_totp}</a></li>
                                    <li><a class="nav-link" href="{#url_totp_exceptions#}"><i class="bi bi-lock-fill"></i> {$PALANG.pMenu_totp_exceptions}</a></li>
                                    <li><a class="nav-link" href="{#url_app_passwords#}"><i class="bi bi-lock-fill"></i> {$PALANG.pMenu_app_passwords}</a></li>
                                </ul>
                            </li>
                        {/strip}
                    {else}
                        {* password *}
                        <li class="nav-item">
                            <a class="nav-link" href="{#url_password#}">
                                <i class="bi bi-lock-fill"></i>
			            	{$PALANG.pMenu_password}</a></li>
	                {/if}	
                    {* backup *}
                    {if $authentication_has_role.global_admin && $CONF.database_type!=='pgsql' && $CONF.backup === 'YES'}
                        <li class="nav-item"><a class="nav-link" href="{#url_backup#}">
                                <i class="bi bi-list"></i> {$PALANG.pAdminMenu_backup}</a></li>
                    {/if}
                    {* viewlog *}
                    {if $CONF.logging==='YES'}
                        <li><a class="btn navbar-btn" type="button"
                               href="{#url_viewlog#}">
                                <i class="bi bi-file-earmark"></i>
                                {$PALANG.pMenu_viewlog}</a></li>
                    {/if}
                    {* logout *}
                    <li><a class="btn navbar-btn" type="button"
                           href="{#url_logout#}">
                            <i class="bi bi-box-arrow-right"></i>
                            {$PALANG.pMenu_logout}</a></li>
                </ul>
            </div><!--/.nav-collapse -->
        </div>
    </nav>
{/strip}
