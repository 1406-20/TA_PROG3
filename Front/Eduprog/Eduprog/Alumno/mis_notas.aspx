<%@ Page Title="" Language="C#" MasterPageFile="~/EduprogAlumnos.Master" AutoEventWireup="true" CodeBehind="mis_notas.aspx.cs" Inherits="Eduprog.Alumno.mis_notas" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <div class="container-fluid">
        <div class="container row">            
            <div class="col-sm-8">
                <div class="card" style="height: auto">
                    <div class="row">
                        <div class="col-sm-3" style="margin-left: 1rem; margin-top: 1rem; margin-bottom: 1rem">
                            <img id="fotoAlumno" runat="server" src="../Imágenes/nino.jpg" width="120" />
                        </div>
                        <div class="row col-sm-9">
                            <div class="d-flex" style="margin-top: auto">
                                <h3>
                                    <asp:Label ID="lblNombreAlumno" runat="server" Text=""></asp:Label>
                                </h3>
                            </div>
                            <hr />
                            <div>
                                <i>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="18" height="14" viewBox="0 0 18 14" fill="none">
                                        <path d="M2.33317 13.6666C1.87484 13.6666 1.48262 13.5036 1.1565 13.1775C0.830393 12.8514 0.667059 12.4589 0.666504 12V1.99998C0.666504 1.54165 0.829837 1.14942 1.1565 0.823313C1.48317 0.497202 1.87539 0.333869 2.33317 0.333313H15.6665C16.1248 0.333313 16.5173 0.496646 16.844 0.823313C17.1707 1.14998 17.3337 1.5422 17.3332 1.99998V12C17.3332 12.4583 17.1701 12.8508 16.844 13.1775C16.5179 13.5041 16.1254 13.6672 15.6665 13.6666H2.33317ZM8.99984 7.83331L15.6665 3.66665V1.99998L8.99984 6.16665L2.33317 1.99998V3.66665L8.99984 7.83331Z" fill="black" />
                                    </svg>
                                </i>
                                <asp:Label ID="lblCorreoAlumno" runat="server" Text=""></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="container row">
                    <div class="card col-sm-6 d-flex" style="height: 160px; justify-content: center">
                        <div class="card-body d-flex" style="justify-content: center; flex-direction: column">
                            <h3 style="text-align: center">
                                <asp:Label ID="lblAula" runat="server" Text=""></asp:Label>
                                <br>
                                <asp:Label ID="lblNivel" runat="server" Text=""></asp:Label>
                            </h3>
                        </div>
                    </div>
                    <div class="card col-sm-6 d-flex" style="justify-content: center; flex-direction: column">
                        <div class="d-flex" style="justify-content: center">
                            <img id="fotoSeccion" src="../Imágenes/logo.png" width="60" />
                        </div>
                        <div>
                            <h5 style="text-align: center">
                                <asp:Label ID="lblSeccion" runat="server" Text=""></asp:Label>
                            </h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="container" style="margin-top: 30px">
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
