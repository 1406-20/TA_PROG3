<%@ Page Title="" Language="C#" MasterPageFile="~/EduprogAdmin.Master" AutoEventWireup="true" CodeBehind="addCurso.aspx.cs" Inherits="Eduprog.addCurso" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
<div class="container">
    <div class="card">
        <div class="card-header titulo">
            <asp:Label id="tituloAddCurso" runat="server" Text="Registrar Curso"/>
        </div>
        <div class="card-body">
            <div class="mb-3 row">
                <asp:Label ID="lblNombre" runat="server" Text="Nombre:" CssClass="col-sm-2 col-form-label"/>
                <div class="col-sm-8">
                    <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"/>
                </div>
            </div>
            <div class="mb-3 row">
                <asp:Label ID="lblDesc" runat="server" Text="Descripción:" CssClass="col-sm-2 col-form-label"/>
                <div class="col-sm-8">
                    <asp:TextBox ID="txtDesc" runat="server" CssClass="form-control"/>
                </div>
            </div>
        </div>
        <div class="card-footer clearfix">
            <asp:Button ID="btnRegresar" runat="server" Text="Regresar" 
                CssClass="float-start btn btn-secondary" OnClick="btnRegresar_Click"/>
            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" 
                CssClass="float-end btn btn-primary" OnClick="btnGuardar_Click"/>
        </div>
    </div>
</div>
</asp:Content>
