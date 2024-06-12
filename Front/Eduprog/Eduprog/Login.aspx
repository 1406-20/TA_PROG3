<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Eduprog.Login" %>

<!DOCTYPE html>
<style>
    input:focus, input.form-control:focus {
        outline:none !important;
        outline-width: 0 !important;
        box-shadow: none;
        -moz-box-shadow: none;
        -webkit-box-shadow: none;
        border: none;
    }
    .input-box{
        outline:none !important;
        outline-width: 0 !important;
        box-shadow: none;
        -moz-box-shadow: none;
        -webkit-box-shadow: none;
        border: none;
    }
</style>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Estilos/login.css" rel="stylesheet" />
    <link href="Content/bootstrap.css" rel="stylesheet" />
    <script src="Scripts/login.js"></script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="loginForm" class="contenedor-form" runat="server">
        <div class="contenedor-credenciales">
            <div>
                <img src="Imágenes/logo.png" height="300" width="300"/>
            </div>
            <div class="credenciales">
                <span>
                    <i>
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
                            <path d="M9.99998 3.33337C10.884 3.33337 11.7319 3.68456 12.357 4.30968C12.9821 4.93481 13.3333 5.78265 13.3333 6.66671C13.3333 7.55076 12.9821 8.39861 12.357 9.02373C11.7319 9.64885 10.884 10 9.99998 10C9.11592 10 8.26808 9.64885 7.64296 9.02373C7.01784 8.39861 6.66665 7.55076 6.66665 6.66671C6.66665 5.78265 7.01784 4.93481 7.64296 4.30968C8.26808 3.68456 9.11592 3.33337 9.99998 3.33337ZM9.99998 11.6667C13.6833 11.6667 16.6666 13.1584 16.6666 15V16.6667H3.33331V15C3.33331 13.1584 6.31665 11.6667 9.99998 11.6667Z" fill="#042354" />
                        </svg>
                    </i>
                </span>
                <asp:TextBox ID="user" runat="server" placeholder="Correo electrónico" CssClass="input-box"/>
            </div>
            <div class="credenciales">
                <span>
                    <i>
                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 20 20" fill="none">
                            <path d="M9.99998 14.1667C10.442 14.1667 10.8659 13.9911 11.1785 13.6786C11.4911 13.366 11.6666 12.9421 11.6666 12.5C11.6666 12.058 11.4911 11.6341 11.1785 11.3215C10.8659 11.009 10.442 10.8334 9.99998 10.8334C9.55795 10.8334 9.13403 11.009 8.82147 11.3215C8.50891 11.6341 8.33331 12.058 8.33331 12.5C8.33331 12.9421 8.50891 13.366 8.82147 13.6786C9.13403 13.9911 9.55795 14.1667 9.99998 14.1667ZM15 6.66671C15.442 6.66671 15.8659 6.8423 16.1785 7.15486C16.4911 7.46742 16.6666 7.89135 16.6666 8.33337V16.6667C16.6666 17.1087 16.4911 17.5327 16.1785 17.8452C15.8659 18.1578 15.442 18.3334 15 18.3334H4.99998C4.55795 18.3334 4.13403 18.1578 3.82147 17.8452C3.50891 17.5327 3.33331 17.1087 3.33331 16.6667V8.33337C3.33331 7.89135 3.50891 7.46742 3.82147 7.15486C4.13403 6.8423 4.55795 6.66671 4.99998 6.66671H5.83331V5.00004C5.83331 3.89497 6.2723 2.83516 7.0537 2.05376C7.8351 1.27236 8.89491 0.833374 9.99998 0.833374C10.5472 0.833374 11.089 0.941148 11.5945 1.15054C12.1 1.35994 12.5593 1.66685 12.9463 2.05376C13.3332 2.44067 13.6401 2.9 13.8495 3.40553C14.0589 3.91105 14.1666 4.45287 14.1666 5.00004V6.66671H15ZM9.99998 2.50004C9.33694 2.50004 8.70105 2.76343 8.23221 3.23227C7.76337 3.70111 7.49998 4.337 7.49998 5.00004V6.66671H12.5V5.00004C12.5 4.337 12.2366 3.70111 11.7677 3.23227C11.2989 2.76343 10.663 2.50004 9.99998 2.50004Z" fill="#042354" />
                        </svg>
                    </i>
                </span>
                <asp:TextBox ID="password" TextMode="Password" runat="server" placeholder="Contraseña" CssClass="input-box"/>
            </div>
            <div class="opciones-login">
                <asp:LinkButton ID="Ingresar" runat="server"  Text="Ingresar" OnClick="iniciarSesion_Click"/>
            </div>
            <p id="errorCredenciales" runat="server" class="mensaje-error">Credenciales incorrectas</p>

           <%-- <a href="#" class="olvido-contraseña">
                ¿Olvidó su contraseña?
            </a>--%>
        </div>
    </form>
    <div class="d-flex flex-fill">
        <img src="Imágenes/Bauhaus-Dessau_main_building.jpg" width="1550" height="970"/>
    </div>
</body>
</html>
