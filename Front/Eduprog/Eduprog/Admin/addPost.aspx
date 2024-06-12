<%@ Page Title="" Language="C#" MasterPageFile="~/EduprogAdmin.Master" AutoEventWireup="true" CodeBehind="addPost.aspx.cs" Inherits="Eduprog.addPost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <div class="card-footer clearfix">
        <asp:Button ID="btnRegresar" runat="server" Text="Regresar"
            CssClass="float-start btn btn-secondary" OnClick="btnRegresar_Click" />
    </div>
    <div class="container">
        <div class="p-3">
            <div class="card rounded">
                <div class="card-header container-fluid bg-primary-subtle">
                    <div class="container" style="display: flex; align-items: flex-start; justify-content: space-between;">
                        <asp:TextBox ID="txtTítulo" runat="server" Font-Bold value="TITULO"></asp:TextBox>
                        <asp:LinkButton ID="lbPost" runat="server" CssClass="btn btn-success" Text="<i class='fa-solid fa-check pe-2'></i> Publicar" OnClick="btnPublicar_Click"/>
                    </div>
                </div>

                <div class="card-body container-fluid bg-secondary-subtle">

                    <div class="d-flex justify-content-center">
                        <asp:Image ID="imagenPost" runat="server" Height="250" CssClass="img-fluid img-thumbnail mb-2" ImageUrl="../Imágenes/logo.png" />
                    </div>
                    <div class="container" style="align-items: flex-start; justify-content: center;">
                        <asp:FileUpload ID="fileUploadFoto" CssClass="form-control mb-2" runat="server" />
                        <asp:Button ID="btnSubirFoto" CssClass="btn btn-primary" runat="server" Text="Cargar Foto" OnClick="btnSubirFoto_Click" />

                    </div>
                    <asp:TextBox ID="txtComunicado" runat="server" TextMode="MultiLine" Width="100%" Height="400px"></asp:TextBox>
                    <div class="d-flex justify-content-center">
                        <asp:Image ID="image1" runat="server" Height="250" CssClass="img-fluid img-thumbnail mb-2" ImageUrl="../Imágenes/logo.png" />
                    </div>
                    <div class="container" style="align-items: flex-start; justify-content: center;">
                        <asp:FileUpload ID="fileUploadDescripcion" CssClass="form-control mb-2" runat="server"/>
                        <asp:Button ID="btnSubirFotoDescripcion" CssClass="btn btn-primary" runat="server" Text="Cargar Foto" OnClick="btnSubirFotoDescripcion_Click" />

                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
