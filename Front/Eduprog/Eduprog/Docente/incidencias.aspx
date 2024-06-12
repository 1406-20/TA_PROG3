<%@ Page Title="" Language="C#" MasterPageFile="~/EduprogDocente.Master" AutoEventWireup="true" CodeBehind="incidencias.aspx.cs" Inherits="Eduprog.Docente.incidencias" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
    <script src="../Scripts/incidencia.js"></script>
    <script>
        function abrirModal(idIncidencia, tipo, fechaHora, diagnostico, tratamiento, descripcion) {
            // Logging the received parameters to check the values
            console.log("idIncidencia:", idIncidencia);
            console.log("tipo:", tipo);
            console.log("fechaHora:", fechaHora);
            console.log("diagnostico:", diagnostico);
            console.log("tratamiento:", tratamiento);
            console.log("descripcion:", descripcion);

            var modal = $('#modalEditarIncidencia');
            var modalTitle = modal.find('.modal-title');
            var modalBody = modal.find('.modal-body');

            modalTitle.text('Editar ' + idIncidencia + ' ' + tipo);
            var contenidoModal = '';

            if (diagnostico === null || diagnostico === "null" || tratamiento === null || tratamiento === "null" || tipo === "A") {
                contenidoModal = '<p>Fecha y hora: ' + fechaHora + '</p>' +
                    '<p>Descripción: <input type="text" class="form-control" value="' + descripcion + '"></p>';
            } else {
                contenidoModal = '<p>Fecha y hora: ' + fechaHora + '</p>' +
                    '<p>Diagnóstico: <input type="text" class="form-control" value="' + diagnostico + '"></p>' +
                    '<p>Tratamiento: <input type="text" class="form-control" value="' + tratamiento + '"></p>' +
                    '<p>Descripción: <input type="text" class="form-control" value="' + descripcion + '"></p>';
            }

            modalBody.html(contenidoModal);
            $('#<%= hfIdIncidencia.ClientID %>').val(idIncidencia);
            modal.modal('show');

            return false;
        }
    </script>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <div>
        <h1>Incidencias</h1>
        <hr />
        <div class="container row">
            <div class="container-fluid d-flex col-md-3" style="align-items: center">
                <asp:Label ID="Label1" runat="server" Text="Ver desde:" />
                <input class="form-control" type="date" id="dtDesde" runat="server" style="max-width: 10rem; margin-left: 1rem" onchange="actualizarLista()">
            </div>
            <div class="container-fluid d-flex col-md-3" style="align-items: center">
                <asp:Label ID="txtHasta" runat="server" Text="Hasta:" />
                <input class="form-control" type="date" id="dtHasta" runat="server" style="max-width: 10rem; margin-left: 1rem" onchange="actualizarLista()">
            </div>
            <div class="container-fluid d-flex col-md-3" style="align-items: center">
                <asp:Button ID="btnVerIncidencias" runat="server" Text="Ver Incidencias" OnClick="btnVerIncidencias_Click" CssClass="btn btn-primary" />
            </div>
            <div class="container-fluid d-flex col-md-3" style="align-items: center; text-align:center">
                <a href="GestionarIncidencia.aspx" class="btn btn-primary" id="btnUsuario">
                    <div class="ps-3" style="justify-content: center; align-items: center; height: auto">
                        <i class="fas fa-user me-2"></i>Insertar incidencia                          
                    </div>
                </a>
            </div>
        </div>
    </div>
         
    <asp:Repeater ID="rptIncidencias" runat="server">
        <ItemTemplate>
            <div class="card rounded-4" style="margin-top: 20px; margin-bottom: 20px">
                <div class="card-header p-3">
                    <asp:LinkButton ID="lbEditarIncidencia" runat="server" CssClass="btn btn-primary" Text="Editar" OnClick="lbEditarIncidencia_Click"
                OnClientClick='<%# "return abrirModal(\"" + Eval("idIncidencia") + "\", \"" + Eval("tipo") + "\", \"" + Eval("fechaRegistro") + "\", " +
                (Eval("tipo").ToString() == "A" ? "\"" + ObtenerValorPropiedad(Container.DataItem, "diagnostico") + "\"" : "\"null\"") + ", " +
                (Eval("tipo").ToString() == "A" ? "\"" + ObtenerValorPropiedad(Container.DataItem, "tratamiento") + "\"" : "\"null\"") + ", \"" + Eval("descripcion") + "\")" %>' />

                </div>
                <div class="card-body">
                    <div class="mb-3 row">
                        <asp:Label ID="LabelAlumno" runat="server" Text="Alumno:" CssClass="col-sm-2 col-form-label" />
                        <div class="col-sm-8">
                            <asp:Label ID="LabelAlumnoIncidencia" runat="server" Text='<%# Eval("nombreAlumno") %>' CssClass="form-control bg-primary-subtle" Enabled="false" />
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <asp:Label ID="LabelTipo" runat="server" Text="Tipo de incidencia:" CssClass="col-sm-2 col-form-label" />
                        <div class="col-sm-8">
                            <asp:Label ID="LabelTipoValor" runat="server" Text='<%# Eval("tipo") %>' CssClass="form-control bg-primary-subtle" Enabled="false" />
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <asp:Label ID="LabelFechaHora" runat="server" Text="Fecha y hora:" CssClass="col-sm-2 col-form-label" />
                        <div class="col-sm-8">
                            <asp:Label ID="LabelFechaHoraValor" runat="server" Text='<%# Eval("fechaRegistro") %>' CssClass="form-control bg-primary-subtle" Enabled="false" />
                        </div>
                    </div>



                    <div class="mb-3 row" ID="divDiagnostico" runat="server" visible="false">
                        <asp:Label ID="Label4" runat="server" Text="Diagnostico:" CssClass="col-sm-2 col-form-label" />
                        <div class="col-sm-8">
                            <asp:Label ID="lblDiagnostico" runat="server" CssClass="form-control bg-primary-subtle" Enabled="false" />
                        </div>
                    </div>

                    <div class="mb-3 row" ID="divTratamiento" runat="server" visible="false">
                        <asp:Label ID="Label6" runat="server" Text="Tratamiento:" CssClass="col-sm-2 col-form-label" />
                        <div class="col-sm-8">
                            <asp:Label ID="lblTratamiento" runat="server" CssClass="form-control bg-primary-subtle" Enabled="false" />
                        </div>
                    </div>





                    <div class="mb-3 row">
                        <asp:Label ID="Label2" runat="server" Text="Descripcion:" CssClass="col-sm-2 col-form-label" />
                        <div class="col-sm-8">
                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("descripcion") %>' CssClass="form-control bg-primary-subtle" Enabled="false" />
                        </div>
                    </div>
                    
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <!-- Modal para editar incidencia -->
    <div class="modal fade" id="modalEditarIncidencia" tabindex="-1" role="dialog" aria-labelledby="modalEditarIncidenciaLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="modalEditarIncidenciaLabel">Editar Incidencia</h5>
                    <asp:HiddenField ID="hfIdIncidencia" runat="server" />
                    <asp:LinkButton ID="btnEliminar" runat="server" class="btn btn-danger" style="margin-left:auto" onclick="btnEliminar_Click">Eliminar</asp:LinkButton>
                </div>
                <div class="modal-body">
                    <!-- Aquí coloca los campos para editar la incidencia -->
                </div>
                <div class="modal-footer">
                    <asp:LinkButton ID="btnCancelar" runat="server" class="btn btn-secondary" data-dismiss="modal">Cancelar</asp:LinkButton>
                    <asp:LinkButton ID="btnGuardar" runat="server" class="btn btn-primary" OnClick="btnGuardar_Click">Guardar</asp:LinkButton>
                </div>
            </div>
        </div>
    </div>


</asp:Content>
