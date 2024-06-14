<%@ Page Title="" Language="C#" MasterPageFile="~/EduprogAlumnos.Master" AutoEventWireup="true" CodeBehind="actividades.aspx.cs" Inherits="Eduprog.Alumno.actividades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <link href="../Estilos/actividades.css" rel="stylesheet" type="text/css" />

    <div class="card">
        <div class="card-header">
            <h3><b>Lista de Actividades</b></h3>
        </div>
        <div class="card-body">
            <div class="container row">
                <div class="col-sm-8">
                    <div class="card">
                        <div class="row">
                            <div class="col-sm-3">
                                <img src="../Imágenes/nino.jpg" width="130" style="margin: 10px" />
                            </div>
                            <div class="row col-sm-9 d-flex" style="align-content:center;">
                                <div>
                                    <asp:Label ID="lblNombre" runat="server" Text="" style="font-size:2.0em; font-weight:bold;"></asp:Label>
                                </div>
                                <hr />
                                <div>
                                    <asp:Label ID="lblAula" runat="server" Text="" style="font-size:1.5em;"></asp:Label>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row col-sm-4" style="margin-top: auto">
                    <div class="col">
                        <asp:Calendar ID="CalActividades" runat="server" OnSelectionChanged="CalActividades_SelectionChanged">
                            <OtherMonthDayStyle ForeColor="LightGray" />
                            <TitleStyle BackColor="#1E5998" ForeColor="White" Font-Bold="True" />
                            <DayStyle BackColor="White" />
                            <SelectedDayStyle BackColor="LightSteelBlue" Font-Bold="True" ForeColor="#000000" Font-Underline="False" />
                        </asp:Calendar>
                    </div>
                </div>
            </div>
            <%-- Modificar Tabla para el calendario semanal --%>
            <asp:Table ID="tbActividades" runat="server" CssClass="table text-center">
                <asp:TableHeaderRow CssClass="card-header">
                    <asp:TableHeaderCell ID="tdLunesFecha">Lunes<hr></asp:TableHeaderCell>
                    <asp:TableHeaderCell ID="tdMartesFecha">Martes<hr></asp:TableHeaderCell>
                    <asp:TableHeaderCell ID="tdMiercolesFecha" >Miércoles<hr></asp:TableHeaderCell>
                    <asp:TableHeaderCell ID="tdJuevesFecha" >Jueves<hr></asp:TableHeaderCell>
                    <asp:TableHeaderCell ID="tdViernesFecha">Viernes<hr></asp:TableHeaderCell>
                </asp:TableHeaderRow>
                <asp:TableRow>
                    <asp:TableCell ID="tdLunes" runat="server"></asp:TableCell>
                    <asp:TableCell ID="tdMartes" runat="server"></asp:TableCell>
                    <asp:TableCell ID="tdMiercoles" runat="server"></asp:TableCell>
                    <asp:TableCell ID="tdJueves" runat="server"></asp:TableCell>
                    <asp:TableCell ID="tdViernes" runat="server"></asp:TableCell>
                </asp:TableRow>
            </asp:Table>
        </div>
</asp:Content>
