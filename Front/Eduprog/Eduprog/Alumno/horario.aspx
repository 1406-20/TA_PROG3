<%@ Page Title="" Language="C#" MasterPageFile="~/EduprogAlumnos.Master" AutoEventWireup="true" CodeBehind="horario.aspx.cs" Inherits="Eduprog.Alumno.horario" %>
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
                <div style="width: auto; height: auto;" class="border d-flex justify-content-center align-items-center">
                    <!-- Contenido a centrar -->
                    <img id="fotoHorario" runat="server" src="../Imágenes/Bauhaus-Dessau_main_building.jpg"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
