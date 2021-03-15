using LibraryOntology.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace LibraryOntology.Views.PublicViews
{
    public partial class index : System.Web.UI.Page
    {

        Connection connection = new Connection();
        DataTable DT_LiteraryGenre, DT;
        public string BEST_BOOK_NAME, BEST_BOOK_URL, BEST_BOOK_SCORE;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DT_LiteraryGenre = connection.GetAllLiteraryGenre();
                TB_BOOK.Text = "";
            }

            DT = connection.GetBestBook();
            BEST_BOOK_NAME = DT.Rows[0]["Nombre"].ToString();
            BEST_BOOK_URL = DT.Rows[0]["Imagen"].ToString();
            BEST_BOOK_SCORE = DT.Rows[0]["Puntuacion"].ToString().Split('^')[0];

            Rep_Aurhor_Three.DataSource = connection.GetThreeAuthor();
            Rep_Aurhor_Three.DataBind();

            Rep_Books.DataSource = connection.GetAllBooks();
            Rep_Books.DataBind();

            Rep_Best_Sellers.DataSource = connection.GetAllBestSellers();
            Rep_Best_Sellers.DataBind();

            Rep_Client.DataSource = connection.GetAllClientBooks();
            Rep_Client.DataBind();

            Rep_Author.DataSource = connection.GetAllAuthor();
            Rep_Author.DataBind();

            Rep_Editorial.DataSource = connection.GetAllEditorial();
            Rep_Editorial.DataBind();
        }

        private void Reset()
        {
            TB_BOOK.Text = "";
            //DDL_LITERARY_GENRE.SelectedIndex = 0;
        }

        protected void SearchMethod(string ter, string tipo)
        {

            //GridView1.DataSource = con.ConsultarPelicula(ter, tipo);
            //GridView1.DataBind();

        }
        protected void BTN_SEARCH_CLICK(object sender, EventArgs e)
        {
           // string literaryGenre= DDL_LITERARY_GENRE.SelectedItem.Value;
            string propertyQuery= DDL_PROPERTY.SelectedItem.Value;

            if (propertyQuery.Equals("Propiedad"))
            {
                Rep_Books.DataSource = connection.GetBooksByName(TB_BOOK.Text);
                Rep_Books.DataBind();
            }
            else if(propertyQuery.Equals("Propiedad") && TB_BOOK.Equals(""))
            {
                Rep_Books.DataSource = connection.GetAllBooks();
                Rep_Books.DataBind();
            }
            else
            {
                Rep_Books.DataSource = connection.GetBooksByProproperty(propertyQuery, TB_BOOK.Text);
                Rep_Books.DataBind();
            }

            SearchMethod(TB_BOOK.Text, propertyQuery);
        }
    }
}