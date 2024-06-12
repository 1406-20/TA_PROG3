<%@ Page Title="" Language="C#" MasterPageFile="~/EduprogApoderado.Master" AutoEventWireup="true" CodeBehind="mis_notas.aspx.cs" Inherits="Eduprog.Apoderado.mis_notas" %>
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
                        <img src="../Imágenes/nino.jpg" width="130" style="margin:10px" />
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
        <%--<div class="row col-sm-4" style="margin-top:auto;display:none;">
            <div class="col-sm-4" style="text-align:end">
                <h6>Periodo</h6>
            </div>
            <div class="col-sm-8">
                <asp:DropDownList ID="ddlPeriodo" runat="server" Width="110">
                    <asp:ListItem Text="2024" Value="1" Selected="True"></asp:ListItem>
                    <asp:ListItem Text="2023" Value="2"></asp:ListItem>
                    <asp:ListItem Text="2022" Value="3"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>--%>
    </div>
    <div class="container" style="margin-top:30px">
        <table class="table table-striped table-bordered " style="text-align:center">
            <thead>
                <tr>
                    <th rowspan="4">Curso</th>
                    <th rowspan="4">Criterios</th>
                    <th rowspan="4">1er Bimestre</th>
                    <th rowspan="4">2do Bimestre</th>
                    <th rowspan="4">3er Bimestre</th>
                    <th rowspan="4">4to Bimestre</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td rowspan="4" style="vertical-align:middle; font-size:25px">Matemáticas</td>
                    <td>Comprension matematica</td>
                    <td>A</td>
                    <td>AD</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Resolviendo problemas</td>
                    <td>AD</td>
                    <td>B</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Situaciones diarias</td>
                    <td>B</td>
                    <td>A</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Aplicando sumas</td>
                    <td>B</td>
                    <td>AD</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td rowspan="4" style="vertical-align:middle; font-size:25px">Ciencias ambientales</td>
                    <td>Comprension matematica</td>
                    <td>A</td>
                    <td>AD</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Resolviendo problemas</td>
                    <td>AD</td>
                    <td>B</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Situaciones diarias</td>
                    <td>B</td>
                    <td>A</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Aplicando sumas</td>
                    <td>B</td>
                    <td>AD</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td rowspan="4" style="vertical-align:middle; font-size:25px"">Comunicacion</td>
                    <td>Comprension matematica</td>
                    <td>A</td>
                    <td>AD</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Resolviendo problemas</td>
                    <td>AD</td>
                    <td>B</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Situaciones diarias</td>
                    <td>B</td>
                    <td>A</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Aplicando sumas</td>
                    <td>B</td>
                    <td>AD</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td rowspan="4" style="vertical-align:middle; font-size:25px"">Artes plasticas</td>
                    <td>Comprension matematica</td>
                    <td>A</td>
                    <td>AD</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Resolviendo problemas</td>
                    <td>AD</td>
                    <td>B</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Situaciones diarias</td>
                    <td>B</td>
                    <td>A</td>
                    <td></td>
                    <td></td>
                </tr>
                <tr>
                    <td>Aplicando sumas</td>
                    <td>B</td>
                    <td>AD</td>
                    <td></td>
                    <td></td>
                </tr>
                <!-- Se agregan las demás filas para los otros cursos -->
            </tbody>
        </table>
    </div>
</div>
</asp:Content>
