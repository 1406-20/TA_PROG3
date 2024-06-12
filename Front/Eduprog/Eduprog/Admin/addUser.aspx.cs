using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using static System.Net.Mime.MediaTypeNames;

namespace Eduprog
{
    public partial class addUser : System.Web.UI.Page
    {
        private EduprogWSClient daoServicio;
        private BindingList<alumno> alumnos;
        private BindingList<alumno> alumnosACargo;
        protected void Page_Load(object sender, EventArgs e)
        {
            daoServicio = new EduprogWSClient();
            if (Session["modificarUsuario"] != null)
            {
                tituloAddUsuario.Text = "Modificar Usuario";
                foreach (var tipoRelacionAlumno in Enum.GetNames(typeof(relacionAlumno)))
                {
                    Relacion.Items.Add(new ListItem(tipoRelacionAlumno));
                }
                foreach (var tipoDocente in Enum.GetNames(typeof(tipoDocente)))
                {
                    TipoDocente.Items.Add(new ListItem(tipoDocente));
                }
                foreach (var tipoTrabajador in Enum.GetNames(typeof(tipoTrabajador)))
                {
                    TipoTrabajador.Items.Add(new ListItem(tipoTrabajador));
                }
                string modificarUsuario = (string)Session["modificarUsuario"];
                switch (modificarUsuario)
                {
                    case "alumno":
                        alumno alumno = (alumno)Session["usuarioAModificar"];
                        txtNombre.Attributes["placeholder"] = alumno.nombre;
                        txtPaterno.Attributes["placeholder"] = alumno.apellidoPaterno;
                        txtMaterno.Attributes["placeholder"] = alumno.apellidoMaterno;
                        txtCorreo.Attributes["placeholder"] = alumno.correoElectronico;
                        if (alumno.genero == 'M')
                        {
                            rdMale.Checked = true;
                        }
                        else
                        {
                            rdFemale.Checked = true;
                        }
                        dirAlum.Attributes["placeholder"] = alumno.direccion;
                        rbAlumno.Checked = true;
                        rbAlumno.Disabled = true;
                        rbApoderado.Disabled = true;
                        rbDocente.Disabled = true;
                        rbPersonal.Disabled = true;
                        rbAdministrador.Disabled = true;
                        campoAlumno.Attributes["style"] = "display:block";
                        break;
                    case "apoderado":
                        apoderado apoderado = (apoderado)Session["usuarioAModificar"];
                        txtNombre.Attributes["placeholder"] = apoderado.nombre;
                        txtPaterno.Attributes["placeholder"] = apoderado.apellidoPaterno;
                        txtMaterno.Attributes["placeholder"] = apoderado.apellidoMaterno;
                        txtCorreo.Attributes["placeholder"] = apoderado.correoElectronico;
                        Ocupacion.Attributes["placeholder"] = apoderado.ocupacion;
                        Telefono.Attributes["placeholder"] = apoderado.telefono.ToString();
                        dirApoderado.Attributes["placeholder"] = apoderado.direccion;
                        Relacion.SelectedValue = apoderado.relacionAlumno.ToString();
                        rbApoderado.Checked = true;
                        rbAlumno.Disabled = true;
                        rbApoderado.Disabled = true;
                        rbDocente.Disabled = true;
                        rbPersonal.Disabled = true;
                        rbAdministrador.Disabled = true;
                        campoApoderado.Attributes["style"] = "display:block";
                        break;
                    case "docente":
                        docente docente = (docente)Session["usuarioAModificar"];
                        txtNombre.Attributes["placeholder"] = docente.nombre;
                        txtPaterno.Attributes["placeholder"] = docente.apellidoPaterno;
                        txtMaterno.Attributes["placeholder"] = docente.apellidoMaterno;
                        txtCorreo.Attributes["placeholder"] = docente.correoElectronico;
                        Especialidad.Attributes["placeholder"] = docente.especialidad;
                        TipoDocente.SelectedValue = docente.tipoDocente.ToString();
                        SueldoDocente.Attributes["placeholder"] = docente.sueldo.ToString();
                        rbDocente.Checked = true;
                        rbAlumno.Disabled = true;
                        rbApoderado.Disabled = true;
                        rbDocente.Disabled = true;
                        rbPersonal.Disabled = true;
                        rbAdministrador.Disabled = true;
                        campoDocente.Attributes["style"] = "display:block";
                        break;
                    case "trabajador":
                        trabajador trabajador = (trabajador)Session["usuarioAModificar"];
                        txtNombre.Attributes["placeholder"] = trabajador.nombre;
                        txtPaterno.Attributes["placeholder"] = trabajador.apellidoPaterno;
                        txtMaterno.Attributes["placeholder"] = trabajador.apellidoMaterno;
                        txtCorreo.Attributes["placeholder"] = trabajador.correoElectronico;
                        SueldoTrabajador.Attributes["placeholder"] = trabajador.sueldo.ToString();
                        CargoTrabajador.Attributes["placeholder"] = trabajador.cargo;
                        TipoTrabajador.SelectedValue= trabajador.tipoTrabajador.ToString();
                        rbPersonal.Checked = true;
                        rbAlumno.Disabled = true;
                        rbApoderado.Disabled = true;
                        rbDocente.Disabled = true;
                        rbPersonal.Disabled = true;
                        rbAdministrador.Disabled = true;
                        campoPersonal.Attributes["style"] = "display:block";
                        break;
                    case "superusuario":
                        superUsuario superUsuario = (superUsuario)Session["usuarioAModificar"];
                        txtNombre.Attributes["placeholder"] = superUsuario.nombre;
                        txtPaterno.Attributes["placeholder"] = superUsuario.apellidoPaterno;
                        txtMaterno.Attributes["placeholder"] = superUsuario.apellidoMaterno;
                        txtCorreo.Attributes["placeholder"] = superUsuario.correoElectronico;
                        SueldoAdmin.Attributes["placeholder"] = superUsuario.sueldo.ToString();
                        CargoAdmin.Attributes["placeholder"] = superUsuario.cargo;
                        AreaAdmin.Attributes["placeholder"] = superUsuario.areaAdministrativa;
                        rbAdministrador.Checked = true;
                        rbAlumno.Disabled = true;
                        rbApoderado.Disabled = true;
                        rbDocente.Disabled = true;
                        rbPersonal.Disabled = true;
                        rbAdministrador.Disabled = true;
                        campoAdministrador.Attributes["style"] = "display:block";
                        break;
                }
            }
            else if (Session["mostrarUsuario"]!=null)
            {
                tituloAddUsuario.Text = "Mostrar Usuario";
                foreach (var tipoRelacionAlumno in Enum.GetNames(typeof(relacionAlumno)))
                {
                    Relacion.Items.Add(new ListItem(tipoRelacionAlumno));
                }
                foreach (var tipoDocente in Enum.GetNames(typeof(tipoDocente)))
                {
                    TipoDocente.Items.Add(new ListItem(tipoDocente));
                }
                foreach (var tipoTrabajador in Enum.GetNames(typeof(tipoTrabajador)))
                {
                    TipoTrabajador.Items.Add(new ListItem(tipoTrabajador));
                }
                string mostrarUsuario = (string)Session["mostrarUsuario"];
                txtNombre.Enabled = false;
                txtPaterno.Enabled = false;
                txtMaterno.Enabled = false;
                txtCorreo.Enabled = false;
                switch (mostrarUsuario)
                {
                    case "alumno":
                        alumno alumno = (alumno)Session["usuarioAMostrar"];
                        txtNombre.Text = alumno.nombre;
                        txtPaterno.Text = alumno.apellidoPaterno;
                        txtMaterno.Text = alumno.apellidoMaterno;
                        txtCorreo.Text = alumno.correoElectronico;
                        rdMale.Disabled = true;
                        rdFemale.Disabled = true;
                        if (alumno.genero == 'M')
                        {
                            rdMale.Checked = true;
                        }
                        else
                        {
                            rdFemale.Checked = true;
                        }
                        Nacimiento.Enabled = false;
                        dirAlum.Enabled=false;
                        dirAlum.Text = alumno.direccion;
                        rbAlumno.Checked = true;
                        rbAlumno.Disabled = true;
                        rbApoderado.Disabled = true;
                        rbDocente.Disabled = true;
                        rbPersonal.Disabled = true;
                        rbAdministrador.Disabled = true;
                        campoAlumno.Attributes["style"] = "display:block";
                        break;
                    case "apoderado":
                        apoderado apoderado = (apoderado)Session["usuarioAMostrar"];
                        txtNombre.Text = apoderado.nombre;
                        txtPaterno.Text = apoderado.apellidoPaterno;
                        txtMaterno.Text = apoderado.apellidoMaterno;
                        txtCorreo.Text = apoderado.correoElectronico;
                        Ocupacion.Enabled = false;
                        Telefono.Enabled=false;
                        dirApoderado.Enabled = false;
                        Relacion.Enabled = false;
                        Ocupacion.Text = apoderado.ocupacion;
                        Telefono.Text = apoderado.telefono.ToString();
                        dirApoderado.Text = apoderado.direccion;
                        Relacion.SelectedValue = apoderado.relacionAlumno.ToString();
                        rbApoderado.Checked = true;
                        rbAlumno.Disabled = true;
                        rbApoderado.Disabled = true;
                        rbDocente.Disabled = true;
                        rbPersonal.Disabled = true;
                        rbAdministrador.Disabled = true;
                        campoApoderado.Attributes["style"] = "display:block";
                        break;
                    case "docente":
                        docente docente = (docente)Session["usuarioAMostrar"];
                        txtNombre.Text = docente.nombre;
                        txtPaterno.Text = docente.apellidoPaterno;
                        txtMaterno.Text = docente.apellidoMaterno;
                        txtCorreo.Text = docente.correoElectronico;
                        Especialidad.Enabled = false;
                        TipoDocente.Enabled = false;
                        SueldoDocente.Enabled = false;
                        Especialidad.Text = docente.especialidad;
                        TipoDocente.SelectedValue = docente.tipoDocente.ToString();
                        SueldoDocente.Text = docente.sueldo.ToString();
                        rbDocente.Checked = true;
                        rbAlumno.Disabled = true;
                        rbApoderado.Disabled = true;
                        rbDocente.Disabled = true;
                        rbPersonal.Disabled = true;
                        rbAdministrador.Disabled = true;
                        ContratoDocente.Enabled = false;
                        campoDocente.Attributes["style"] = "display:block";
                        break;
                    case "trabajador":
                        trabajador trabajador = (trabajador)Session["usuarioAMostrar"];
                        txtNombre.Text = trabajador.nombre;
                        txtPaterno.Text = trabajador.apellidoPaterno;
                        txtMaterno.Text = trabajador.apellidoMaterno;
                        txtCorreo.Text = trabajador.correoElectronico;
                        SueldoTrabajador.Enabled = false;
                        CargoTrabajador.Enabled = false;
                        TipoTrabajador.Enabled = false;
                        SueldoTrabajador.Text = trabajador.sueldo.ToString();
                        CargoTrabajador.Text = trabajador.cargo;
                        TipoTrabajador.SelectedValue = trabajador.tipoTrabajador.ToString();
                        rbPersonal.Checked = true;
                        rbAlumno.Disabled = true;
                        rbApoderado.Disabled = true;
                        rbDocente.Disabled = true;
                        rbPersonal.Disabled = true;
                        rbAdministrador.Disabled = true;
                        ContratoTrabajador.Enabled=false;
                        campoPersonal.Attributes["style"] = "display:block";
                        break;
                    case "superusuario":
                        superUsuario superUsuario = (superUsuario)Session["usuarioAMostrar"];
                        txtNombre.Text = superUsuario.nombre;
                        txtPaterno.Text = superUsuario.apellidoPaterno;
                        txtMaterno.Text = superUsuario.apellidoMaterno;
                        txtCorreo.Text = superUsuario.correoElectronico;
                        SueldoAdmin.Enabled= false;
                        CargoAdmin.Enabled = false;
                        AreaAdmin.Enabled = false;
                        SueldoAdmin.Text = superUsuario.sueldo.ToString();
                        CargoAdmin.Text = superUsuario.cargo;
                        AreaAdmin.Text = superUsuario.areaAdministrativa;
                        rbAdministrador.Checked = true;
                        rbAlumno.Disabled = true;
                        rbApoderado.Disabled = true;
                        rbDocente.Disabled = true;
                        rbPersonal.Disabled = true;
                        rbAdministrador.Disabled = true;
                        ContratoAdmin.Enabled = false;
                        campoAdministrador.Attributes["style"] = "display:block";
                        break;
                }
            }
            else
            {
                tituloAddUsuario.Text = "Ingresar Usuario";
                alumnos = new BindingList<alumno>(
                                    daoServicio.listarTodosAlumnos().ToList());
                if (!IsPostBack)
                {
                    rbAlumno.Checked = false;
                    rbApoderado.Checked = false;
                    rbDocente.Checked = false;
                    rbPersonal.Checked = false;
                    rbAdministrador.Checked = false;
                    foreach (var tipoRelacionAlumno in Enum.GetNames(typeof(relacionAlumno)))
                    {
                        Relacion.Items.Add(new ListItem(tipoRelacionAlumno));
                    }
                    foreach (var tipoDocente in Enum.GetNames(typeof(tipoDocente)))
                    {
                        TipoDocente.Items.Add(new ListItem(tipoDocente));
                    }
                    foreach (var tipoTrabajador in Enum.GetNames(typeof(tipoTrabajador)))
                    {
                        TipoTrabajador.Items.Add(new ListItem(tipoTrabajador));
                    }
                    Session["alumnosACargo"] = null;
                    Session["alumno"] = null;
                }
                if (Session["alumnosACargo"] == null)
                    alumnosACargo = new BindingList<alumno>();
                else
                    alumnosACargo = (BindingList<alumno>)Session["alumnosACargo"];
            }    
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Session["modificarUsuario"] = null;
            Session["mostrarUsuario"] = null;
            Session["usuarioAMostrar"] = null;
            Session["usuarioAModificar"] = null;
            Response.Redirect("Usuarios.aspx");
        }

