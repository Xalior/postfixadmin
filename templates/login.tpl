


<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Navbar</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="#">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Link</a>
                </li>
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                        Dropdown
                    </a>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Action</a></li>
                        <li><a class="dropdown-item" href="#">Another action</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Something else here</a></li>
                    </ul>
                </li>
                <li class="nav-item">
                    <a class="nav-link disabled" aria-disabled="true">Disabled</a>
                </li>
            </ul>
            <form class="d-flex" role="search">
                <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>

<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href='main.php'><img id="login_header_logo" src="{$CONF.theme_logo}"
                                                         alt="Logo"/></a>
            {if $CONF.show_header_text==='YES' && $CONF.header_text}
                <h2>{$CONF.header_text}</h2>
            {/if}
        </div>
    </div>
</nav>

<div id="login" class="container">

    <h2 class="h2">{if $logintype=='admin'}{$PALANG.pLogin_welcome}{else}{$PALANG.pUsersLogin_welcome}{/if}</h2>

    <div class="well">

        <form name="frmLogin" method="post" action="" role="form" class="form-signin">
            <input type="hidden" name="token" value="{$smarty.session.PFA_token|escape:"url"}"/>
            <div class="form-group">
                <label for="fUsername">{$PALANG.pLogin_username}:</label>
                <input class="form-control" type="text" name="fUsername" id="fUsername"/>
            </div>
            <div class="form-group">
                <label for="fPassword">{$PALANG.password}:</label>
                <input class="form-control" type="password" name="fPassword" id="fPassword"/>
            </div>
            {if $forgotten_password_reset}
                <div class="form-group row">
                    <div class="col-sm-6 col-sm-offset-3 reset-button">
                        <a class="btn btn-default btn-block" role="button" href="password-recover.php">
                            <span class="glyphicon glyphicon-refresh" aria-hidden="true"></span>
                            {$PALANG.pUsersLogin_password_recover}</a>
                    </div>
                </div>
            {/if}
            <div class="form-group">
                <label for=lang>{$PALANG.pLogin_language}:</label>
                {$language_selector}
            </div>
            <div class="text-center">
                <button class="btn btn-primary btn-lg" type="submit" name="submit" value="{$PALANG.pLogin_button}"><span class="glyphicon glyphicon-log-in"
                                                    		aria-hidden="true"></span> {$PALANG.pLogin_button}</button>
            </div>
        </form>
        {if $logintype == 'admin'}
            <br/>
            <div class="text-center">
                <a href="users/">{$PALANG.pLogin_login_users}</a>
            </div>
        {/if}
    </div>
    <script type="text/javascript">
        document.frmLogin.fUsername.focus();
    </script>
</div>
