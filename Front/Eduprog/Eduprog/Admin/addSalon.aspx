<%@ Page Title="" Language="C#" MasterPageFile="~/EduprogAdmin.Master" AutoEventWireup="true" CodeBehind="addSalon.aspx.cs" Inherits="EduprogAdmin.addSalon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
    <script src="../Scripts/addSalon.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <style>
        .titulo {
        }

            .titulo span {
                font-weight: 10;
                font-size: xx-large;
            }
    </style>
<asp:ScriptManager runat="server"></asp:ScriptManager>
    <div class="container">
        <updatepanel>
        <div class="card">
            <div class="card-header titulo">
                <asp:Label id="tituloAddSalon" runat="server" Text="Registrar Salón"/>
            </div>
            <div class="card-body">
                <div class="d-flex flex-row mt-4">
                    <div class="container">
                        <div class="mb-3 row">
                            <asp:Label ID="lblNivel" runat="server" Text="Nivel: " CssClass="col-sm-2 col-form-label" />
                            <asp:DropDownList ID="dlNivel" runat="server" Width="130px">
                                <asp:ListItem Text="Inicial" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Primaria" Value="2"></asp:ListItem>
                                <asp:ListItem Text="Secundaria" Value="3"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="mb-3 row">
                            <asp:Label ID="lblGrado" runat="server" Text="Grado: " CssClass="col-sm-2 col-form-label" />
                            <asp:DropDownList ID="dlGrado" runat="server" Width="60px">
                                <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                <asp:ListItem Text="6" Value="6"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div class="mb-3 row">
                            <asp:Label ID="lblSeccion" runat="server" Text="Sección: " CssClass="col-sm-2 col-form-label" />
                            <asp:DropDownList ID="dlSeccion" runat="server" Width="60px">
                                <asp:ListItem Text="A" Value="A"></asp:ListItem>
                                <asp:ListItem Text="B" Value="B"></asp:ListItem>
                                <asp:ListItem Text="C" Value="C"></asp:ListItem>
                                <asp:ListItem Text="D" Value="D"></asp:ListItem>
                                <asp:ListItem Text="E" Value="E"></asp:ListItem>
                                <asp:ListItem Text="F" Value="F"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <div id="campoTutor" class="mb-3 row" >
                            <asp:Label ID="lblTutor" runat="server" Text="Tutor:" CssClass="col-sm-2 col-form-label" />
                            <asp:TextBox ID="txtNombreTutor" runat="server" Enabled="false" CssClass="form-control" Width="200px" />
                            <div class="col-sm">
                                <asp:Button ID="lbBuscarTutor" runat="server"
                                    CssClass="btn btn-info" Text="Buscar" OnClick="btnBuscarTutor_Click" OnClientClick="showModalFormTutor(event);" />
                            </div>
                        </div>
                    </div>
                    <div class="d-flex flex-column justify-content-end me-5">
                        <asp:Image ID="imagenAula" runat="server" Height="175" CssClass="img-fluid img-thumbnail mb-2" ImageUrl="../Imágenes/logo.png" />
                        <div class="d-flex w-100">
                            <div class="mb-4 justify-content-start" style="flex: 1;">
                                <asp:FileUpload ID="fileUploadFoto" CssClass="form-control" runat="server" style="width: 80%" />
                            </div>
                            <div>
                                <asp:Button ID="btnSubirFoto" CssClass="btn btn-primary" runat="server" Text="Subir" OnClick="btnSubirFoto_Click" />
                            </div>
                    </div>
                </div>
                        </div>
                <div class="container mb-5 mt-4">
                    <asp:Label runat="server">Subir Horario:</asp:Label>
                    <asp:FileUpload ID="fileUploadHorario" CssClass="form-control mb-2 me-5" runat="server"/>
                    <asp:Button ID="btnSubirHorario" CssClass="btn btn-primary mb-2" runat="server" Text="Cargar Horario" OnClick="btnSubirHorario_Click" />
                </div>
                            <div class="card-body">
                <div class="row align-items-center pb-3">
                    <div class="col-auto">
                        <asp:Label ID="lblAlumno" CssClass="form-label" runat="server" Text="Alumno:"></asp:Label>
                    </div>
                    <div class="col-sm-4">
                        <asp:TextBox ID="txtNombreAlumno" CssClass="form-control" runat="server" Enabled="false"></asp:TextBox>
                    </div>
                </div>
                <div class="col-sm-2">
                    <asp:Button ID="lbBuscarAlumno" runat="server"
                        CssClass="btn btn-info" Text="Buscar" OnClientClick="showModalFormAlumno(event);" />
                </div>
                <div class="col text-end">
                    <asp:LinkButton ID="lbAgregarAlumno" runat="server"
                        CssClass="btn btn-success mb-2" Text="<i class='fa-solid fa-plus pe-2'></i> Agregar" OnClick="lbAgregarAlumno_Click"/>
                </div>
                <asp:Label runat="server" Text="Alumnos del salón:" Font-Size="Larger" Font-Bold="true"> </asp:Label>
                <br />
                <div class="row">
                    <asp:GridView ID="gvAlumnos" runat="server" AllowPaging="true" PageSize="5" AutoGenerateColumns="false" CssClass="table table-hover table-responsive table-striped"
                        ShowHeaderWhenEmpty="true">
                        <Columns>
                            <asp:BoundField HeaderText="ID" DataField="idAlumno" />
                            <asp:BoundField HeaderText="Nombre" DataField="nombre" />
                            <asp:BoundField HeaderText="Apellido Paterno" DataField="apellidoPaterno" />
                            <asp:BoundField HeaderText="Apellido Materno" DataField="apellidoMaterno" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" Text="<i class='fa-solid fa-trash'></i>" OnClick="btnEliminarAlumno_Click" CommandArgument='<%# Eval("idAlumno") %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
            <div class="card-footer clearfix">
                <asp:Button ID="btnRegresar" runat="server" Text="Regresar"
                    CssClass="float-start btn btn-secondary" OnClick="btnRegresar_Click" />
                <asp:Button ID="btnGuardar" runat="server" Text="Guardar"
                    CssClass="float-end btn btn-primary" OnClick="btnGuardar_Click" />
            </div>
            </div>
    </updatepanel>

            <div class="modal" id="form-modal-alumnos">
            <div class="modal-dialog modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Búsqueda de Alumno</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <asp:UpdatePanel runat="server">
                            <ContentTemplate>
                                <div class="container row pb-3 pt-3">
                                    <div class="row align-items-center">
                                        <div class="col-auto">
                                            <asp:Label CssClass="form-label" runat="server" Text="Ingresar nombre:"></asp:Label>
                                        </div>
                                        <div class="col-sm-3">
                                            <asp:TextBox CssClass="form-control" ID="txtNombreClienteModal" runat="server"></asp:TextBox>
                                        </div>
                                        <div class="col-sm-2">
                                            <asp:LinkButton ID="lbBuscarAlumnoAula" runat="server" CssClass="btn btn-info" Text="<i class='fa-solid fa-magnifying-glass pe-2'></i> Buscar" OnClick="btnBuscarAlumnoModal_Click"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="container row">
                                    <asp:GridView ID="gvAlumnosModal" runat="server" AllowPaging="true" PageSize="5" AutoGenerateColumns="false" CssClass="table table-hover table-responsive table-striped" OnPageIndexChanging="gvAlumnos_PageIndexChanging">
                                        <Columns>
                                            <asp:BoundField HeaderText="ID" DataField="idAlumno" />
                                            <asp:BoundField HeaderText="Nombre" DataField="nombre" />
                                            <asp:BoundField HeaderText="Apellido Paterno" DataField="apellidoPaterno" />
                                            <asp:BoundField HeaderText="Apellido Materno" DataField="apellidoMaterno" />
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <asp:LinkButton class="btn btn-success" runat="server" Text="<i class='fa-solid fa-check ps-2'></i> Seleccionar" OnClick="btnSeleccionarAlumnoModal_Click" CommandArgument='<%# Eval("idAlumno") %>'/>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>
                                </div>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </div>
        </div>




    <div class="modal" id="form-modal-docentes">
        <div class="modal-dialog modal-xl">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Búsqueda de Tutor</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <asp:UpdatePanel runat="server">
                        <ContentTemplate>
                            <div class="container row pb-3 pt-3">
                                <div class="row align-items-center">
                                    <div class="col-auto">
                                        <asp:Label CssClass="form-label" runat="server" Text="Ingresar nombre:"></asp:Label>
                                    </div>
                                    <div class="col-sm-3">
                                        <asp:TextBox CssClass="form-control" ID="txtNombreTutorModal" runat="server"></asp:TextBox>
                                    </div>
                                    <div class="col-sm-2">
                                        <asp:LinkButton ID="lbBuscar" runat="server" CssClass="btn btn-info" Text="<i class='fa-solid fa-magnifying-glass pe-2'></i> Buscar" OnClick="btnBuscarTutorModal_Click"/>
                                    </div>
                                </div>
                            </div>
                            <div class="container row">
                                <asp:GridView ID="gvDocentesModal" runat="server" AllowPaging="true" PageSize="5" AutoGenerateColumns="false" CssClass="table table-hover table-responsive table-striped" OnPageIndexChanging="gvDocentesModal_PageIndexChanging">
                                    <Columns>
                                        <asp:BoundField HeaderText="ID" DataField="idDocente" />
                                        <asp:BoundField HeaderText="Nombre" DataField="nombre" />
                                        <asp:BoundField HeaderText="Apellido Paterno" DataField="apellidoPaterno" />
                                        <asp:BoundField HeaderText="Apellido Materno" DataField="apellidoMaterno" />
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton class="btn btn-success" runat="server" Text="<i class='fa-solid fa-check ps-2'></i> Seleccionar" OnClick="btnSeleccionarTutorModal_Click" CommandArgument='<%# Eval("idDocente") %>' />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>
    </div>
</div>
</asp:Content>
