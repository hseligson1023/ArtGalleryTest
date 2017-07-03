using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
namespace ArtGallery
{
    public class Data
    {
        public static DataSet getdata()
        {
            // creating a dataset with two tables
            DataSet set = new DataSet();

            //first DataTable
            DataTable artistData = new DataTable("Artist");
            artistData.Columns.Add("FirstName", typeof(string));
            artistData.Columns.Add("LastName", typeof(string));
            artistData.Columns.Add("dateOfBirth", typeof(DateTime));
            artistData.Columns.Add("Email", typeof(string));
            artistData.Columns.Add("ArtistId", typeof(int)).AutoIncrement = true;
            DateTime myDate = DateTime.ParseExact("2009-05-08", "yyyy-MM-dd",
                                       System.Globalization.CultureInfo.InvariantCulture);
            artistData.PrimaryKey = new DataColumn[] { artistData.Columns["ArtistId"] };

            //row values
            artistData.Rows.Add("Pablo", "Picasso", myDate, "pablo@gmail.com", 1);
            artistData.Rows.Add("Vincent", "van Gogh", myDate, "wheresmyear@gmail.com", 2);
            artistData.Rows.Add("Frida", "Kahlo", myDate, "uni@yahoo.com", 3);
            artistData.Rows.Add("Edvard", "Munch", myDate, "edtheman@hotmail.com", 4);
            artistData.Rows.Add("Leonardo", "da Vinci", myDate, "guidosrule@gmail.com", 5);
            artistData.Rows.Add("Monet", "Claude", myDate, "mclaude@gmail.com", 6);
            artistData.Rows.Add("Jackson", "Pollock", myDate, "splatter@aol.com", 7);
            artistData.Rows.Add("Paul", "Klee", myDate, "ilovecuba@gmail.com", 8);
            artistData.Rows.Add("Andy", "Warhol", myDate, "popart@warhol.com", 9);


            //second DataTable
            //DataTable artData = new DataTable("Art");
            //artData.Columns.Add("ArtName", typeof(string));
            //artData.Columns.Add("Description", typeof(string));
            //artData.Columns.Add("Price", typeof(decimal));
            //artData.Columns.Add("ArtistId", typeof(int));
            //artData.Columns.Add("ArtId", typeof(int)).AutoIncrement = true;
            //artData.PrimaryKey = new DataColumn[] { artData.Columns["ArtId"] };
            ////row values
            //artData.Rows.Add("Woman Writing", "A woman sitting by a woman in a cheateau near Paris, penning a letter to her beloved artist.", 200000000.00m, 1);

            return set;
        }
    }
}