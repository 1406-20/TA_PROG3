<%@ Page Title="" Language="C#" MasterPageFile="~/EduprogApoderado.Master" AutoEventWireup="true" CodeBehind="matricula.aspx.cs" Inherits="Eduprog.Apoderado.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <h1>Matricula 2025</h1>
<div class="card">
    <div class="card-header">
        <ul class="nav nav-pills mb-3" id="pills-tab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link active" id="pills-alumno-tab" data-bs-toggle="pill" data-bs-target="#alumno-tab-pane" type="button" role="tab" aria-controls="pills-alumno" aria-selected="true">Alumno</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="pills-familia-tab" data-bs-toggle="pill" data-bs-target="#familia-tab-pane" type="button" role="tab" aria-controls="pills-familia" aria-selected="false">Familia</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="pills-pago-tab" data-bs-toggle="pill" data-bs-target="#pago-tab-pane" type="button" role="tab" aria-controls="pills-pago" aria-selected="false">Pago</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link" id="pills-confirmacion-tab" data-bs-toggle="pill" data-bs-target="#confirmacion-tab-pane" type="button" role="tab" aria-controls="pills-confirmacion" aria-selected="false">Confirmacion</button>
            </li>
        </ul>
    </div>
    <div class="card-body">
        <div class="tab-content" id="pills-tabContent">
            <div class="tab-pane fade show active" id="alumno-tab-pane" role="tabpanel" aria-labelledby="#pills-alumno-tab" tabindex="0">
                <h5 class="card-title"> <b> Datos del alumno </b></h5>
                <p class="card-text">
                <div class="mb-3 row">
                    <asp:Label ID="lblDNIAlumno" runat="server" Text="DNI:" CssClass="col-sm-2 col-form-label" />
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtDNIAlumno" runat="server" CssClass="form-control" />
                    </div>
                </div>
                <div class="mb-3 row">
                    <asp:Label ID="lblNombreAlumno" runat="server" Text="Nombres:" CssClass="col-sm-2 col-form-label" />
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtNombreAlumno" runat="server" CssClass="form-control" />
                    </div>
                </div>
                <div class="mb-3 row">
                    <asp:Label ID="lblApellidoPaternoAlumno" runat="server" Text="Apellido Paterno:" CssClass="col-sm-2 col-form-label" />
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtApellidoPaternoAlumno" runat="server" CssClass="form-control" />
                    </div>
                </div>
                <div class="mb-3 row">
                    <asp:Label ID="lblApellidoMaternoAlumno" runat="server" Text="Apellido Materno:" CssClass="col-sm-2 col-form-label" />
                    <div class="col-sm-8">
                        <asp:TextBox ID="txtApellidoMaternoAlumno" runat="server" CssClass="form-control" />
                    </div>
                </div>
                <div class="mb-3 row">
                    <asp:Label ID="lblGeneroAlumno" runat="server" Text="Genero:" CssClass="col-sm-2 col-form-label" />
                    <div class="col-sm-8">
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" id="rbMasculinoA" runat="server" value="M">
                            <label class="form-check-label" for="rbMasculinoA" runat="server">Masculino</label>
                        </div>
                        <div class="form-check form-check-inline">
                            <input class="form-check-input" type="radio" id="rbFemeninoA" runat="server" value="F">
                            <label class="form-check-label" for="rbFemeninoA" runat="server">Femenino</label>
                        </div>
                    </div>
                </div>
                <div class="mb-3 row">
                    <asp:Label ID="lblFechaNacimientoAlumno" runat="server" Text="Fecha Nacimiento:" CssClass="col-sm-2 col-form-label" />
                    <div class="col-sm-8">
                        <input class="form-control" type="date" id="dtpFechaNacimientoAlumno" runat="server">
                    </div>
                </div>
                <div class="mb-3 row">
                    <asp:Label ID="lblGrado" runat="server" Text="Grado:" CssClass="col-sm-2 col-form-label" />
                    <div class="col-sm-8">
                        <select class="form-select form-select-sm" aria-label="Small select example">
                            <option selected>Escoge aula</option>
                            <option value="1">3 años</option>
                            <option value="2">4 años</option>
                            <option value="3">5 años</option>
                        </select>
                    </div>
                </div>
                </p>
                <!--<a href="#pills-familia-tab" class="float-end btn btn-primary">Siguiente</a>-->
            </div>
            <div class="tab-pane fade" id="familia-tab-pane" role="tabpanel" aria-labelledby="#pills-familia-tab" tabindex="0">
                <h5 class="card-title"> <b> Datos del Padre </b></h5>
                    <p class="card-text">
                    <div class="mb-3 row">
                        <asp:Label ID="lblDNIPF1" runat="server" Text="DNI:" CssClass="col-sm-2 col-form-label" />
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtDNIPF1" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <asp:Label ID="lblNombrePF1" runat="server" Text="Nombres:" CssClass="col-sm-2 col-form-label" />
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtNombrePF1" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <asp:Label ID="lblApellidoPaternoPF1" runat="server" Text="Apellido Paterno:" CssClass="col-sm-2 col-form-label" />
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtApellidoPaternoPF1" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <asp:Label ID="lblApellidoMaternoPF1" runat="server" Text="Apellido Materno:" CssClass="col-sm-2 col-form-label" />
                        <div class="col-sm-8">
                            <asp:TextBox ID="txtApellidoMaternoPF1" runat="server" CssClass="form-control" />
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <asp:Label ID="Label5" runat="server" Text="Genero:" CssClass="col-sm-2 col-form-label" />
                        <div class="col-sm-8">
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" id="rbMasculinoPF1" runat="server" value="M">
                                <label class="form-check-label" for="rbMasculinoPF1" runat="server">Masculino</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" id="rbFemeninoPF1" runat="server" value="F">
                                <label class="form-check-label" for="rbFemeninoPF1" runat="server">Femenino</label>
                            </div>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <asp:Label ID="lblFechaNacimientoPF1" runat="server" Text="Fecha Nacimiento:" CssClass="col-sm-2 col-form-label" />
                        <div class="col-sm-8">
                            <input class="form-control" type="date" id="dtpFechaNacimientoPF1" runat="server">
                        </div>
                    </div>
                </p>

                <h5 class="card-title"> <b> Datos de la Madre </b></h5>
                <p class="card-text">
    <div class="mb-3 row">
        <asp:Label ID="lblDNIPF2" runat="server" Text="DNI:" CssClass="col-sm-2 col-form-label" />
        <div class="col-sm-8">
            <asp:TextBox ID="txtDNIPF2" runat="server" CssClass="form-control" />
        </div>
    </div>
    <div class="mb-3 row">
        <asp:Label ID="lblNombrePF2" runat="server" Text="Nombres:" CssClass="col-sm-2 col-form-label" />
        <div class="col-sm-8">
            <asp:TextBox ID="txtNombrePF2" runat="server" CssClass="form-control" />
        </div>
    </div>
    <div class="mb-3 row">
        <asp:Label ID="lblApellidoPaternoPF2" runat="server" Text="Apellido Paterno:" CssClass="col-sm-2 col-form-label" />
        <div class="col-sm-8">
            <asp:TextBox ID="txtApellidoPaternoPF2" runat="server" CssClass="form-control" />
        </div>
    </div>
    <div class="mb-3 row">
        <asp:Label ID="lblApellidoMaternoPF2" runat="server" Text="Apellido Materno:" CssClass="col-sm-2 col-form-label" />
        <div class="col-sm-8">
            <asp:TextBox ID="txtApellidoMaternoPF2" runat="server" CssClass="form-control" />
        </div>
    </div>
    <div class="mb-3 row">
        <asp:Label ID="Label7" runat="server" Text="Genero:" CssClass="col-sm-2 col-form-label" />
        <div class="col-sm-8">
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" id="rbMasculinoPF2" runat="server" value="M">
                <label class="form-check-label" for="rbMasculinoPF2" runat="server">Masculino</label>
            </div>
            <div class="form-check form-check-inline">
                <input class="form-check-input" type="radio" id="rbFemeninoPF2" runat="server" value="F">
                <label class="form-check-label" for="rbFemeninoPF2" runat="server">Femenino</label>
            </div>
        </div>
    </div>
    <div class="mb-3 row">
        <asp:Label ID="lblFechaNacimientoPF2" runat="server" Text="Fecha Nacimiento:" CssClass="col-sm-2 col-form-label" />
        <div class="col-sm-8">
            <input class="form-control" type="date" id="dtpFechaNacimientoPF2" runat="server">
        </div>
    </div>
</p>

                <!--<a href="#" class="float-end btn btn-primary">Siguiente</a>-->
            </div>
            <div class="tab-pane fade" id="pago-tab-pane" role="tabpanel" aria-labelledby="pago-tab" tabindex="0">
                <div class="mb-3">
                    <label for="formFile" class="form-label">Ingrese comprobante de pago</label>
                    <input class="form-control" type="file" id="formFile">
                </div>

            </div>
           <div class="tab-pane fade" id="confirmacion-tab-pane" role="tabpanel" aria-labelledby="confirmacion-tab" tabindex="0">
               <h5>La matrícula se ha realizdo correctamente</h5>
           </div>
        </div>
    </div>
</div>
</asp:Content>
