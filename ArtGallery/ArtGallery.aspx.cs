using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ArtGallery
{
    public partial class ArtGallery : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!this.IsPostBack)
            {
                BindGrid();
            }
        }

        protected void grdArtist_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grdArtist.PageIndex = e.NewPageIndex;
        }

        //Edit / Delete Artist Data
        protected void grdArtist_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            //int index;
            //if (e.CommandName.Equals("gvLnkEdit"))
            //{
            //    index = Convert.ToInt32(e.CommandArgument);
            //    int ID = Convert.ToInt32(grdArtist.DataKeys[index].Value.ToString());
            //    var clickedRecord = from artist in Data.getdata()
            //                        where artist.ArtistId == ID
            //                        select artist;
            //    foreach (var d in clickedRecord.ToSet())
            //    {
            //        txtArtistId.Text = d.ArtistId.ToString();
            //    }
            //}
        }

        protected void BindGrid()
        {
            try
            {
                grdArtist.DataSource = Data.getdata();
                grdArtist.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }

        }
        protected void BindGrid2()
        {
            //Art Data
        }
    }
}