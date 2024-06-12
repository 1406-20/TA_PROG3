<%@ Page Title="" Language="C#" MasterPageFile="~/EduprogDocente.Master" AutoEventWireup="true" CodeBehind="cursos.aspx.cs" Inherits="Eduprog.Docente.cursos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <div class="container justify-content-center">
        <h1 class="listaCursos">Mis Cursos</h1>
        <hr />        
        <div class="container-fluid d-flex flex-wrap">
            <asp:Repeater ID="rptCursos" runat="server">
                <ItemTemplate>
                    <div class="col-lg-8 p-2">
                        <div class="card">
                            <div class="card-header"  style="text-align:center">
                                <h3 class="card-title"><%# Eval("NombreCurso") %></h3>
                            </div>
                            <div class="card-body">
                                <ul>
                                    <asp:Repeater ID="rptHorarios" runat="server" DataSource='<%# Eval("Horarios") %>'>
                                        <ItemTemplate>
                                            <li><%# Container.DataItem %></li>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                            <div class="card-footer"></div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>
</asp:Content>

