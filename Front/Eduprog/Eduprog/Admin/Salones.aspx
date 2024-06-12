<%@ Page Title="" Language="C#" MasterPageFile="~/EduprogAdmin.Master" AutoEventWireup="true" CodeBehind="Salones.aspx.cs" Inherits="EduprogAdmin.Salones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
        <div class="container">
        <div class="container" style="display: flex; align-items: flex-start; justify-content: space-between;">
            <h2>Listado de Aulas</h2>
            <asp:LinkButton ID="lbRegistrarAula" runat="server" CssClass="btn btn-success me-4" Text="<i class='fa-solid fa-plus pe-2'></i> Registrar Aula" OnClick="registrarSalon_Click"/>
        </div>
         <div class="container row">
            <div class="container" style="display: flex; justify-content: flex-end; margin-bottom: 15px">
                <asp:Label runat="server" Text="Buscar:" CssClass="col-form-label me-3"/>
                <div class="ms-0">
                    <asp:TextBox ID="txtSearchRoom" runat="server" CssClass="form-control" Width="200px" />
                </div>
            </div>
         </div>
        <div class="container row">
            <asp:GridView ID="gvSalones" runat="server"
                AllowPaging="true" PageSize="5"
                AutoGenerateColumns="false" CssClass="table table-hover table-responsive table-striped"
                OnPageIndexChanging="gvSalones_PageIndexChanging">
                <Columns>
                    <asp:TemplateField HeaderText="Nivel">
                        <ItemTemplate>
                            <%# ConvertirNivel(Eval("nivel")) %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Sección">
                        <ItemTemplate>
                            <%# ConvertirSeccion(Eval("seccion"), Eval("grado"))%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Tutor">
                        <ItemTemplate>
                            <%# obtenerNombreTutor(Eval("tutor"))%>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton runat="server" Text="<i class='fa-solid fa-edit ps-2'></i>" OnClick="modificarSalon_Click" CommandArgument='<%#Eval("idAula")%>'/>
                            <asp:LinkButton runat="server" Text="<i class='fa-solid fa-trash ps-2'></i>"  OnClick="eliminar_Click" CommandArgument='<%#Eval("nivel") + ";" + Eval("grado") + ";" + Eval("seccion")%>'/>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
  </div>
</asp:Content>