        protected void btnBuscarAlumnoModal_Click(object sender, EventArgs e)
        {
            daoServicio = new EduprogWSClient();
            alumnos = new BindingList<alumno>(
                    daoServicio.listarTodosAlumnos().ToList());
            gvAlumnosModal.DataSource = alumnos;
            gvAlumnosModal.DataBind();
        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {
            usuario usuario;
            daoServicio = new EduprogWSClient();
            if (Session["modificarUsuario"] != null)
            {
                string modificarUsuario = (string)Session["modificarUsuario"];
                switch (modificarUsuario)
                {
                    case "alumno":
                        alumno alumno = (alumno)Session["usuarioAModificar"];
                        if(txtNombre.Text!="")
                            alumno.nombre=txtNombre.Text;
                        if (txtPaterno.Text != "")
                            alumno.apellidoPaterno= txtPaterno.Text;
                        if (txtMaterno.Text != "")
                            alumno.apellidoMaterno= txtMaterno.Text;
                        if (txtCorreo.Text != "")
                            alumno.correoElectronico= txtCorreo.Text;
                        alumno.fechaCreacion = DateTime.Now;
                        alumno.fechaCreacionSpecified = true;
                        alumno.fechaNacimiento =DateTime.Parse(Nacimiento.Text);
                        alumno.fechaNacimientoSpecified = true;
                        if (rdMale.Checked)
                            alumno.genero = 'M';
                        else
                            alumno.genero = 'F';
                        if (dirAlum.Text != "")
                            alumno.direccion=dirAlum.Text;
                        int resultado=daoServicio.modificarAlumno(alumno,null);
                        break;
                    case "apoderado":
                        apoderado apoderado = (apoderado)Session["usuarioAModificar"];
                        if (txtNombre.Text != "")
                            apoderado.nombre = txtNombre.Text;
                        if (txtPaterno.Text != "")
                            apoderado.apellidoPaterno = txtPaterno.Text;
                        if (txtMaterno.Text != "")
                            apoderado.apellidoMaterno = txtMaterno.Text;
                        if (txtCorreo.Text != "")
                            apoderado.correoElectronico = txtCorreo.Text;
                        apoderado.fechaCreacion = DateTime.Now;
                        apoderado.fechaCreacionSpecified = true;
                        if (Ocupacion.Text!="")
                            apoderado.ocupacion= Ocupacion.Text;
                        if (Telefono.Text != "")
                            apoderado.telefono=int.Parse(Telefono.Text);
                        if (dirApoderado.Text != "")
                            apoderado.direccion= dirApoderado.Text;
                        relacionAlumno relacion = new relacionAlumno();
                        Enum.TryParse(Relacion.Text, out relacion);
                        apoderado.relacionAlumno = relacion;
                        apoderado.relacionAlumnoSpecified = true;
                        daoServicio.modificarApoderado(apoderado, null);
                        break;
                    case "docente":
                        docente docente = (docente)Session["usuarioAModificar"];
                        if (txtNombre.Text != "")
                            docente.nombre = txtNombre.Text;
                        if (txtPaterno.Text != "")
                            docente.apellidoPaterno = txtPaterno.Text;
                        if (txtMaterno.Text != "")
                            docente.apellidoMaterno = txtMaterno.Text;
                        if (txtCorreo.Text != "")
                            docente.correoElectronico = txtCorreo.Text;
                        docente.fechaCreacion = DateTime.Now;
                        docente.fechaCreacionSpecified = true;
                        if (Especialidad.Text != "")
                            docente.especialidad= Especialidad.Text;
                        tipoDocente tipoDocente = new tipoDocente();
                        Enum.TryParse(TipoDocente.Text, out tipoDocente);
                        docente.tipoDocente = tipoDocente;
                        docente.tipoDocenteSpecified= true;
                        if (SueldoDocente.Text != "")
                            docente.sueldo= Double.Parse(SueldoDocente.Text);
                        docente.fechaContrato = DateTime.Parse(ContratoDocente.Text);
                        docente.fechaContratoSpecified= true;
                        resultado = daoServicio.modificarDocente(docente, null);
                        break;
                    case "trabajador":
                        trabajador trabajador = (trabajador)Session["usuarioAModificar"];
                        if (txtNombre.Text != "")
                            trabajador.nombre = txtNombre.Text;
                        if (txtPaterno.Text != "")
                            trabajador.apellidoPaterno = txtPaterno.Text;
                        if (txtMaterno.Text != "")
                            trabajador.apellidoMaterno = txtMaterno.Text;
                        if (txtCorreo.Text != "")
                            trabajador.correoElectronico = txtCorreo.Text;
                        trabajador.fechaCreacion = DateTime.Now;
                        trabajador.fechaCreacionSpecified = true;
                        if (SueldoTrabajador.Text!="")
                            trabajador.sueldo=Double.Parse(SueldoTrabajador.Text);
                        trabajador.fechaContrato = DateTime.Parse(ContratoTrabajador.Text);
                        trabajador.fechaContratoSpecified = true;
                        if (CargoTrabajador.Text != "")
                            trabajador.cargo=CargoTrabajador.Text;
                        tipoTrabajador tipoTrabajador = new tipoTrabajador();
                        Enum.TryParse(TipoTrabajador.Text, out tipoTrabajador);
                        trabajador.tipoTrabajador = tipoTrabajador;
                        trabajador.tipoTrabajadorSpecified= true;
                        daoServicio.modificarTrabajador(trabajador, null);
                        break;
                    case "superusuario":
                        superUsuario superUsuario = (superUsuario)Session["usuarioAModificar"];
                        if (txtNombre.Text != "")
                            superUsuario.nombre = txtNombre.Text;
                        if (txtPaterno.Text != "")
                            superUsuario.apellidoPaterno = txtPaterno.Text;
                        if (txtMaterno.Text != "")
                            superUsuario.apellidoMaterno = txtMaterno.Text;
                        if (txtCorreo.Text != "")
                            superUsuario.correoElectronico = txtCorreo.Text;
                        superUsuario.fechaCreacion = DateTime.Now;
                        superUsuario.fechaCreacionSpecified = true;
                        if (SueldoAdmin.Text != "")
                            superUsuario.sueldo = Double.Parse(SueldoAdmin.Text);
                        superUsuario.fechaContrato = DateTime.Parse(ContratoAdmin.Text);
                        superUsuario.fechaContratoSpecified = true;
                        if (CargoAdmin.Text != "")
                            superUsuario.cargo = CargoAdmin.Text;
                        if (AreaAdmin.Text != "")
                            superUsuario.areaAdministrativa= AreaAdmin.Text;
                        daoServicio.modificarSuperusuario(superUsuario, null);
                        break;
                }
                Session["modificarUsuario"] = null;
                Session["usuarioAModificar"] = null;
            }
            else if(Session["mostrarUsuario"]!=null)
            {
                Session["mostrarUsuario"] = null;
                Session["usuarioAMostrar"] = null;
            }
            else
            {
                if (rbAlumno.Checked)
                {
                    usuario = new alumno();
                    ((alumno)usuario).nombre = txtNombre.Text;
                    ((alumno)usuario).apellidoPaterno = txtPaterno.Text;
                    ((alumno)usuario).apellidoMaterno = txtMaterno.Text;
                    ((alumno)usuario).correoElectronico = txtCorreo.Text;
                    ((alumno)usuario).contrasenha = "123";
                    ((alumno)usuario).direccion = dirApoderado.Text;
                    ((alumno)usuario).fechaCreacion = DateTime.Now;
                    ((alumno)usuario).fechaCreacionSpecified = true;
                    if (rdFemale.Checked)
                        ((alumno)usuario).genero = 'F';
                    if (rdMale.Checked)
                        ((alumno)usuario).genero = 'M';
                    ((alumno)usuario).fechaNacimiento = DateTime.Parse(Nacimiento.Text);
                    ((alumno)usuario).fechaNacimientoSpecified = true;
                    ((alumno)usuario).direccion = dirAlum.Text;
                    int resultado = daoServicio.insertarAlumno((alumno)usuario);
                }
                if (rbApoderado.Checked)
                {
                    usuario = new apoderado();
                    ((apoderado)usuario).nombre = txtNombre.Text;
                    ((apoderado)usuario).apellidoPaterno = txtPaterno.Text;
                    ((apoderado)usuario).apellidoMaterno = txtMaterno.Text;
                    ((apoderado)usuario).correoElectronico = txtCorreo.Text;
                    ((apoderado)usuario).contrasenha = "123";
                    ((apoderado)usuario).ocupacion = Ocupacion.Text;
                    ((apoderado)usuario).telefono = int.Parse(Telefono.Text);
                    ((apoderado)usuario).direccion = dirApoderado.Text;
                    ((apoderado)usuario).fechaCreacion = DateTime.Now;
                    ((apoderado)usuario).fechaCreacionSpecified = true;
                    alumnosACargo = (BindingList<alumno>)Session["alumnosACargo"];
                    alumno[] alumnosApoderado = new alumno[alumnosACargo.Count];
                    int cont = 0;
                    foreach (alumno alumno in alumnosACargo)
                    {
                        alumnosApoderado[cont] = alumno;
                    }
                    ((apoderado)usuario).alumnosCargo = alumnosApoderado;
                    relacionAlumno relacion = new relacionAlumno();
                    Enum.TryParse(Relacion.Text, out relacion);
                    ((apoderado)usuario).relacionAlumno = relacion;
                    ((apoderado)usuario).relacionAlumnoSpecified = true;
                    int resultado = daoServicio.insertarApoderado((apoderado)usuario);

                }
                if (rbDocente.Checked)
                {
                    usuario = new docente();
                    ((docente)usuario).nombre = txtNombre.Text;
                    ((docente)usuario).apellidoPaterno = txtPaterno.Text;
                    ((docente)usuario).apellidoMaterno = txtMaterno.Text;
                    ((docente)usuario).correoElectronico = txtCorreo.Text;
                    ((docente)usuario).contrasenha = "123";
                    ((docente)usuario).fechaCreacion = DateTime.Now;
                    ((docente)usuario).fechaCreacionSpecified = true;
                    ((docente)usuario).sueldo = Double.Parse(SueldoDocente.Text);
                    ((docente)usuario).fechaContrato = DateTime.Parse(ContratoDocente.Text);
                    ((docente)usuario).fechaContratoSpecified = true;
                    ((docente)usuario).especialidad = Especialidad.Text;
                    tipoDocente tipoDocente = new tipoDocente();
                    Enum.TryParse(TipoDocente.Text, out tipoDocente);
                    ((docente)usuario).tipoDocente = tipoDocente;
                    ((docente)usuario).tipoDocenteSpecified = true;
                    int resultado = daoServicio.insertarDocente((docente)usuario);
                }
                if (rbPersonal.Checked)
                {
                    usuario = new trabajador();
                    ((trabajador)usuario).nombre = txtNombre.Text;
                    ((trabajador)usuario).apellidoPaterno = txtPaterno.Text;
                    ((trabajador)usuario).apellidoMaterno = txtMaterno.Text;
                    ((trabajador)usuario).correoElectronico = txtCorreo.Text;
                    ((trabajador)usuario).contrasenha = "123";
                    ((trabajador)usuario).fechaCreacion = DateTime.Now;
                    ((trabajador)usuario).fechaCreacionSpecified = true;
                    ((trabajador)usuario).sueldo = Double.Parse(SueldoTrabajador.Text);
                    ((trabajador)usuario).fechaContrato = DateTime.Parse(ContratoTrabajador.Text);
                    ((trabajador)usuario).fechaContratoSpecified = true;
                    ((trabajador)usuario).cargo = CargoTrabajador.Text;
                    tipoTrabajador tipoTrabajador = new tipoTrabajador();
                    Enum.TryParse(TipoTrabajador.Text, out tipoTrabajador);
                    ((trabajador)usuario).tipoTrabajador = tipoTrabajador;
                    ((trabajador)usuario).tipoTrabajadorSpecified = true;
                    int resultado = daoServicio.insertarTrabajador((trabajador)usuario);
                }
                if (rbAdministrador.Checked)
                {
                    usuario = new superUsuario();
                    ((superUsuario)usuario).nombre = txtNombre.Text;
                    ((superUsuario)usuario).apellidoPaterno = txtPaterno.Text;
                    ((superUsuario)usuario).apellidoMaterno = txtMaterno.Text;
                    ((superUsuario)usuario).correoElectronico = txtCorreo.Text;
                    ((superUsuario)usuario).contrasenha = "123";
                    ((superUsuario)usuario).fechaCreacion = DateTime.Now;
                    ((superUsuario)usuario).fechaCreacionSpecified = true;
                    ((superUsuario)usuario).sueldo = Double.Parse(SueldoAdmin.Text);
                    ((superUsuario)usuario).fechaContrato = DateTime.Parse(ContratoAdmin.Text);
                    ((superUsuario)usuario).fechaContratoSpecified = true;
                    ((superUsuario)usuario).areaAdministrativa = AreaAdmin.Text;
                    ((superUsuario)usuario).cargo = CargoAdmin.Text;
                    int resultado = daoServicio.insertarSuperUsuario((superUsuario)usuario);
                }
            }
                
            Response.Redirect("Usuarios.aspx");
        }
        protected void gvAlumnos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            gvAlumnosModal.PageIndex = e.NewPageIndex;
            gvAlumnosModal.DataSource = alumnos;
            gvAlumnosModal.DataBind();
        }

