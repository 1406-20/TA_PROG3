<%@ Page Title="" Language="C#" MasterPageFile="~/EduprogAlumnos.Master" AutoEventWireup="true" CodeBehind="asistencia.aspx.cs" Inherits="Eduprog.Alumno.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <div class="card">
        <div class="card-header">
            <h4>Lista de Asistencia</h4>
        </div>
    <div class="card-body">
       <!--<div class="mb-3 row">
            <asp:Label ID="lblCurso" runat="server" Text="Curso:" CssClass="col-sm-2 col-form-label" />
            <div class="col-sm-8">
                <select class="form-select form-select-sm" aria-label="Small select example">
                    <option selected>Seleccione</option>
                    <option value="1">Comunicacion</option>
                    <option value="2">Matematica</option>
                    <option value="3">Personal Social</option>
                    <option value="3">Educacion Fisica</option>
                </select>
            </div>
        </div>-->
        <div class="mb-3 row">
            <asp:Label ID="lblBimestre" runat="server" Text="Bimestre:" CssClass="col-sm-2 col-form-label" />
            <div class="col-sm-8">
                <select class="form-select form-select-sm" aria-label="Small select example">
                    <option selected>Seleccione</option>
                    <option value="1">Bimestre 1</option>
                    <option value="2">Bimestre 2</option>
                    <option value="3">Bimestre 3</option>
                    <option value="3">Bimestre 4</option>
                </select>
            </div>
            <div>
                <asp:Button ID="btnListar" runat="server" Text="Listar" OnClick="btnListar_Click"/>
            </div>
            <div>
                <asp:GridView ID="gvAsistencia" runat="server">
                    <Columns>
                        <asp:BoundField HeaderText="Lunes" DataField="Asistencia"/>
                        <asp:BoundField HeaderText="Martes" />
                        <asp:BoundField HeaderText="Miercoles" />
                        <asp:BoundField HeaderText="Jueves" />
                        <asp:BoundField HeaderText="Viernes" />
                    </Columns>
                </asp:GridView>
            </div>
            

            
            <!--<div class="row">
                <div class="col">
                    <div class="collapse multi-collapse" id="multiCollapseExample1">
                        <div class="card card-body">
                            <table class="table text-center">
                                <thead>
                                    <tr>
                                        <th class="text-center" scope="col">Lunes</th>
                                        <th class="text-center" scope="col">Martes</th>
                                        <th class="text-center" scope="col">Miércoles</th>
                                        <th class="text-center" scope="col">Jueves</th>
                                        <th class="text-center" scope="col">Viernes</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                            <div class="card text-bg-success mb-3" style="max-width: 10rem;">
                                                <div class="card-header text-center">6/05/2024</div>
                                                <div class="card-body">
                                                    <h5 class="card-title text-center"><b>PRESENTE</b></h5>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="card text-bg-success mb-3" style="max-width: 10rem;">
                                                <div class="card-header text-center">7/05/2024</div>
                                                <div class="card-body">
                                                    <h5 class="card-title text-center"><b>PRESENTE</b></h5>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="card text-bg-success mb-3" style="max-width: 10rem;">
                                                <div class="card-header text-center">8/05/2024</div>
                                                <div class="card-body">
                                                    <h5 class="card-title text-center"><b>PRESENTE</b></h5>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="card text-bg-success mb-3" style="max-width: 10rem;">
                                                <div class="card-header text-center">9/05/2024</div>
                                                <div class="card-body">
                                                    <h5 class="card-title text-center"><b>PRESENTE</b></h5>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="card text-bg-success mb-3" style="max-width: 10rem;">
                                                <div class="card-header text-center">10/05/2024</div>
                                                <div class="card-body">
                                                    <h5 class="card-title text-center"><b>PRESENTE</b></h5>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="card text-bg-success mb-3" style="max-width: 10rem;">
                                                <div class="card-header text-center">13/05/2024</div>
                                                <div class="card-body">
                                                    <h5 class="card-title text-center"><b>PRESENTE</b></h5>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="card text-bg-success mb-3" style="max-width: 10rem;">
                                                <div class="card-header text-center">14/05/2024</div>
                                                <div class="card-body">
                                                    <h5 class="card-title text-center"><b>PRESENTE</b></h5>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="card text-bg-success mb-3" style="max-width: 10rem;">
                                                <div class="card-header text-center">15/05/2024</div>
                                                <div class="card-body">
                                                    <h5 class="card-title text-center"><b>PRESENTE</b></h5>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="card text-bg-success mb-3" style="max-width: 10rem;">
                                                <div class="card-header text-center">16/05/2024</div>
                                                <div class="card-body">
                                                    <h5 class="card-title text-center"><b>PRESENTE</b></h5>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="card text-bg-success mb-3" style="max-width: 10rem;">
                                                <div class="card-header text-center">17/05/2024</div>
                                                <div class="card-body">
                                                    <h5 class="card-title text-center"><b>PRESENTE</b></h5>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="card text-bg-danger mb-3" style="max-width: 10rem;">
                                                <div class="card-header text-center">20/05/2024</div>
                                                <div class="card-body">
                                                    <h5 class="card-title text-center"><b>FALTA</b></h5>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="card text-bg-success mb-3" style="max-width: 10rem;">
                                                <div class="card-header text-center">21/05/2024</div>
                                                <div class="card-body">
                                                    <h5 class="card-title text-center"><b>PRESENTE</b></h5>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="card text-bg-warning mb-3" style="max-width: 10rem;">
                                                <div class="card-header text-center">22/05/2024</div>
                                                <div class="card-body">
                                                    <h5 class="card-title text-center"><b>TARDANZA</b></h5>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="card text-bg-success mb-3" style="max-width: 10rem;">
                                                <div class="card-header text-center">23/05/2024</div>
                                                <div class="card-body">
                                                    <h5 class="card-title text-center"><b>PRESENTE</b></h5>
                                                </div>
                                            </div>  
                                        </td>
                                        <td>
                                            <div class="card text-bg-danger mb-3" style="max-width: 10rem;">
                                                <div class="card-header text-center">24/05/2024</div>
                                                <div class="card-body">
                                                    <h5 class="card-title text-center"><b>FALTA</b></h5>
                                                </div>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>-->
         </div>
        </div>
    </div>
</asp:Content>
