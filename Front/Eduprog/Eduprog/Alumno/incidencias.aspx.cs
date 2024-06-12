using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.DynamicData;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace Eduprog
{
    public partial class incidencias : System.Web.UI.Page
    {
        private EduprogWSClient daoServicio;
        protected void Page_Load(object sender, EventArgs e)
        {
            rptIncidencias.ItemDataBound += rptIncidencias_ItemDataBound;
            if (!IsPostBack)
            {
                // Establecer dtHasta como la fecha actual
                dtHasta.Value = DateTime.Today.ToString("yyyy-MM-dd");

                // Establecer dtDesde como hace una semana
                dtDesde.Value = DateTime.Today.AddDays(-7).ToString("yyyy-MM-dd");
                CargarIncidencias();
            }
        }

        private void CargarIncidencias()
        {
            daoServicio = new EduprogWSClient();
            // Supongamos que tienes una función ObtenerListaIncidencias que devuelve una lista de objetos Incidencia
            //var listaIncidencias = new List<Incidencia>();
            var listaIncidencia = new List<incidencia>();
            //merito meritos = new merito();
            EduprogWS.merito[] arrMeritos = daoServicio.listarMerito();
            BindingList<EduprogWS.merito> meritos;
            if (arrMeritos != null)
            {
                meritos = new BindingList<EduprogWS.merito>(arrMeritos);
                listaIncidencia.AddRange(meritos);
            }


            EduprogWS.demerito[] arrDemeritos = daoServicio.listarDemerito();
            BindingList<EduprogWS.demerito> demeritos;
            if (arrDemeritos != null)
            {
                demeritos = new BindingList<EduprogWS.demerito>(arrDemeritos);
                listaIncidencia.AddRange(demeritos);
            }


            EduprogWS.atencionMedica[] arrAtencionesMedicas = daoServicio.listarAtencionMedica();
            BindingList<EduprogWS.atencionMedica> atencionesMedicas;
            if (arrAtencionesMedicas != null)
            {
                atencionesMedicas = new BindingList<EduprogWS.atencionMedica>(arrAtencionesMedicas);
                listaIncidencia.AddRange(atencionesMedicas);
            }

            DateTime _dtDesde = DateTime.ParseExact(dtDesde.Value, "yyyy-MM-dd", CultureInfo.InvariantCulture);
            DateTime _dtHasta = DateTime.ParseExact(dtHasta.Value, "yyyy-MM-dd", CultureInfo.InvariantCulture);

            var incidenciasEnRango = listaIncidencia.Where(i =>
                i.fechaRegistro >= _dtDesde &&
                i.fechaRegistro <= _dtHasta)
                .OrderBy(i => i.fechaRegistro)
                .ToList();



            listaIncidencia = listaIncidencia.OrderBy(o => o.fechaRegistro).ToList();
            rptIncidencias.DataSource = listaIncidencia;
            rptIncidencias.DataBind();
        }

        protected void btnVerIncidencias_Click(object sender, EventArgs e)
        {
            // Llama al método para cargar las incidencias con las nuevas fechas
            CargarIncidencias();
        }



        protected void rptIncidencias_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Obtener la incidencia actualmente enlazada al Repeater
                incidencia inciden = (incidencia)e.Item.DataItem;
                HtmlGenericControl divDiagnostico = (HtmlGenericControl)e.Item.FindControl("divDiagnostico");
                HtmlGenericControl divTratamiento = (HtmlGenericControl)e.Item.FindControl("divTratamiento");
                Label lblDiagnostico = (Label)e.Item.FindControl("lblDiagnostico");
                Label lblTratamiento = (Label)e.Item.FindControl("lblTratamiento");
                Label LabelTipoValor = (Label)e.Item.FindControl("LabelTipoValor");
                Label LabelFechaHoraValor = (Label)e.Item.FindControl("LabelFechaHoraValor");
                LabelFechaHoraValor.Text = DateTime.Now.Date.ToString("dd/MM/yyyy");

                if (inciden.tipo == 'A')
                {


                    // Obtener los controles de los campos de diagnóstico y tratamiento

                    LabelTipoValor.Text = "Atención medica";
                    // Asignar los valores de diagnóstico y tratamiento a los controles
                    lblDiagnostico.Text = ((atencionMedica)inciden).diagnostico;
                    lblTratamiento.Text = ((atencionMedica)inciden).tratamiento;
                    // Mostrar los controles de diagnóstico y tratamiento
                    divDiagnostico.Visible = true;
                    divTratamiento.Visible = true;

                    //lblDiagnostico.Visible = true;
                    //lblTratamiento.Visible = true;
                }
                else if (inciden.tipo == 'M')
                {
                    //LabelTipoValor = (Label)e.Item.FindControl("LabelTipoValor");
                    LabelTipoValor.Text = "Mérito";
                    /*lblDiagnostico.Text = "";
                    lblTratamiento.Text = "";*/
                }
                else if (inciden.tipo == 'D')
                {
                    //LabelTipoValor = (Label)e.Item.FindControl("LabelTipoValor");
                    LabelTipoValor.Text = "Demérito";
                    /*lblDiagnostico.Text = "";
                    lblTratamiento.Text = "";*/
                }
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            daoServicio = new EduprogWSClient();
            string idIncidencia = hfIdIncidencia.Value;
            int idEliminar = int.Parse(idIncidencia);
            daoServicio.eliminarAtencionMedica(idEliminar);
            CargarIncidencias();

        }

        protected void btnGuardar_Click(object sender, EventArgs e)
        {

        }

        protected void lbEditarIncidencia_Click(object sender, EventArgs e)
        {

        }

        protected string ObtenerValorPropiedad(object obj, string propiedad)
        {
            var tipo = obj.GetType();
            var propInfo = tipo.GetProperty(propiedad);
            if (propInfo != null)
            {
                var valor = propInfo.GetValue(obj, null);
                return valor != null ? valor.ToString() : "null";
            }
            return "null";
        }
    }
}