<%@ Page Title="" Language="C#" MasterPageFile="~/EduprogAdmin.Master" AutoEventWireup="true" CodeBehind="addUser.aspx.cs" Inherits="Eduprog.addUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
    <script src="../Scripts/addSalon.js"></script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <div class="container">
        <updatepanel>
        <div class="card">
            <div class="card-header titulo">
                <asp:Label id="tituloAddUsuario" runat="server" Text="Registrar Usuario"/>
            </div>
            <div class="card-body">
                    <div class="mb-3 row">
                        <asp:Label ID="lblNombre" runat="server" Text="Nombre:" CssClass="col-sm-2 col-form-label" />
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <asp:Label ID="lblPaterno" runat="server" Text="Apellido Paterno:" CssClass="col-sm-2 col-form-label" />
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtPaterno" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <asp:Label ID="lblMaterno" runat="server" Text="Apellido Materno:" CssClass="col-sm-2 col-form-label" />
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtMaterno" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <asp:Label ID="lblCorreo" runat="server" Text="e-mail:" CssClass="col-sm-2 col-form-label" />
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtCorreo" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <asp:Label ID="lblTipoUser" runat="server" Text="Tipo de Usuario:" CssClass="col-sm-2 col-form-label" />
                        <div class="col-sm-8 mt-2" style="margin-bottom: 15px">
                            <div class="form-check form-check-inline">
                                <label class="form-check-label" runat="server">
                                    <input class="form-check-input" type="radio" id="rbAlumno" runat="server" value="Alumno" name="tipo" onclick="hideAll(); show('cphContenido_campoAlumno');">Alumno
                                </label>
                            </div>
                            <div class="form-check form-check-inline">
                                <label class="form-check-label" runat="server">
                                    <input class="form-check-input" type="radio" id="rbApoderado" runat="server" value="Apoderado" name="tipo" onclick="hideAll(); show('cphContenido_campoApoderado');">Apoderado
                                </label>
                            </div>
                            <div class="form-check form-check-inline">
                                <label class="form-check-label" runat="server">
                                    <input class="form-check-input" type="radio" id="rbDocente" runat="server" value="Docente" name="tipo" onclick="hideAll(); show('cphContenido_campoDocente');">Docente
                                </label>
                            </div>
                            <div class="form-check form-check-inline">
                                <label class="form-check-label" runat="server">
                                    <input class="form-check-input" type="radio" id="rbPersonal" runat="server" value="Personal" name="tipo" onclick="hideAll(); show('cphContenido_campoPersonal');">Personal
                                </label>
                            </div>
                            <div class="form-check form-check-inline">
                                <label class="form-check-label" runat="server">
                                    <input class="form-check-input" type="radio" id="rbAdministrador" runat="server" value="Administrador" name="tipo" onclick="hideAll(); show('cphContenido_campoAdministrador');">Administrador
                                </label>
                            </div>
                        </div>
                    
                    <div class="container" id="campoApoderado" runat="server" style="display: none">
                        <div class="mb-3 row">
                            <asp:Label ID="lblOcupacion" runat="server" Text="Ocupación:" CssClass="col-sm-2 col-form-label" />
                            <div class="col-sm-8">
                                <asp:TextBox ID="Ocupacion" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <asp:Label ID="lblTelf" runat="server" Text="Teléfono:" CssClass="col-sm-2 col-form-label" />
                            <div class="col-sm-8">
                                <asp:TextBox ID="Telefono" runat="server" CssClass="form-control" Columns="10" MaxLength="9" Width="125px" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <asp:Label ID="lblDirApoderado" runat="server" Text="Dirección:" CssClass="col-sm-2 col-form-label" />
                            <div class="col-sm-8">
                                <asp:TextBox ID="dirApoderado" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <asp:Label ID="lblRelacion" runat="server" Text="Relacion Alumnos:" CssClass="col-sm-2 col-form-label" />
                            <div class="col-sm-8">
                                <asp:DropDownList ID="Relacion" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="card-header bg-light">
                            <h5 class="card-title mb-0">Alumnos a cargo:</h5>
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
                                    CssClass="btn btn-info" Text="Buscar" OnClientClick="showModalFormAlumno(event); show('campoApoderado');"/>
                            </div>
                            <div class="col text-end">
                                <asp:LinkButton ID="lbAgregarAlumno" runat="server"
                                    CssClass="btn btn-success mb-2" Text="<i class='fa-solid fa-plus pe-2'></i> Agregar" OnClick="lbAgregarAlumno_Click" OnClientClick="show('campoApoderado');"/>
                            </div>
                            <div class="row">
                                <asp:GridView ID="gvAlumnos" runat="server" AllowPaging="true" PageSize="5" AutoGenerateColumns="false" CssClass="table table-hover table-responsive table-striped"
                                    ShowHeaderWhenEmpty="true">
                                    <Columns>
                                        <asp:BoundField HeaderText="ID" DataField="idAlumno"/>
                                        <asp:BoundField HeaderText="Nombre" DataField="nombre"/>
                                        <asp:BoundField HeaderText="Apellido Paterno" DataField="apellidoPaterno"/>
                                        <asp:BoundField HeaderText="Apellido Materno" DataField="apellidoMaterno"/>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" Text="<i class='fa-solid fa-trash'></i>" OnClick="btnEliminarAlumno_Click" CommandArgument='<%# Eval("idAlumno") %>'/>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                    <div class="container" id="campoAlumno" runat="server" style="display: none">
                        <div class="mb-3 row">
                            <asp:Label ID="lblNacimiento" runat="server" Text="Fecha de Nacimiento:" CssClass="col-sm-2 col-form-label" />
                            <div class="col-sm-8" style="margin-top: 12px">
                                <asp:TextBox ID="Nacimiento" runat="server" CssClass="form-control" type="date" Width="150px" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <asp:Label ID="lblGenero" runat="server" Text="Género:" CssClass="col-sm-2 col-form-label" />
                            <div class="col-sm-8 mt-2">
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" id="rdFemale" runat="server" value="Femenino" name="genero">
                                    <label class="form-check-label" for="rdFemale" runat="server">Femenino</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" id="rdMale" runat="server" value="Masculino" name="genero">
                                    <label class="form-check-label" for="rdMale" runat="server">Masculino</label>
                                </div>
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <asp:Label ID="lblDireccionAlum" runat="server" Text="Dirección:" CssClass="col-sm-2 col-form-label" />
                            <div class="col-sm-8">
                                <asp:TextBox ID="dirAlum" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                    <div class="container" id="campoDocente" runat="server" style="display: none">
                        <div class="mb-3 row">
                            <asp:Label ID="lblEspecialidad" runat="server" Text="Especialidad:" CssClass="col-sm-2 col-form-label" />
                            <div class="col-sm-8">
                                <asp:TextBox ID="Especialidad" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <asp:Label ID="lblTipoDocente" runat="server" Text="Tipo:" CssClass="col-sm-2 col-form-label" />
                            <div class="col-sm-8">
                                <asp:DropDownList ID="TipoDocente" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                        <asp:Label ID="Label5" runat="server" Text="Sueldo:" CssClass="col-sm-2 col-form-label" />
                            <div class="col-sm-8">
                                <asp:TextBox ID="SueldoDocente" runat="server" CssClass="form-control" type="number" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <asp:Label ID="Label6" runat="server" Text="Inicio de Contrato:" CssClass="col-sm-2 col-form-label" />
                            <div class="col-sm-8">
                                <asp:TextBox ID="ContratoDocente" runat="server" CssClass="form-control" type="date" Width="150px" />
                            </div>
                        </div>
                    </div>
                    <div class="container" id="campoPersonal" runat="server" style="display: none">
                        <div class="mb-3 row">
                            <asp:Label ID="lblSueldo" runat="server" Text="Sueldo:" CssClass="col-sm-2 col-form-label" />
                            <div class="col-sm-8">
                                <asp:TextBox ID="SueldoTrabajador" runat="server" CssClass="form-control" type="number" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <asp:Label ID="lblContrato" runat="server" Text="Inicio de Contrato:" CssClass="col-sm-2 col-form-label" />
                            <div class="col-sm-8">
                                <asp:TextBox ID="ContratoTrabajador" runat="server" CssClass="form-control" type="date" Width="150px" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <asp:Label ID="Label2" runat="server" Text="Cargo:" CssClass="col-sm-2 col-form-label" />
                            <div class="col-sm-8">
                                <asp:TextBox ID="CargoTrabajador" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <asp:Label ID="Label1" runat="server" Text="Tipo:" CssClass="col-sm-2 col-form-label" />
                            <div class="col-sm-8">
                                <asp:DropDownList ID="TipoTrabajador" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                    <div class="container" id="campoAdministrador" runat="server" style="display: none">
                        <div class="mb-3 row">
                            <asp:Label ID="Label3" runat="server" Text="Sueldo:" CssClass="col-sm-2 col-form-label" />
                            <div class="col-sm-8">
                                <asp:TextBox ID="SueldoAdmin" runat="server" CssClass="form-control" type="number" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <asp:Label ID="Label4" runat="server" Text="Inicio de Contrato:" CssClass="col-sm-2 col-form-label" />
                            <div class="col-sm-8">
                                <asp:TextBox ID="ContratoAdmin" runat="server" CssClass="form-control" type="date" Width="150px" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <asp:Label ID="lblCargo" runat="server" Text="Cargo:" CssClass="col-sm-2 col-form-label" />
                            <div class="col-sm-8">
                                <asp:TextBox ID="CargoAdmin" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                        <div class="mb-3 row">
                            <asp:Label ID="lblArea" runat="server" Text="Área:" CssClass="col-sm-2 col-form-label" />
                            <div class="col-sm-8">
                                <asp:TextBox ID="AreaAdmin" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                    <div class="card-footer clearfix">
                        <asp:Button ID="btnRegresar" runat="server" Text="Regresar"
                            CssClass="float-start btn btn-secondary" OnClick="btnRegresar_Click" />
                        <asp:Button ID="btnGuardar" runat="server" Text="Guardar"
                            CssClass="float-end btn btn-primary" OnClick="btnGuardar_Click" />
                    </div>
                </div>
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
                                            <asp:LinkButton ID="lbBuscar" runat="server" CssClass="btn btn-info" Text="<i class='fa-solid fa-magnifying-glass pe-2'></i> Buscar" OnClick="btnBuscarAlumnoModal_Click"/>
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
    </div>
</asp:Content>
