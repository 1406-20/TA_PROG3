<%@ Page Title="" Language="C#" MasterPageFile="~/EduprogAlumnos.Master" AutoEventWireup="true" CodeBehind="mi_salon.aspx.cs" Inherits="Eduprog.mi_salon" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
    Mi Salon - Alumnos
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
    <script>
        function buscarAlumno() {
            var inputText = document.getElementById('<%= txtNombre.ClientID %>').value.toLowerCase();
            var grid = document.getElementById('<%= lstMiSalon.ClientID %>');
            var resultadosLabel = document.getElementById('<%= lblResultados.ClientID %>');

            var resultados = 0;

            for (var i = 1; i < grid.rows.length; i++) {
                var row = grid.rows[i];
                var apellidoPaterno = row.cells[0].innerText.toLowerCase();
                var apellidoMaterno = row.cells[1].innerText.toLowerCase();
                var nombres = row.cells[2].innerText.toLowerCase();

                if (apellidoPaterno.includes(inputText) || apellidoMaterno.includes(inputText) || nombres.includes(inputText)) {
                    row.style.display = '';
                    resultados++;
                } else {
                    row.style.display = 'none';
                }
            }

            resultadosLabel.innerText = resultados.toString(); // Actualizar el número de resultados
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <div class="contaier row">
        <div class="col-sm-8">
            <div class="card" style="height:auto">
                <div class="row">
                    <div  class="col-sm-3" style="margin-left:1rem; margin-top:1rem; margin-bottom:1rem" >
                        <img id="fotoProfesor" runat="server" src="../Imágenes/profesor.png" width="120" />
                    </div>
                    <div class="row col-sm-9">
                        <div class="d-flex" style="margin-top:auto">
                            
                            <h3><asp:Label ID="lblNombreTutor" runat="server" Text=""></asp:Label> - Tutor(a)</h3>
                        </div>
                        <hr />
                        <div>
                            <i>
                                <svg xmlns="http://www.w3.org/2000/svg" width="18" height="14" viewBox="0 0 18 14" fill="none">
                                    <path d="M2.33317 13.6666C1.87484 13.6666 1.48262 13.5036 1.1565 13.1775C0.830393 12.8514 0.667059 12.4589 0.666504 12V1.99998C0.666504 1.54165 0.829837 1.14942 1.1565 0.823313C1.48317 0.497202 1.87539 0.333869 2.33317 0.333313H15.6665C16.1248 0.333313 16.5173 0.496646 16.844 0.823313C17.1707 1.14998 17.3337 1.5422 17.3332 1.99998V12C17.3332 12.4583 17.1701 12.8508 16.844 13.1775C16.5179 13.5041 16.1254 13.6672 15.6665 13.6666H2.33317ZM8.99984 7.83331L15.6665 3.66665V1.99998L8.99984 6.16665L2.33317 1.99998V3.66665L8.99984 7.83331Z" fill="black" />
                                </svg>
                            </i>
                            <asp:Label ID="lblCorreoTutor" runat="server" Text=""></asp:Label>                            
                        </div>
                    </div>
                </div>
            </div>
            <div style="margin-top: 30px">
                <h5>Reporte de estudiantes</h5>
                <h5><asp:Label ID="lblResultados" runat="server" Text=""></asp:Label> resultados</h5>
            </div>
        </div>
        <div class="col-sm-4">
            <div class="container row">
                <div class="card col-sm-6 d-flex" style="height:160px; justify-content:center">
                    <div class="card-body d-flex" style="justify-content:center; flex-direction:column">
                        <h3 style="text-align:center">
                            <asp:Label ID="lblAula" runat="server" Text=""></asp:Label>
                            <br />Añitos</h3>
                    </div>
                </div>
                <div class="card col-sm-6 d-flex" style="justify-content:center; flex-direction:column">
                    <div class="d-flex" style="justify-content:center">
                        <img src="../Imágenes/conejo.png" width="60"/>                        
                    </div>
                    <div>
                        <h5 style="text-align:center">
                            <asp:Label ID="lblSeccion" runat="server" Text=""></asp:Label>
                        </h5>
                    </div>
                </div>
            </div>
            <div class="card-body" style="margin-top:50px">
                <div class="row d-flex">
                    <div class="col-sm-3 mb-4">
                        <asp:Label ID="lblNombre" runat="server" Text="Alumno: " CssClass="col-sm-2 col-form-label" />
                    </div>
                    <div class="col-sm-6">
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" />
                    </div>
                    <div class="col-sm-3">
                        <a class="btn btn-primary align-content-end" role="button" onclick="buscarAlumno()">Buscar</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container" style="margin-top:20px">        
        <asp:GridView ID="lstMiSalon" runat="server" AutoGenerateColumns="False" CssClass="minimal-gridview" Width="900px" OnDataBound="lstMiSalon_DataBound" >
            <Columns>
                <asp:BoundField DataField="apellidoPaterno" HeaderText="Apellido Paterno" />
                <asp:BoundField DataField="apellidoMaterno" HeaderText="Apellido Materno" />
                <asp:BoundField DataField="nombre" HeaderText="Nombre"/>
                <asp:BoundField DataField="CorreoElectronico" HeaderText="correoElectronico" ItemStyle-Width="300px"/>
            </Columns>
        </asp:GridView>
    </div>
</asp:Content>
