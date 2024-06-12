using Eduprog.EduprogWS;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Eduprog.UsuarioAdministrativo
{
    public partial class Publicaciones : System.Web.UI.Page
    {
        private EduprogWSClient daoServicio;
        //private publicacionesDAO daopublicacion;
        string base64String;
        string imageUrl;
        string imageBody;
        string imageAutor;
        string trash = "<i class='fa-solid fa-trash ps-2'></i>";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                CargarPublicaciones();
            }
        }

        protected void registrarPublica_Click(object sender, EventArgs e)
        {
            Response.Redirect("addPost.aspx");

        }

        //private void CargarPublicaciones()
        //{
        //    List<Publicaciones> publicaciones = daopublicacion.listarTodos();

        //    foreach (var publicacion in publicaciones)
        //    {
        //      if(Publicaciones.activo){
        //        string base64String = Convert.ToBase64String(publicacion.fotoPrincipal);
        //        imageUrl  = "data:image/jpeg;base64," + base64String;
        //        base64String = Convert.ToBase64String(publicacion.fotoAutor);
        //        imageUrlAutor  = "data:image/jpeg;base64," + base64String;
        //        AgregarPublicacion(publicacion);
        //       }
        //    }
        //}

        protected void cargarImagen_Load(object sender, EventArgs e)
        {
            ImageButton principal = (ImageButton)sender;
            if (principal.CommandArgument != null)
            {
                principal.ImageUrl = "data:image/jpeg;base64," + principal.CommandArgument;
            }
        }

        private void CargarPublicaciones()
        {

            EduprogWS.EduprogWSClient daoPublicaciones = new EduprogWS.EduprogWSClient();
            EduprogWS.EduprogWSClient daoUsuario = new EduprogWS.EduprogWSClient();
            EduprogWS.publicaciones[] posts = daoPublicaciones.listarTodasPublicaciones();
            BindingList<EduprogWS.publicaciones> publicaciones;
            superUsuario usuario;
            if (posts != null)
            {

                publicaciones = new BindingList<EduprogWS.publicaciones>(posts);

            }
            else
            {
                publicaciones = new BindingList<EduprogWS.publicaciones>();
            }
            //rptPublicaciones.DataSource = publicaciones;
            //rptPublicaciones.DataBind();

            foreach (EduprogWS.publicaciones post in publicaciones)
            {
                if (post.fotoPrincipal != null)
                {
                    base64String = Convert.ToBase64String(post.fotoPrincipal);
                    imageUrl = "data:image/jpeg;base64," + base64String;
                }
                else
                {
                    imageUrl = "../Imágenes/logo.png";
                }

                if (post.fotoDescripcion != null)
                {
                    base64String = Convert.ToBase64String(post.fotoDescripcion);
                    imageBody = "data:image/jpeg;base64," + base64String;
                }
                else
                {
                    imageBody = null;
                }

                post.idUsuario = 1;

                usuario = daoUsuario.obtenerUsuarioSUperUsuarioPorID(3);
                if (usuario.foto != null)
                    imageAutor = "data:image/jpeg;base64," + Convert.ToBase64String(usuario.foto);
                else
                    imageAutor = "../Imágenes/logo.png";

                AgregarPublicacion(post, usuario);
            }
        }

        [WebMethod]
        public static void BorrarPublicacion(int idPublicacion)
        {
            EduprogWS.EduprogWSClient daoPublicaciones = new EduprogWS.EduprogWSClient();
            daoPublicaciones.eliminarPublicacion(idPublicacion);
        }

        private void AgregarPublicacion(EduprogWS.publicaciones publicacion, superUsuario usuario)
        {
            var publicacionHtml = $@"
                            <div class='p-3'>
                                <div class='card rounded'>
                                    <div class='card-header container-fluid bg-primary-subtle'>
                                        <div class='container' style='display: flex; align-items: flex-start; justify-content: space-between;'>
                                            <h3>{publicacion.titulo}</h3>
                                            <a href='javascript:void(0);' onclick='borrarPublicacion({publicacion.idPublicacion})'>
                                               <i class='fa-solid fa-trash ps-2' style='color: red;' ></i>
                                            </a>
                                        </div>
                                    </div>
                                    <div class='card-body container-fluid bg-secondary-subtle'>
                                        <div class='d-flex justify-content-center'>
                                            <img src={imageUrl} width='150' class='text-center' />
                                        </div>
                                        <hr />
                                        <p class='fw-bold'>Estimado padre de familia:</p>
                                        <p>{publicacion.descripcion}</p>
                                         {(string.IsNullOrEmpty(imageBody) ? "" : $"<img src='{imageBody}' width='150' class='text-center' />")}
                                    </div>
                                    <div class='card-footer container-fluid bg-primary-subtle'>
                                        <div class='row align-items-center'>
                                            <div class='col-auto d-flex' style='display: flex; align-items: flex-start; justify-content: space-between;'>
                                                <div style='margin: auto;'>
                                                    <img src={imageAutor} class='rounded-circle' style='width: 50px; height: 50px;' />
                                                </div>
                                            </div>

                                            <div class='col'>
                                                <p><strong>Publicado por:</strong></p>
                                                <p class='mt - 0'>{usuario.nombre} {usuario.apellidoPaterno} {usuario.apellidoMaterno}</p>
                                            <p class='mt-0'><i class='far fa-calendar-alt'></i> {publicacion.fechaPublicacion.ToString("f")}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>";

            var literal = new Literal
            {
                Text = publicacionHtml
            };

        }
    }
}