<%@ Page Title="" Language="C#" MasterPageFile="~/EduprogAdmin.Master" AutoEventWireup="true" CodeBehind="adminPublicaciones.aspx.cs" Inherits="Eduprog.adminPublicaciones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
    <script src="../Scripts/addSalon.js"></script>
    <script src="../Scripts/gestionarUsuariosAdmin.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
   <div class="container">
       
       <asp:LinkButton ID="lbRegistrarPublicacion" runat="server" CssClass="btn btn-success mb-3" Text="<i class='fa-solid fa-plus pe-2'></i> Nueva Publicación" OnClick="registrarPublica_Click"/>
        <%--<a class="btn btn-success mb-3" href="javascript:__doPostBack('ctl00$cphContenido$ctl00','')"><i class="fa-solid fa-trash ps-2"></i></a>--%>
<%--            <ItemTemplate>
                <div class="post">
                    <div class="card rounded mb-4">
                        <div class="card-header container-fluid bg-primary-subtle">
                            <div class="container" style="display: flex; align-items: flex-start; justify-content: space-between;">
                                <h3><%# Eval("idPublicacion") %>. <%# Eval("titulo") %></h3>
                                <asp:LinkButton ID="lbBorrarPublicacion" runat="server" CssClass="btn btn-success align-items-center" 
                                    Text="<i class='fa-solid fa-trash ps-2'></i>" OnClick="borrarPublica_Click" CommandArgument='<%# Eval("idPublicacion") %>' />
                                
                            </div>
                        </div>

                        <div class="card-body container-fluid bg-secondary-subtle">
                            <div class="d-flex justify-content-center">
                             </div>
                            <hr />
                            <p class="fw-bold">Estimado padre de familia:</p>
                            <p>
                                <%# Eval("descripcion") %>
                            </p>
                        </div>

                        <div class="card-footer container-fluid bg-primary-subtle">
                            <div class="row align-items-center">
                                <div class="d-flex justify-content-center">
                                    <img src='<%# Eval("fotoDescripcion") %>'' width="150" class="text-center" />
                                </div>
                                <div class="col">
                                    <p><strong>Nombre</strong></p>
                                    <p class="mt-0">Velarde Desposorio, Tommy</p>
                                    <p class="mt-0"><i class="far fa-calendar-alt"></i> Martes 07 de mayo de 2024 a las 2:17pm</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>--%>      
        <asp:Panel ID="pnlPublicaciones" runat="server">
        </asp:Panel>
            
     </div>
</asp:Content>

