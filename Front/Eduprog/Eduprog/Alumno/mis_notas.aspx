<%@ Page Title="" Language="C#" MasterPageFile="~/EduprogAlumnos.Master" AutoEventWireup="true" CodeBehind="mis_notas.aspx.cs" Inherits="Eduprog.Alumno.mis_notas" %>
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
                                <h3>
                                    <asp:Label ID="lblNombre" runat="server" Text=""></asp:Label>

                                </h3>
                            </div>
                            <hr />
                            <div>
                                <h6>
                                    <asp:Label ID="lblAula" runat="server" Text=""></asp:Label>
                                    añitos - 
                                    <asp:Label ID="lblSeccion" runat="server" Text=""></asp:Label>
                                </h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <%--<div class="row col-sm-4" style="margin-top:auto">
                <div class="col-sm-4" style="text-align:end">
                    <h6>Periodo</h6>
                </div>
                <div class="col-sm-8">
                    <select class="form-select form-select-sm" aria-label="Small select example">
                        <option selected>2024</option>
                        <option value="1">2023</option>
                        <option value="2">2022</option>
                    </select>
                </div>
            </div>--%>
        </div>
        <div class="container" style="margin-top:30px">
            <asp:GridView ID="gvNotas" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" CellPadding="4" ForeColor="#333333" GridLines="None" OnDataBound="gvNotas_DataBound">
                <Columns>
                    <asp:BoundField DataField="Curso" HeaderText="Curso" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle" />
                    <asp:BoundField DataField="Criterio" HeaderText="Criterio" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle" />
                    <asp:BoundField DataField="PrimerBimestre" HeaderText="1er Bimestre" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle" />
                    <asp:BoundField DataField="SegundoBimestre" HeaderText="2do Bimestre" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle" />
                    <asp:BoundField DataField="TercerBimestre" HeaderText="3er Bimestre" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle" />
                    <asp:BoundField DataField="CuartoBimestre" HeaderText="4to Bimestre" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>
