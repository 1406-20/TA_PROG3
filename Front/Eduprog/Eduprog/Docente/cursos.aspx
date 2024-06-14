<%@ Page Title="" Language="C#" MasterPageFile="~/EduprogDocente.Master" AutoEventWireup="true" CodeBehind="cursos.aspx.cs" Inherits="Eduprog.Docente.cursos" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <div class="container justify-content-center">
        <h1 class="listaCursos">Mis Cursos</h1>
        <hr/>        
        <div class="container-fluid d-flex flex-wrap" style="margin-top:1rem">
            
            <%--<asp:Repeater ID="rptCursos" runat="server">
                <ItemTemplate>
                    <div class="col-lg-8 p-2">
                        <div class="card text-white bg-info">
                            <div class="card-header" style="text-align: center">
                                <h3 class="card-title"><%# Eval("NombreCurso") %></h3>
                            </div>
                            <div class="card-body">
                                <ul>
                                    <asp:Repeater ID="rptHorarios" runat="server" DataSource='<%# Eval("Horarios") %>'>
                                        <ItemTemplate>
                                            <div class="d-flex justify-content-between">
                                                <div class="card bg-light border-3 card-left p-1" style="width:250px; margin-bottom:20px; text-align:center">
                                                    <h6>Inicio de la sesion<hr /></h6>
                                                    <%# Eval("StartTime") %>
                                                </div>
                                                <div class="card bg-light border-3 card-right p-1" style="width:250px; margin-bottom:20px; text-align:center">
                                                    <h6>Fin de la sesion<hr /></h6>
                                                    <%# Eval("EndTime") %>
                                                </div>
                                            </div>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </ul>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>--%>

            <asp:Repeater ID="rptCursos" runat="server" OnItemDataBound="rptCursos_ItemDataBound">
                <ItemTemplate>
                    <div class="p-2" style="width:50%">
                        <div class="card text-white bg-info">
                            <div class="card-header" style="text-align: center">
                                <h3 class="card-title"><%# Eval("NombreCurso") %></h3>
                            </div>
                            <div class="card-body">
                                <div id="carousel<%# Container.ItemIndex %>" class="carousel slide" data-ride="carousel" data-interval="false">
                                    <div class="carousel-inner">
                                        <asp:Repeater ID="rptHorarios" runat="server">
                                            <ItemTemplate>
                                                <div class="carousel-item <%# Container.ItemIndex == 0 ? "active" : "" %>">                                                    
                                                    <div class="d-flex justify-content-between">
                                                        <%--<div class="col-md-1"></div>--%>
                                                        <div class="card bg-light border-3 col-md-5 card-left p-1" style="width: 250px; margin-bottom: 20px; text-align: center">
                                                            <h6>Inicio de la sesión<hr />
                                                            </h6>
                                                            <%# Eval("StartTime") %>
                                                        </div>
                                                        <%--<div class="col-md-1"></div>--%>
                                                        <div class="card bg-light border-3 col-md-5 card-right p-1" style="width: 250px; margin-bottom: 20px; text-align: center">
                                                            <h6>Fin de la sesión<hr />
                                                            </h6>
                                                            <%# Eval("EndTime") %>
                                                        </div>
                                                        
                                                    </div>
                                                </div>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                    <a class="carousel-control-ant" href="#carousel<%# Container.ItemIndex %>" role="button" data-slide="prev">
                                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Previous</span>
                                    </a>
                                    <a class="carousel-control-sig" href="#carousel<%# Container.ItemIndex %>" role="button" data-slide="next">
                                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        <span class="sr-only">Next</span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>


        </div>
    </div>
</asp:Content>

