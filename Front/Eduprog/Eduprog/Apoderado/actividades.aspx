<%@ Page Title="" Language="C#" MasterPageFile="~/EduprogApoderado.Master" AutoEventWireup="true" CodeBehind="actividades.aspx.cs" Inherits="Eduprog.Apoderado.actividades" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <div class="container-fluid">
    <div class="container row">
        <div class="col-sm-8">
            <div class="card">
                <div class="row">
                    <div class="col-sm-3">
                        <img src="../Imágenes/nino.jpg" width="130" style="margin: 10px" />
                    </div>
                    <div class="row col-sm-9 d-flex" style="align-content:center;">
                        <div>
                            <h3>Tommy Helmut Velarde Desposorio</h3>
                        </div>
                        <hr />
                        <div>
                            <h6>5 añitos - Conejitos</h6>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row col-sm-4" style="margin-top: auto">
            <div class="col-sm-4" style="text-align: end">
                <h6>Periodo</h6>
            </div>
            <div class="col-sm-8">
                <asp:DropDownList ID="ddlPeriodo" runat="server" Width="110">
                    <asp:ListItem Text="2024" Value="1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="2023" Value="2"></asp:ListItem>
                    <asp:ListItem Text="2022" Value="3"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
    </div>

    <div class="container d-flex" style="align-items:center;width:200px; margin-top:2rem">
        <div class="col-sm-4">
            <button type="button" class="btn btn-outline-primary d-flex" style="width:30px;height:30px;align-items:center; justify-content:center"><</button>
        </div>
        <div class="col-sm-4 d-flex">
            <h6>MAYO</h6>
        </div>
        <div class="col-sm-4">
            <button type="button" class="btn btn-outline-primary d-flex" style="width:30px;height:30px;align-items:center; justify-content:center">></button>
        </div>
    </div>

    <div class="container" style="margin-top:2rem; align-items:center">

        <div class="container">
            <div class="row">
                <div class="card col" style="height:600px; margin-right:1rem">
                    <h3 style="font-size:25px;text-align:center;padding-top:10px;">Lunes 6</h3>
                    <div class="card" style="margin-top:1rem">
                        <div class="card-body">
                            Actividad 1
                        </div>
                    </div>
                    <div class="card" style="margin-top:1rem">
                        <div class="card-body">
                            Actividad 2
                        </div>
                    </div>
                </div>
                <div class="card col" style="height:600px; margin-right:1rem">
                    <h3 style="font-size:25px;text-align:center;padding-top:10px;">Martes 7</h3>
                    <div class="card" style="margin-top:1rem">
                        <div class="card-body">
                            Actividad 3
                        </div>
                    </div>
                </div>
                <div class="card col" style="height:600px; margin-right:1rem">
                    <h3 style="font-size:25px;text-align:center;padding-top:10px;">Miércoles 8</h3>
                    <div class="card" style="margin-top:1rem">
                        <div class="card-body">
                            Actividad 4
                        </div>
                    </div>
                </div>
                <div class="card col" style="height:600px; margin-right:1rem">
                    <h3 style="font-size:25px;text-align:center;padding-top:10px;">Jueves 9</h3>
                    <div class="card" style="margin-top:1rem">
                        <div class="card-body">
                            Actividad 5
                        </div>
                    </div>
                </div>
                <div class="card col" style="height:600px; margin-right:1rem">
                    <h3 style="font-size:25px;text-align:center;padding-top:10px;">Viernes 10</h3>
                    <div class="card" style="margin-top:1rem">
                        <div class="card-body">
                            Actividad 6
                        </div>
                    </div>
                    <div class="card" style="margin-top:1rem">
                        <div class="card-body">
                            Actividad 7
                        </div>
                    </div>
                </div>
                <div class="card col" style="height:600px; margin-right:1rem">
                    <h3 style="font-size:25px;text-align:center;padding-top:10px;">Sábado 11</h3>
                    <div class="card" style="margin-top:1rem">
                        <div class="card-body">
                            Actividad 8
                        </div>
                    </div>
                </div>
                <div class="card col" style="height:600px; margin-right:1rem">
                    <h3 style="font-size:25px;text-align:center;padding-top:10px;">Domingo 12</h3>
                    <div class="card" style="margin-top:1rem">
                        <div class="card-body">
                            Actividad 9
                        </div>
                    </div>
                    <div class="card" style="margin-top:1rem">
                        <div class="card-body">
                            Actividad 10
                        </div>
                    </div>
                </div>
            </div>
        </div>


    </div>
</div>
</asp:Content>
