<%@ Page Title="" Language="C#" MasterPageFile="~/EduprogAdmin.Master" AutoEventWireup="true" CodeBehind="Usuarios.aspx.cs" Inherits="Eduprog.Usuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <div class="container">
        <div class="container" style="display: flex; align-items: flex-start; justify-content: space-between;">
            <h2>Listado de Usuarios</h2>
            <asp:LinkButton ID="lbRegistrarUser" runat="server" CssClass="btn btn-success me-4" Text="<i class='fa-solid fa-plus pe-2'></i> Registrar Usuario" OnClick="registrarUsuario_Click"/>
        </div>
         <div class="container row">
            <div class="container" style="display: flex; justify-content: flex-end; margin-bottom: 15px">
                <asp:Label runat="server" Text="Buscar:" CssClass="col-form-label me-3"/>
                <div class="ms-0">
                    <asp:TextBox ID="txtSearchUser" runat="server" CssClass="form-control" Width="200px" />
                </div>
            </div>
            <div class="mb-3 row">
                <div class="container">
                    <asp:Label ID="lblTipoUser" runat="server" Text="Tipo de Usuario:" CssClass="col-sm-1 col-form-label me-2 ms-0" Font-Bold="true" Font-Size="Larger" />
                    <div class="form-check form-check-inline">
                        <label class="form-check-label" runat="server">
                            <asp:RadioButton type="radio" id="rbAlumno" GroupName="tipoUsuario" runat="server" value="Alumno" AutoPostBack="True" OnCheckedChanged="listarAlumno_click" Checked="true"/> Alumno
                        </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <label class="form-check-label" runat="server">
                            <asp:RadioButton type="radio" id="rbApoderado" GroupName="tipoUsuario" runat="server" AutoPostBack="True" OnCheckedChanged="listarApoderado_click" value="Apoderado"/> Apoderado
                        </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <label class="form-check-label" runat="server">
                            <asp:RadioButton type="radio" id="rbDocente" GroupName="tipoUsuario" runat="server" AutoPostBack="True" OnCheckedChanged="listarDocente_click" value="Docente"/> Docente
                        </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <label class="form-check-label" runat="server">
                            <asp:RadioButton type="radio" id="rbPersonal" GroupName="tipoUsuario" runat="server" AutoPostBack="True" OnCheckedChanged="listarTrabajador_click" value="Personal"/> Personal
                        </label>
                    </div>
                    <div class="form-check form-check-inline">
                        <label class="form-check-label" runat="server">
                            <asp:RadioButton type="radio" id="rbAdministrador" GroupName="tipoUsuario" runat="server" AutoPostBack="True" OnCheckedChanged="listarSuperusuario_click" value="Administrador"/> Administrador
                        </label>
                    </div>
                </div>
            </div>
         </div>
        <div class="container row">
            <asp:GridView ID="gvUsuarios" runat="server"
                AllowPaging="true" PageSize="5"
                AutoGenerateColumns="false" CssClass="table table-hover table-responsive table-striped"
                OnPageIndexChanging="gvUsuarios_PageIndexChanging">
                <Columns>
                    <asp:BoundField HeaderText="Id" DataField="idUsuario" NullDisplayText="-"  />
                    <asp:BoundField HeaderText="Nombre" DataField="nombre" NullDisplayText="-"  />
                    <asp:BoundField HeaderText="Apellido Paterno" DataField="apellidoPaterno" NullDisplayText="-"/>
                    <asp:BoundField HeaderText="Apellido Materno" DataField="apellidoMaterno" NullDisplayText="-"/>
                    <asp:BoundField HeaderText="fecha Creacion" DataField="fechaCreacion" NullDisplayText="-"/>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" Text="<i class='fa-solid fa-edit ps-2'></i>" OnClick="modificarUsuario_Click" CommandArgument='<%# Eval("idUsuario") %>'/>
                            <asp:LinkButton runat="server" Text="<i class='fa-solid fa-trash ps-2'></i>"  OnClick="eliminar_Click" CommandArgument='<%# Eval("idUsuario") %>'/>
                            <asp:LinkButton runat="server" Text="<i class='fa-solid fa-eye ps-2'></i>"  OnClick="mostrar_Click" CommandArgument='<%# Eval("idUsuario") %>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
