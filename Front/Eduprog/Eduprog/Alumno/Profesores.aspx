<%@ Page Title="" Language="C#" MasterPageFile="~/EduprogAlumnos.Master" AutoEventWireup="true" CodeBehind="Profesores.aspx.cs" Inherits="Eduprog.Profesores" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
   <%--<div class="container justify-content-center">
        <h1 class="encabezado">Nuestros profesores  </h1>
        <div id="profesoresContainer" class="container-fluid d-flex" style="text-align:center">
            <asp:Repeater ID="rptProfesores" runat="server">
                <ItemTemplate>
                    <div class="col-lg-4 p-2">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title"><%# Eval("nombre") %></h3>
                            </div>
                            <div class="card-body">
                                <div class="foto-profesor">
                                    <img src="../Imágenes/profesor.png" />
                                </div>                                
                                <p><span style="font-weight: bold;">Correo:</span> <span><%# Eval("correo") %></span> </p>
                            </div>
                            <div class="card-footer"></div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>--%>
    <div class="container">
        <h1 class="encabezado">Nuestros profesores</h1>
        <div class="row">
            <asp:Repeater ID="rptProfesores" runat="server">
                <ItemTemplate>
                    <div class="col-lg-4" style="text-align:center">
                        <div class="card mb-3">
                            <div class="card-header">
                                <h3 class="card-title"><%# Eval("nombre") %></h3>
                            </div>
                            <div class="card-body">
                                <div class="foto-profesor">
                                    <img runat="server" id="fotoProfesor" src="../Imágenes/profesor.png" />
                                </div>
                                <p><span style="font-weight: bold;">Correo:</span> <span><%# Eval("correoElectronico") %></span></p>
                            </div>
                            <div class="card-footer"></div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>
