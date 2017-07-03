using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;

namespace ArtGalleryTest
{
    public static class Repository
    {
        public static DataSet getArtistData()
        {
            DataSet set = new DataSet();

            //Artist Datatable
            DataTable artistData = new DataTable("Artists");
            artistData.PrimaryKey = new DataColumn[] { artistData.Columns["ArtistId"] };
            artistData.Columns.Add("ArtistId", typeof(int));
            artistData.Columns.Add("FirstName", typeof(string));
            artistData.Columns.Add("LastName", typeof(string));
            artistData.Columns.Add("DateOfBirth", typeof(DateTime));
            foreach (DataRow dr in artistData.Rows)
            {
                dr["DateOfBirth"] = string.Format("{0:MM/dd/yyyy}", dr["OriginalDate"]);
            }
            artistData.Columns.Add("Email", typeof(string));

            //Row Values
            artistData.Rows.Add(1, "Pablo", "Picasso", DateTime.Now.Date, "pablo@picasso.com");
            artistData.Rows.Add(2, "Andy", "Warhol", DateTime.Now.Date, "ilovecampbells@gmail.com");
            artistData.Rows.Add(3, "Frida", "Kahlo", DateTime.Now.Date, "frida@yahoo.com");
            artistData.Rows.Add(4, "Paul", "Klee", DateTime.Now.Date, "pk@klee.net");

            //Art DataTable
            DataTable artData = new DataTable("Art");
            artData.Columns.Add("ArtName", typeof(string));
            artData.Columns.Add("Description", typeof(string));
            artData.Columns.Add("Price", typeof(decimal));
            artData.Columns.Add("ArtistId", typeof(int));
            artData.Columns.Add("ArtId", typeof(int)).AutoIncrement = true;
            artData.PrimaryKey = new DataColumn[] { artData.Columns["ArtId"] };

            //Row Values
            artData.Rows.Add("Woman Writing", "A woman sitting by a woman in a cheateau near Paris, penning a letter to her beloved artist.", 200000000.00m, 1);
            artData.Rows.Add("Campbell's Soup Cans", "Silkscreen screenprints.", 1250.00m, 2);
            artData.Rows.Add("Living Nature", "Oil on canvas.", 300000.00m, 3);
            artData.Rows.Add("At Night", "Pencil and pen with watercolour on paper and cardboard.", 11000.00m, 4);

            //Data Relation
            set.Tables.Add(artistData);
            set.Tables.Add(artData);
            set.Relations.Add(set.Tables["Artists"].Columns["ArtistId"], set.Tables["Art"].Columns["ArtistId"]);
            
            return set;
        }
    }
}