using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace CustomWebControlUI
{
    public class database
    {
        News nw;
        private static string connection_string = "Data Source=ROSTAM-PC;Initial Catalog=DataProvider;Integrated Security=True";

        public static SqlConnection ConnectToDb()
        {
            SqlConnection cnn = new SqlConnection(connection_string);
            return cnn;
        }
        public static void nonQuery(string query)
        {
            SqlConnection cnn = new SqlConnection(connection_string);
            cnn.Open();
            SqlCommand cmd = new SqlCommand(query, cnn);
            try
            {
                cmd.ExecuteNonQuery();
            }
            catch (Exception e)
            {
                Console.Write(e.Message);
                cnn.Close();
                cnn.Dispose();
            }

            cnn.Close();
            cnn.Dispose();
        }
        public static SqlDataReader getData(string query)
        {
            SqlConnection cnn = new SqlConnection(connection_string);
            cnn.Open();
            SqlCommand cmd = new SqlCommand(query, cnn);
            SqlDataReader dr = cmd.ExecuteReader();
            return dr;
        }
        public static void InsertNews(News nw, string symbols)
        {
            SqlConnection cnn = new SqlConnection(connection_string);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "insertNewsSite";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tmpDateTime",nw.getPublishDatetime());
            cmd.Parameters.AddWithValue("@tpmDatOfEvent",DateTime.Now);
            cmd.Parameters.AddWithValue("@tmpTitleDesc",nw.getDescTitle());
            cmd.Parameters.AddWithValue("@tmpTitl1", nw.getTitle1());
            cmd.Parameters.AddWithValue("@tmpTitle2", nw.getTitle2());
            cmd.Parameters.AddWithValue("@tmpSummery",nw.getNewsSummery());
            cmd.Parameters.AddWithValue("@tmpBody", nw.getNewsBody());
            cmd.Parameters.AddWithValue("@tmpLink", nw.getNewsResource());
            cmd.Parameters.AddWithValue("@tmpImageUrl", nw.getImageFileName());
            cmd.Parameters.AddWithValue("@tmpPublication",nw.getPublication());
            cmd.Parameters.AddWithValue("@tmpIdEdited", false);
            cmd.Parameters.AddWithValue("tmpSymbolString", symbols);
            cmd.Connection = cnn;
            cnn.Open();
            cmd.ExecuteNonQuery();
        }
        public static DataTable LoadNews(int news_id) {
            DataTable myDataTable = new DataTable();
            SqlConnection cnn = new SqlConnection(connection_string);
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter adapter = new SqlDataAdapter();
            cmd.Connection = cnn; 
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "LoadSiteNews";
            cmd.Parameters.AddWithValue("@news_id", news_id);
            cnn.Open();
            adapter.SelectCommand = cmd;
            adapter.Fill(myDataTable);
            return myDataTable;

        }

     
        public static DataTable loadSymbols()
        {
            DataTable myDataTable = new DataTable();
            SqlConnection cnn = new SqlConnection(connection_string);
            SqlCommand cmd = new SqlCommand("GetSymbols", cnn);

            SqlDataAdapter adapter = new SqlDataAdapter();

            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cnn.Open();
            adapter.SelectCommand = cmd;
            adapter.Fill(myDataTable);
            return myDataTable;
        }

    }
}