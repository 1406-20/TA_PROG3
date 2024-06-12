<%@ Page Title="" Language="C#" MasterPageFile="~/EduprogAdmin.Master" AutoEventWireup="true" CodeBehind="Perfil.aspx.cs" Inherits="Eduprog.Admin.Perfil" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
    <script type="text/javascript">
        function fileinfo() {
            document.getElementById('<%=txtFoto.ClientID%>').value = document.getElementById('<%=fileFoto.ClientID%>').value;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <div class="titulo">
        <asp:Label id="tituloPerfil" runat="server" Text="Mi perfil"/>
    </div>
    <%-- Contenedor de toda la información --%>
    <div class="contenedor-perfil">
        <%-- Contenedor de la información del usuario --%>
        <div class="contenedor-izquierdo">
            <%-- Contenedor de la información personal del usuario --%>
            <div class="contenedor-informacion">
                <p>Información Personal</p>
                <hr />
                <div >
                    <asp:Label ID="lblNombre" runat="server" Text="Nombre:" />
                    <div class="col-sm-7">
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Enabled="false"
                            />
                    </div>
                </div>
                <div >
                    <asp:Label ID="lblPaterno" runat="server" Text="Apellido Paterno:"/>
                    <div class="col-sm-7">
                        <asp:TextBox ID="txtPaterno" runat="server" CssClass="form-control" Enabled="false"
                            />
                    </div>
                </div>
                <div >
                    <asp:Label ID="lblMaterno" runat="server" Text="Apellido Materno:"/>
                    <div class="col-sm-7">
                        <asp:TextBox ID="txtMaterno" runat="server" CssClass="form-control" Enabled="false"
                            />
                    </div>
                </div>
                <div >
                    <asp:Label ID="lblCorreo" runat="server" Text="e-mail:"/>
                    <div class="col-sm-7">
                        <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" Enabled="false"
                            />
                    </div>
                </div>
            </div>
            <%-- Contenedor de la contraseña del usuario --%>
            <div class="contenedor-contrasenha">
                <p>Seguridad</p>
                <hr />
                <div >
                    <asp:Label ID="lblContraseña" runat="server" Text="Contraseña:" />
                    <div class="col-sm-7">
                        <asp:TextBox ID="txtContrasenha" runat="server"  CssClass="form-control" Enabled="false"
                            />
                    </div>
                </div>
                
                <div class="editar-contraseña">
                    <asp:LinkButton ID="btnEditarContrasenha" runat="server" OnClick="cambiarContrasenha" style="display:block" Text="<i class='fa-solid fa-edit ps-2'></i> Editar Contraseña"/>
                </div>
                <asp:Label ID="errorContrasenhaAntigua" CssClass="mensaje-error" runat="server" Text="Contraseña actual incorrecta" style="display:none;"/>
                <div>
                    <asp:Label ID="lblContrasenhaNueva" runat="server" Text="Contraseña nueva:" style="display:none"/>
                    <div class="col-sm-7">
                        <asp:TextBox ID="txtContrasenhaNueva" TextMode="Password" runat="server" CssClass="form-control" Enabled="true"
                            style="display:none"/>
                    </div>
                </div>
                <div>
                    <asp:Label ID="lblRepetirContrasenha" runat="server" Text="Repetir Contraseña:" style="display:none"/>
                    <div class="col-sm-7">
                        <asp:TextBox ID="txtRepetirContrasenha" TextMode="Password" runat="server" CssClass="form-control" Enabled="true"
                            style="display:none"/>
                    </div>
                </div>
                <div>
                    <asp:Label ID="lblErrorContrasenhaNueva" runat="server" CssClass="mensaje-error" Text="Las contraseñas no coinciden" style="display:none;"/>
                </div>
                <div class="botones-contrasenha">
                    <asp:LinkButton ID="btnCancelarGuardado" CssClass="boton-cancelar" runat="server" OnClick="cancelarGuardado" style="display:none" Text="Cancelar" />
                    <asp:LinkButton ID="btnGuardarContrasenha" CssClass="boton-aceptar" runat="server" OnClick="guardarContrasenha" style="display:none" Text="Actualizar contraseña" />
                </div>
            </div>
        </div>
        <%-- Contenedor de la información de la foto del usuario --%>
        <div class="contenedor-derecho">
            <%-- Contenedor de la foto del usuario --%>
            <div class="contenedor-foto">
                <asp:Image ID="imagenUsuario" runat="server" ImageUrl="../Imágenes/logo.png"/>
            </div>
            <%-- Contenedor de los botones para cambiar la foto del usuario --%>
            <div class="contenedor-editar-foto">
                <div class="editar-foto">
                    <asp:LinkButton ID="lbEditarFoto" runat="server" OnClick="cambiarFoto" style="display:block" Text="<i class='fa-solid fa-edit ps-2'></i> Actualizar foto"/>
                </div>
                <div class="mb-3 input-custom-container">
                    <asp:TextBox id="txtFoto" runat="server" CssClass="input-custom-input" placeholder="Seleccione una nueva foto" Enabled="false" style="display:none"/>
                    <asp:LinkButton id="lbFoto" runat="server" CssClass="input-custom-button" Text="Seleccionar" style="display:none"/>
                    <asp:FileUpload id="fileFoto" runat="server" accept=".jpg" style="display: none;" onchange="fileinfo();"/>
                </div>
                <div class="contenedor-boton-subida">
                    <asp:Button id="btnSubirFoto" runat="server" CssClass="upload-custom-button" type="submit" Text="Subir Foto" style="display:none" OnClick="cargarFoto"/>
                </div>
                <div class="opciones-nuevo-foto">
                    <asp:LinkButton ID="btnGuardarFoto" CssClass="boton-aceptar" runat="server" OnClick="guardarFoto" style="display:none" Text="Actualizar foto" />
                   <asp:LinkButton ID="btnCancelarFoto" CssClass="boton-cancelar" runat="server" OnClick="cancelarGuardadoFoto" style="display:none" Text="Cancelar" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
