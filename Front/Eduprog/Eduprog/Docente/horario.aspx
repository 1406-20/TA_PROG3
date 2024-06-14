<%@ Page Title="" Language="C#" MasterPageFile="~/EduprogDocente.Master" AutoEventWireup="true" CodeBehind="horario.aspx.cs" Inherits="Eduprog.Docente.horario" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <h1>Horario</h1>
<hr />
<div class="container">
    <div>
        <div class="col-lg-10">
            <div style="width:140vh; height: 75vh;" class="border d-flex justify-content-center align-items-center">
                <!-- Contenido a centrar -->
                <img id="fotoHorario" src="../Imágenes/logo.png" class="w-100 h-100" runat="server"/>
            </div>
        </div>
    </div>
</div>
</asp:Content>
