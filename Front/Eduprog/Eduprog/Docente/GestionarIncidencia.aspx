<%@ Page Title="" Language="C#" MasterPageFile="~/EduprogDocente.Master" AutoEventWireup="true" CodeBehind="GestionarIncidencia.aspx.cs" Inherits="Eduprog.Docente.GestionarIncidencia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
    <script src="../Scripts/incidencia.js"></script>
    <script>
        function mostrarModalCancelar() {
            $('#modalCancelar').modal('show');
        }
    </script>    
    <script>
        function mostrarMensajeExito() {
            //$('#modalExito').modal('show');
            alert("La incidencia se ha insertado correctamente.");
            window.location.href = "incidencias.aspx"; // Redirecciona a la página de incidencias
        }
    </script>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">  
    <asp:ScriptManager runat="server"></asp:ScriptManager>
    <div class="flex-fill">
        <h1>Incidencias</h1>
        <hr />
        <div class="container row" style="justify-content: end">
            <div class="col-md-2" style="margin: auto">
                <asp:Button class="btn btn-danger" runat="server" ID="btnCancelarInsercion" Text="Cancelar" OnClientClick="mostrarModalCancelar(); return false;"></asp:Button>
            </div>
            <div class="col-md-4">
                <asp:Button class="btn btn-success" runat="server" ID="btnInsertarIncidencia" Text="Insertar Incidencia" OnClick="btnInsertarIncidencia_Click"></asp:Button>
            </div>
        </div>
        <div class="card" style="margin-top: 1rem">
            <div class="card-body">
                <div class=" row">
                    <asp:Label ID="lblAlumnoInc" runat="server" Text="Alumno:" CssClass="col-sm-2 col-form-label" />
                    <div class="col-sm-4 d-flex align-items-center">
                        <asp:TextBox ID="TextBox5" runat="server" CssClass="form-control"  Enabled="true" />
                        <asp:LinkButton ID="lbBuscarAlumno" runat="server" CssClass="btn btn-info ml-2" Text="Buscar" OnClientClick="showModalFormAlumno(event);"/>
                    </div>

                </div>
                <div class="mb-3 row">
                    <asp:Label ID="Label2" runat="server" Text="Tipo de incidencia:" CssClass="col-sm-2 col-form-label" />
                    <div class="col-sm-8 row">
                        <div class="form-check col-sm-3" style="margin-left:10px">
                            <input class="form-check-input" type="radio" id="rbAtencionMedica" name="tipoIncidencia" value="AtencionMedica" runat="server" OnClick="hideAll(); show('camposAtencionMedica');"/>
                            <label class="form-check-label" for="rbAtencionMedica" runat="server">
                                Atención Médica
                            </label>
                        </div>
                        <div class="form-check col-sm-3">
                            <input class="form-check-input" type="radio" id="rbMerito" name="tipoIncidencia" value="Merito" runat="server" OnClick="hideAll();"/>
                            <label class="form-check-label" for="rbMerito" runat="server">
                                Mérito
                            </label>
                        </div>
                        <div class="form-check col-sm-3">
                            <input class="form-check-input" type="radio" id="rbDemerito" name="tipoIncidencia" value="Demerito" runat="server" OnClick="hideAll();"/>
                            <label class="form-check-label" for="rbDemerito" runat="server">
                                Demérito
                            </label>
                        </div>
                    </div>
                </div>

                <div class="mb-3 row">
                    <asp:Label ID="lblFechaIncidencia" runat="server" Text="Fecha y hora:" CssClass="col-sm-2 col-form-label" />
                    <div class="col-sm-8">dtpFechaNacimiento
                        <asp:TextBox ID="dtpFechaNacimiento" runat="server" CssClass="form-control" type="date" Width="150px" />
                    </div>
                </div>
                <div id="camposAtencionMedica" style="display: none">
                    <div class="mb-3 row">
                        <asp:Label ID="lblDiagnostico" runat="server" Text="Diagnostico:" CssClass="col-sm-2 col-form-label"/>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtDianostico" runat="server" CssClass="form-control" Text="" Enabled="true"/>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <asp:Label ID="lblTratamiento" runat="server" Text="Tratamiento:" CssClass="col-sm-2 col-form-label"/>
                        <div class="col-sm-4">
                            <asp:TextBox ID="txtTratamiento" runat="server" CssClass="form-control" Text="" Enabled="true"/>
                        </div>
                    </div>
                </div>
                <div class="mb-3 row">
                    <label for="comAdicional" class="col-sm-2 col-form-label" runat="server">Comentarios adicionales:</label>
                    <p></p>
                    <div class="col-sm-10">
                        <asp:TextBox ID="comAdicional" runat="server" CssClass="form-control form-control-lg" Placeholder="Escriba aquí..."></asp:TextBox>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!-- Modal de éxito al agregar incidencia -->
    <div class="modal fade" id="modalExito" tabindex="-1" role="dialog" aria-labelledby="modalExitoLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalExitoLabel">Éxito</h5>                    
                </div>
                <div class="modal-body">
                    Se ha agregado la incidencia exitosamente.               
                </div>
                <div class="modal-footer">
                    <a href="incidencias.aspx" class="btn btn-primary">Aceptar</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Modal de cancelar al agregar incidencia -->
    <div class="modal fade" id="modalCancelar" tabindex="-1" role="dialog" aria-labelledby="modalCancelarLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalCancelarLabel">Transacción Cancelada</h5>
                </div>
                <div class="modal-body">
                    No se ha agregado la incidencia.               
                </div>
                <div class="modal-footer">
                    <a href="incidencias.aspx" class="btn btn-primary">Aceptar</a>
                </div>
            </div>
        </div>
    </div>

















    <!-- Modal de alumno-->
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
                                                <asp:LinkButton class="btn btn-success" runat="server" Text="<i class='fa-solid fa-check ps-2'></i> Seleccionar" OnClick="btnSeleccionarAlumnoModal_Click" CommandArgument='<%# Eval("idAlumno") %>' OnClientClick="show('campoApoderado');"/>
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























</asp:Content>
