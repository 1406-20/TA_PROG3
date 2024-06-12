<%@ Page Title="Gestionar Actividad" Language="C#" MasterPageFile="~/EduprogDocente.Master" AutoEventWireup="true" CodeBehind="GestionarActividad.aspx.cs" Inherits="Eduprog.Docente.GestionarActividad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
    <h1>Nueva Actividad</h1>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
    <!-- Incluye scripts aquí si es necesario -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <link href="../Estilos/actividades.css" rel="stylesheet" type="text/css" />

    <div class="container">
        <div class="card">
            <div class="card-header">
                <h5 class="card-title">Gestionar Actividad</h5>
            </div>
            <div class="card-body">
                <div class="form-group">
                    <asp:Label ID="lblCurso" runat="server" Text="Curso:" CssClass="form-label"></asp:Label>
                    <asp:DropDownList CssClass="form-control" ID="ddlCurso" runat="server"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblAula" runat="server" Text="Aula:" CssClass="form-label"></asp:Label>
                    <asp:DropDownList CssClass="form-control" ID="ddlAula" runat="server"></asp:DropDownList>
                </div>
                <div class="form-group">
                    <asp:Label ID="lblTipoActividad" runat="server" Text="Tipo de Actividad:" CssClass="form-label"></asp:Label>
                    <asp:DropDownList CssClass="form-control" ID="ddlTipoActividad" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlTipoActividad_SelectedIndexChanged">
                        <asp:ListItem Value="0" Text="Seleccione"></asp:ListItem>
                        <asp:ListItem Value="sesion" Text="Sesión"></asp:ListItem>
                        <asp:ListItem Value="reuniones" Text="Reunión"></asp:ListItem>
                        <asp:ListItem Value="tareas" Text="Tarea"></asp:ListItem>
                        <asp:ListItem Value="evaluaciones" Text="Evaluación"></asp:ListItem>
                    </asp:DropDownList>
                </div>

                <!-- Paneles de actividades específicas -->
                <asp:Panel ID="pnlSesion" runat="server" Visible="false" CssClass="form-group">
                    <asp:Label ID="lblFechaInicio" runat="server" Text="Fecha de Inicio:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtFechaInicio" runat="server" CssClass="form-control" TextMode="DateTimeLocal" />
                    <asp:Label ID="lblFechaFin" runat="server" Text="Fecha de Fin:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtFechaFin" runat="server" CssClass="form-control" TextMode="DateTimeLocal" />
                </asp:Panel>

                <asp:Panel ID="pnlReunion" runat="server" Visible="false" CssClass="form-group">
                    <asp:Label ID="lblLugar" runat="server" Text="Lugar:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtLugar" runat="server" CssClass="form-control" />
                    <asp:Label ID="lblAsunto" runat="server" Text="Asunto:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtAsunto" runat="server" CssClass="form-control" />
                    <asp:Label ID="lblDescripcion" runat="server" Text="Descripción:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtDescripcion" runat="server" CssClass="form-control" TextMode="MultiLine" />
                    <asp:Label ID="lblDuracionMinutos" runat="server" Text="Duración (minutos):" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtDuracionMinutos" runat="server" CssClass="form-control" />
                    <asp:Label ID="lblOrganizador" runat="server" Text="Organizador:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtOrganizador" runat="server" CssClass="form-control" />
                </asp:Panel>

                <asp:Panel ID="pnlTarea" runat="server" Visible="false" CssClass="form-group">
                    <asp:Label ID="lblDescpTarea" runat="server" Text="Descripción:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtDescpTarea" runat="server" CssClass="form-control" />
                    <asp:Label ID="lblTipoTarea" runat="server" Text="Tipo de Tarea:" CssClass="form-label"></asp:Label>
                    <asp:DropDownList CssClass="form-control" ID="ddlTipoTarea" runat="server">
                        <asp:ListItem Value="0" Text="Seleccione"></asp:ListItem>
                        <asp:ListItem Value="Desarrollar" Text="Desarrollar"></asp:ListItem>
                        <asp:ListItem Value="Completado" Text="Completado"></asp:ListItem>
                        <asp:ListItem Value="Solucionario" Text="Solucionario"></asp:ListItem>
                    </asp:DropDownList>
                </asp:Panel>

                <asp:Panel ID="pnlEvaluacion" runat="server" Visible="false" CssClass="form-group">
                    <asp:Label ID="lblTipoEvaluacion" runat="server" Text="Tipo de Evaluación:" CssClass="form-label"></asp:Label>
                    <asp:DropDownList CssClass="form-control" ID="ddlTipoEvaluacion" runat="server">
                        <asp:ListItem Value="0" Text="Seleccione"></asp:ListItem>
                        <asp:ListItem Value="Practica" Text="Práctica"></asp:ListItem>
                        <asp:ListItem Value="Examen" Text="Examen"></asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="lblPuntajeMax" runat="server" Text="Puntaje Máximo:" CssClass="form-label"></asp:Label>
                    <asp:TextBox ID="txtPuntajeMax" runat="server" CssClass="form-control" />
                </asp:Panel>

                <div class="text-right mt-3">
                    <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CssClass="btn btn-primary" OnClick="btnGuardar_Click" />
                    <asp:Button ID="btnCancelar" runat="server" Text="Cancelar" CssClass="btn btn-secondary" OnClick="btnCancelar_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>