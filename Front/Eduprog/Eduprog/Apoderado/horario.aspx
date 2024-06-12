<%@ Page Title="" Language="C#" MasterPageFile="~/EduprogApoderado.Master" AutoEventWireup="true" CodeBehind="horario.aspx.cs" Inherits="Eduprog.Apoderado.horario" %>
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
                <div class="dropdown ps-3" style="margin-bottom:1rem; text-align:initial">
                    <asp:Label ID="fltGrado" runat="server" Text="Alumnos a cargo: "></asp:Label>
                    <asp:DropDownList ID="ddlAlumnos" runat="server" CssClass="btn btn-primary dropdown-toggle" AutoPostBack="true"
                        OnSelectedIndexChanged="ddlAlumnos_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
                <div style="width: auto; height: auto;" class="border d-flex justify-content-center align-items-center">
                    <img id="fotoHorario" runat="server" src="../Imágenes/Bauhaus-Dessau_main_building.jpg"/>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