        protected void btnSeleccionarAlumnoModal_Click(object sender, EventArgs e)
        {
            campoApoderado.Attributes["style"] = "display:block";
            int idAlumno = Int32.Parse(((LinkButton)sender).CommandArgument);
            alumno alumnoSeleccionado = alumnos.SingleOrDefault(x => x.idAlumno == idAlumno);
            Session["alumno"] = alumnoSeleccionado;
            txtNombreAlumno.Text = alumnoSeleccionado.nombre+" "+alumnoSeleccionado.apellidoPaterno + " " +alumnoSeleccionado.apellidoMaterno;
            
            ScriptManager.RegisterStartupScript(this, GetType(), "", "__doPostBack('','');", true);
        }

        protected void lbAgregarAlumno_Click(object sender, EventArgs e)
        {
            if (Session["alumno"] == null)
            {
                Response.Write("No puede añadir sin haber seleccionado un alumno...");
                return;
            }
            campoApoderado.Attributes["style"] = "display:block";
            alumno alumnoApoderado = (alumno)Session["alumno"];
            alumnosACargo.Add(alumnoApoderado);
            Session["alumnosACargo"] = alumnosACargo;
            gvAlumnos.DataSource = alumnosACargo;
            gvAlumnos.DataBind();
            txtNombreAlumno.Text = "";
        }

        protected void btnEliminarAlumno_Click(object sender, EventArgs e)
        {
            int idAlumno = Int32.Parse(((LinkButton)sender).CommandArgument);
            foreach(alumno alumno in alumnosACargo)
            {
                int cont = 0;
                if(alumno.idAlumno== idAlumno) {
                    alumnosACargo.RemoveAt(cont);
                    break;
                }
                cont++;
            }
            Session["alumnosACargo"] = alumnosACargo;
            gvAlumnos.DataSource = alumnosACargo;
            gvAlumnos.DataBind();

        }
    }
}