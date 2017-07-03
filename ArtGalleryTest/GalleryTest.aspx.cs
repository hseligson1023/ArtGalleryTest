using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Globalization;

namespace ArtGalleryTest
{
    public partial class GalleryTest : System.Web.UI.Page
    {
        private DataTable _ArtistViewState;
        public DataTable ArtistViewState
        {
            get
            {
                object o = this.ViewState["DataTable"];
                if(o == null)
                {
                    return _ArtistViewState;
                }
                return (DataTable)o;
            }
           
            set
            {
                _ArtistViewState = value;
                this.ViewState["DataTable"] = value;
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            
            if (!this.IsPostBack)
            {
                BindGrid();
            }
        }
        

        protected void BindGrid()
        {
            var ds = Repository.getArtistData();

            grdArtist.DataSource = ds;

            ArtistViewState = ds.Tables[0];

            grdArtist.DataBind();
        }

     
        protected void btnInsert_Click(object sender, EventArgs e)
        {
         
            try
            {
                DataTable artistData = ArtistViewState as DataTable;
                var formats = new[] { "MM/dd/yyyy", "M/dd/yyyy", "MM-dd-yyyy", "M-dd-yyyy" };
                var dt = DateTime.ParseExact(txtBirthDate.Text, formats, CultureInfo.InvariantCulture, DateTimeStyles.AssumeLocal);
               
                artistData.Rows.Add(txtArtistId.Text, txtFirstName.Text, txtLastName.Text,dt, txtEmail.Text);
                txtArtistId.Text = string.Empty;
                txtFirstName.Text = string.Empty;
                txtLastName.Text = string.Empty;
                txtEmail.Text = string.Empty;
                txtBirthDate.Text = string.Empty;


                
                grdArtist.DataSource = ArtistViewState = artistData;
                grdArtist.DataBind();
            }
            catch (Exception ex)
            {

                throw ex;
            }            
        }
        protected void grdArtist_RowEditing(object sender, GridViewEditEventArgs e)
        {
            grdArtist.EditIndex = e.NewEditIndex;
            this.grdArtist.DataSource = ArtistViewState;
            grdArtist.DataBind();
        }

        protected void OnDelete(object sender, EventArgs e)
        {
            GridViewRow row = (sender as LinkButton).NamingContainer as GridViewRow;
            DataTable artistData = ArtistViewState as DataTable;
            artistData.Rows.RemoveAt(row.RowIndex);
            ViewState["artistData"] = artistData;
            this.grdArtist.DataSource = ArtistViewState = artistData;
            grdArtist.DataBind();
        }

        protected void OnUpdate(object sender, EventArgs e)
        {
            GridViewRow row = (sender as LinkButton).NamingContainer as GridViewRow;
            string firstName = ((TextBox)row.Cells[1].Controls[0]).Text;             
            string lastName = ((TextBox)row.Cells[2].Controls[0]).Text;
            DateTime dob = Convert.ToDateTime(((TextBox)row.Cells[3].Controls[0]).Text);
            string email = ((TextBox)row.Cells[4].Controls[0]).Text;

            DataTable artistData = ArtistViewState as DataTable;
            artistData.Rows[row.RowIndex]["FirstName"] = firstName;
            artistData.Rows[row.RowIndex]["LastName"] = lastName;
            artistData.Rows[row.RowIndex]["DateOfBirth"] = dob;
            artistData.Rows[row.RowIndex]["Email"] = email;
            ViewState["artistData"] = artistData;
            grdArtist.EditIndex = -1;

            this.grdArtist.DataSource = ArtistViewState = artistData;
            grdArtist.DataBind();
        }
        protected void OnCancel(object sender, EventArgs e)
        {
            grdArtist.EditIndex = -1;
            this.grdArtist.DataSource = ArtistViewState;
            grdArtist.DataBind();
        }
    }
}