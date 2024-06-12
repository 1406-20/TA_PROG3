<%@ Page Title="" Language="C#" MasterPageFile="~/EduprogAdmin.Master" AutoEventWireup="true" CodeBehind="adminCursos.aspx.cs" Inherits="Eduprog.adminCursos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
        <div class="container">
        <div class="container" style="display: flex; align-items: flex-start; justify-content: space-between;">
            <h2>Listado de Cursos</h2>
            <asp:LinkButton ID="lbRegistrarCurso" runat="server" CssClass="btn btn-success  me-4" Text="<i class='fa-solid fa-plus pe-2'></i> Registrar Curso" OnClick="registrarCurso_Click"/>
        </div>
         <div class="container row">
            <div class="container" style="display: flex; justify-content: flex-end; margin-bottom: 15px">
                <asp:Label runat="server" Text="Buscar:" CssClass="col-form-label me-3"/>
                <div class="ms-0">
                    <asp:TextBox ID="txtSearchUser" runat="server" CssClass="form-control" Width="200px" OnTextChanged="filtrarCurso"/>
                </div>
            </div>
         </div>
      <div class="row">
        <asp:GridView ID="gvCursos" runat="server" AllowPaging="true" PageSize="5" AutoGenerateColumns="false" CssClass="table table-hover table-responsive table-striped"
            ShowHeaderWhenEmpty="true" OnPageIndexChanging="gvCursos_PageIndexChanging">
            <Columns>
                <asp:BoundField HeaderText="ID" DataField="idCurso"/>
                <asp:BoundField HeaderText="Nombre" DataField="nombreCurso"/>
                <asp:BoundField HeaderText="Descripcion" DataField="Descripcion"/>
                <asp:BoundField HeaderText="Fecha" DataField="fechaCreacion"/>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton runat="server" Text="<i class='fa-solid fa-pen-to-square'></i>" OnClick="btnEditarCurso_Click" CommandArgument='<%# Eval("idCurso") %>'/>
                        <asp:LinkButton runat="server" Text="<i class='fa-solid fa-trash'></i>" OnClick="btnEliminarCurso_Click" CommandArgument='<%# Eval("idCurso") %>'/>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
    </div>
  </div>
</asp:Content>
