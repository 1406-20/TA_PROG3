using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduprog
{
    public partial class addPost : System.Web.UI.Page
    {
        private EduprogWSClient daoServicio;
        //private publicacionesDAO daopublicacion;
        //private Publicaciones publicacion;
        private string idUsuarioS;
        private int idUsuario;
        protected void Page_Load(object sender, EventArgs e)
        {
            idUsuarioS = (string)Session["idUsuarioActivo"];
            idUsuario = int.Parse(idUsuarioS);
        }

        protected void btnRegresar_Click(object sender, EventArgs e)
        {
            Response.Redirect("adminPublicaciones.aspx");
        }

        protected void btnPublicar_Click(object sender, EventArgs e)
        {

            daoServicio = new EduprogWSClient();
            publicaciones publicacion = new publicaciones();
            byte[] foto = (byte[])Session["foto"];
            byte[] fotoDesc = (byte[])Session["fotoDesc"];
            publicacion.titulo = txtTítulo.Text;
            publicacion.descripcion = txtComunicado.Text;
            publicacion.fotoPrincipal = foto;
            publicacion.fechaPublicacion = DateTime.Now;
            publicacion.fechaPublicacionSpecified = true;
            publicacion.fotoDescripcion = fotoDesc;
            //publicacion.fotoAutor = foto;

            int resultado = daoServicio.insertarPublicaciones(publicacion, idUsuario);
            if (resultado != 0)
            {
                Response.Write("Se ha registrado con exito...");
                Response.Redirect("adminPublicaciones.aspx");
            }
        }

        protected void btnSubirFoto_Click(object sender, EventArgs e)
        {
            //Verificar si se seleccionó un archivo
            if (fileUploadFoto.HasFile)
            {
                // Obtener la extensión del archivo
                string extension = System.IO.Path.GetExtension(fileUploadFoto.FileName);
                // Verificar si el archivo es una imagen
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg" || extension.ToLower() == ".png" || extension.ToLower() == ".gif")
                {
                    // Guardar la imagen en el servidor
                    string filename = Guid.NewGuid().ToString() + extension;
                    string filePath = Server.MapPath("~/Uploads/") + filename;
                    fileUploadFoto.SaveAs(Server.MapPath("~/Uploads/") + filename);
                    imagenPost.ImageUrl = "~/Uploads/" + filename;
                    imagenPost.Visible = true;
                    // Guardamos la referencia en una variable de sesión llamada foto
                    FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.Read);
                    BinaryReader br = new BinaryReader(fs);
                    Session["foto"] = br.ReadBytes((int)fs.Length);
                    fs.Close();
                }
                else
                {
                    // Mostrar un mensaje de error si el archivo no es una imagen
                    Response.Write("Por favor, selecciona un archivo de imagen válido.");
                }
            }
            else
            {
                // Mostrar un mensaje de error si no se seleccionó ningún archivo
                Response.Write("Por favor, selecciona un archivo de imagen.");
            }
        }

        protected void btnSubirFotoDescripcion_Click(object sender, EventArgs e)
        {
            //Verificar si se seleccionó un archivo
            if (fileUploadDescripcion.HasFile)
            {
                // Obtener la extensión del archivo
                string extension = System.IO.Path.GetExtension(fileUploadDescripcion.FileName);
                // Verificar si el archivo es una imagen
                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".jpeg" || extension.ToLower() == ".png" || extension.ToLower() == ".gif")
                {
                    // Guardar la imagen en el servidor
                    string filename = Guid.NewGuid().ToString() + extension;
                    string filePath = Server.MapPath("~/Uploads/") + filename;
                    fileUploadDescripcion.SaveAs(Server.MapPath("~/Uploads/") + filename);
                    image1.ImageUrl = "~/Uploads/" + filename;
                    image1.Visible = true;
                    // Guardamos la referencia en una variable de sesión llamada foto
                    FileStream fs = new FileStream(filePath, FileMode.Open, FileAccess.Read);
                    BinaryReader br = new BinaryReader(fs);
                    Session["fotoDesc"] = br.ReadBytes((int)fs.Length);
                    fs.Close();
                }
                else
                {
                    // Mostrar un mensaje de error si el archivo no es una imagen
                    Response.Write("Por favor, selecciona un archivo de imagen válido.");
                }
            }
            else
            {
                // Mostrar un mensaje de error si no se seleccionó ningún archivo
                Response.Write("Por favor, selecciona un archivo de imagen.");
            }
        }

    }
}