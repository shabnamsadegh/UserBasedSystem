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
        public static void InsertNews(News nw, string symbols,string mode,int news_id)
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
            cmd.Parameters.AddWithValue("@tmpSymbolString", symbols);
            cmd.Parameters.AddWithValue("@time", nw.getTime());
            cmd.Parameters.AddWithValue("@mode", mode);
            cmd.Parameters.AddWithValue("@news_id",news_id);
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

        public static News LoadNewsForEdit(int news_id) 
        {
            News nw;
            DataTable dt = LoadNews(news_id);
            nw = new News(dt.Rows[0]["time"].ToString(), (DateTime)dt.Rows[0]["datetime"], dt.Rows[0]["TitleDesc"].ToString(), dt.Rows[0]["Titl1"].ToString(), dt.Rows[0]["Title2"].ToString(), dt.Rows[0]["Summery"].ToString(), dt.Rows[0]["Body"].ToString(), dt.Rows[0]["ImageUrl"].ToString(), dt.Rows[0]["Link"].ToString(), (bool)dt.Rows[0]["Publication"],dt.Rows[0]["symbols"].ToString());
            return nw;
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
        public static void DeleteNews(int news_id)
        {
            SqlConnection cnn = new SqlConnection(connection_string);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "DeleteNewsSite";
            cmd.Connection = cnn;
            cmd.Parameters.AddWithValue("@news_id", news_id);
            cnn.Open();
            cmd.ExecuteNonQuery();
        }
    }
}