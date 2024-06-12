<%@ Page Title="" Language="C#" MasterPageFile="~/EduprogDocente.Master" AutoEventWireup="true" CodeBehind="mis_notas.aspx.cs" Inherits="Eduprog.Docente.mis_notas" %>
<asp:Content ID="Content1" ContentPlaceHolderID="cphTitulo" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphScripts" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="cphContenido" runat="server">
    <div class="container-fluid">
        <div class="container row">
            <div class="col-sm-8">
                <div class="card">
                    <div class="row">
                        <div class="col-sm-3">
                            <img src="../Imágenes/nino.jpg" width="130" style="margin: 10px" />
                        </div>
                        <div class="row col-sm-9 d-flex" style="align-content: center;">
                            <div>
                                <h3>
                                    <asp:Label ID="lblNombre" runat="server" Text=""></asp:Label>

                                </h3>
                            </div>
                            <hr />
                            <div>
                                <h6>
                                    <asp:Label ID="lblAula" runat="server" Text=""></asp:Label>
                                    añitos - 
                                <asp:Label ID="lblSeccion" runat="server" Text=""></asp:Label>
                                </h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-4" style="margin-top: auto">
                <div class="row" style="margin-top: 1rem">
                    <div class="col-sm-4" style="text-align: end">
                        <h6>Aula</h6>
                    </div>
                    <div class="col-sm-8">
                        <select class="form-select form-select-sm" aria-label="Small select example">
                            <option selected>5 anios</option>
                            <option value="1">4 anios</option>
                            <option value="2">3 anios</option>
                        </select>
                    </div>
                </div>
                <div class="row" style="margin-top:1rem">
                    <div class="col-sm-4" style="text-align: end">
                        <h6>Seccion</h6>
                    </div>
                    <div class="col-sm-8">
                        <select class="form-select form-select-sm" aria-label="Small select example">
                            <option selected>Conejos rabiosos</option>
                            <option value="1">Osos</option>
                            <option value="2">Gatos</option>
                        </select>
                    </div>
                </div>
                <div class="row" style="margin-top:1rem">
                    <div class="col-sm-4" style="text-align: end">
                        <h6>Periodo</h6>
                    </div>
                    <div class="col-sm-8">
                        <select class="form-select form-select-sm" aria-label="Small select example">
                            <option selected>2024</option>
                            <option value="1">2023</option>
                            <option value="2">2022</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid d-flex" style="margin-top: 2rem">
            <%--<asp:GridView ID="gvNotas" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" CellPadding="4" ForeColor="#333333" GridLines="None" OnDataBound="gvNotas_DataBound">
                <Columns>
                    <asp:TemplateField HeaderText="Curso" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle">
                        <ItemTemplate>
                            <asp:Label ID="lblCurso" runat="server" Text='<%# Eval("Curso") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Criterios" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle">
                        <ItemTemplate>
                            <asp:Label ID="lblCriterios" runat="server" Text='<%# Eval("Criterios") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="1er Bimestre" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle" ControlStyle-Width="80px">
                        <ItemTemplate>
                            <asp:TextBox ID="txt1erBimestre" runat="server" Text='<%# Bind("1erBimestre") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="2do Bimestre" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle" ControlStyle-Width="80px">
                        <ItemTemplate>
                            <asp:TextBox ID="txt2doBimestre" runat="server" Text='<%# Bind("2doBimestre") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="3er Bimestre" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle" ControlStyle-Width="80px">
                        <ItemTemplate>
                            <asp:TextBox ID="txt3erBimestre" runat="server" Text='<%# Bind("3erBimestre") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="4to Bimestre" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle" ControlStyle-Width="80px">
                        <ItemTemplate>
                            <asp:TextBox ID="txt4toBimestre" runat="server" Text='<%# Bind("4toBimestre") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>--%>

            <%--<asp:GridView ID="gvNotas" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" CellPadding="4" ForeColor="#333333" GridLines="None" OnDataBound="gvNotas_DataBound">
                <Columns>
                    <asp:TemplateField HeaderText="Curso" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle">
                        <ItemTemplate>
                            <asp:Label ID="lblCurso" runat="server" Text='<%# Eval("Curso") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Criterios" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle">
                        <ItemTemplate>
                            <asp:Label ID="lblCriterios" runat="server" Text='<%# Eval("Criterios") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="1er Bimestre" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle" ControlStyle-Width="80px">
                        <ItemTemplate>
                            <asp:TextBox ID="txt1erBimestre" runat="server" Text='<%# Bind("1erBimestre") %>' Enabled="false"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    
                    <asp:TemplateField HeaderText="Editar" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle">
                        <ItemTemplate>
                            <asp:Button ID="btnEditar" runat="server" Text="Editar" CommandName="Editar" CommandArgument='<%# Container.DataItemIndex %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Guardar" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle">
                        <ItemTemplate>
                            <asp:Button ID="btnGuardar" runat="server" Text="Guardar" CommandName="Guardar" CommandArgument='<%# Container.DataItemIndex %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>--%>
            <asp:GridView ID="gvNotas" runat="server" AutoGenerateColumns="False" CssClass="table table-striped table-bordered" CellPadding="4" ForeColor="#333333" GridLines="None" OnDataBound="gvNotas_DataBound">
                <Columns>
                    <asp:BoundField DataField="Curso" HeaderText="Curso" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle" />
                    <asp:BoundField DataField="Criterios" HeaderText="Criterios" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle" />
                    <%--<asp:BoundField DataField="1erBimestre" HeaderText="1er Bimestre" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle" />--%>

                    <asp:TemplateField HeaderText="1er Bimestre" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle">
                        <HeaderTemplate>
                            <asp:LinkButton ID="lnkEdit1erBimestre" runat="server" CommandName="Edit1erBimestre" Text="1er Bimestre" OnClick="lnkEdit1erBimestre_Click" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl1erBimestre" runat="server" Text='<%# Bind("1erBimestre") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="1er Bimestre" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle">
                        <HeaderTemplate>
                            <asp:LinkButton ID="lnkEdit2doBimestre" runat="server" CommandName="Edit2doBimestre" Text="2do Bimestre" OnClick="lnkEdit2doBimestre_Click" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl1erBimestre" runat="server" Text='<%# Bind("2doBimestre") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="1er Bimestre" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle">
                        <HeaderTemplate>
                            <asp:LinkButton ID="lnkEdit3erBimestre" runat="server" CommandName="Edit3erBimestre" Text="3er Bimestre" OnClick="lnkEdit3erBimestre_Click" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl1erBimestre" runat="server" Text='<%# Bind("3erBimestre") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="1er Bimestre" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle">
                        <HeaderTemplate>
                            <asp:LinkButton ID="lnkEdit4toBimestre" runat="server" CommandName="Edit5toBimestre" Text="4to Bimestre" OnClick="lnkEdit4toBimestre_Click" />
                        </HeaderTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lbl1erBimestre" runat="server" Text='<%# Bind("4toBimestre") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <%--<asp:BoundField DataField="2doBimestre" HeaderText="2do Bimestre" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle" />
                    <asp:BoundField DataField="3erBimestre" HeaderText="3er Bimestre" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle" />
                    <asp:BoundField DataField="4toBimestre" HeaderText="4to Bimestre" ItemStyle-VerticalAlign="Middle" HeaderStyle-VerticalAlign="Middle" />--%>
                </Columns>
            </asp:GridView>

            
        </div>
    </div>
</asp:Content>
