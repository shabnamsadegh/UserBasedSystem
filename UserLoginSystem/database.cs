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
        private static string connection_string_test = "Data Source=ROSTAM-PC;Initial Catalog=Test;Integrated Security=True";

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
        public static void InsertNews(News nw, string symbols, string mode, int news_id)
        {
            SqlConnection cnn = new SqlConnection(connection_string);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "insertNewsSite";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@tmpDateTime", nw.getPublishDatetime());
            cmd.Parameters.AddWithValue("@tpmDatOfEvent", DateTime.Now);
            cmd.Parameters.AddWithValue("@tmpTitleDesc", nw.getDescTitle());
            cmd.Parameters.AddWithValue("@tmpTitl1", nw.getTitle1());
            cmd.Parameters.AddWithValue("@tmpTitle2", nw.getTitle2());
            cmd.Parameters.AddWithValue("@tmpSummery", nw.getNewsSummery());
            cmd.Parameters.AddWithValue("@tmpBody", nw.getNewsBody());
            cmd.Parameters.AddWithValue("@tmpLink", nw.getNewsResource());
            cmd.Parameters.AddWithValue("@tmpImageUrl", nw.getImageFileName());
            cmd.Parameters.AddWithValue("@tmpPublication", nw.getPublication());
            cmd.Parameters.AddWithValue("@tmpIdEdited", false);
            cmd.Parameters.AddWithValue("@tmpSymbolString", symbols);
            cmd.Parameters.AddWithValue("@time", nw.getTime());
            cmd.Parameters.AddWithValue("@mode", mode);
            cmd.Parameters.AddWithValue("@news_id", news_id);
            cmd.Connection = cnn;
            cnn.Open();
            cmd.ExecuteNonQuery();
        }
        public static DataTable LoadNews(int news_id)
        {
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
            DataTable dt = LoadNews(news_id);
            News nw = new News(dt.Rows[0]["time"].ToString(), (DateTime)dt.Rows[0]["datetime"], dt.Rows[0]["TitleDesc"].ToString(), dt.Rows[0]["Titl1"].ToString(), dt.Rows[0]["Title2"].ToString(), dt.Rows[0]["Summery"].ToString(), dt.Rows[0]["Body"].ToString(), dt.Rows[0]["ImageUrl"].ToString(), dt.Rows[0]["Link"].ToString(), (bool)dt.Rows[0]["Publication"], dt.Rows[0]["symbols"].ToString());
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
        public static DataTable LoadImageCategories()
        {
            DataTable myDataTable = new DataTable();
            SqlConnection cnn = new SqlConnection(connection_string_test);
            SqlCommand cmd = new SqlCommand("LoadImageCategories", cnn);

            SqlDataAdapter adapter = new SqlDataAdapter();

            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cnn.Open();
            adapter.SelectCommand = cmd;
            adapter.Fill(myDataTable);
            return myDataTable;
        }
        public static string CheckIfFileInUse(string file)
        {
            string NewsInvolved = "";
            bool flag = false;
            SqlConnection cnn = new SqlConnection(connection_string);
            SqlCommand cmd = new SqlCommand();
            SqlDataReader dr;
            cmd.CommandText = "LoadImageUrls";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Connection = cnn;

            try
            {
                cnn.Open();
                dr = cmd.ExecuteReader();

                while (dr.Read())
                {
                    if (dr.GetString(0) == file)
                    {
                        NewsInvolved += dr.GetInt32(1).ToString() + NewsInvolved + ",";
                        flag = true;
                    }
                }
            }
            catch (Exception e)
            {

            }
            if (flag)
                NewsInvolved = "نمی توانید تصویر مورد نظر را حذف کنید،این تصویر متعلق به خبر" + NewsInvolved + "است.برای حذف تصویر ابتدا خبر مربوطه را حذف کنید";
            else
                NewsInvolved = "";

            return NewsInvolved;
        }
        /**************MEMBERS****************/
        public static DataTable LoadStates()
        {
            DataTable myDataTable = new DataTable();
            SqlConnection cnn = new SqlConnection(connection_string);
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "LoadStates";
            cmd.Connection = cnn;
            try
            {
                cnn.Open();
                da.SelectCommand = cmd;
                da.Fill(myDataTable);
            }
            catch (Exception)
            {
                cnn.Close();
                throw;
            }
            cnn.Close();
            return myDataTable;

        }
        public static void InsertCity(int state_id, string city_name, string mode, int city_id)
        {

            SqlConnection cnn = new SqlConnection(connection_string);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertCity";
            cmd.Connection = cnn;
            cmd.Parameters.AddWithValue("@stateId", state_id);
            cmd.Parameters.AddWithValue("@name", city_name);
            cmd.Parameters.AddWithValue("@mode", mode);
            cmd.Parameters.AddWithValue("@city_id", city_id);
            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                cnn.Close();
                throw;
            }
            cnn.Close();
        }
        public static DataTable LoadCities(int city_id)
        {

            DataTable myDataTable = new DataTable();
            SqlConnection cnn = new SqlConnection(connection_string);
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            cmd.Connection = cnn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "LoadCities";
            cmd.Parameters.AddWithValue("@city_id", city_id);
            try
            {
                cnn.Open();
                da.SelectCommand = cmd;
                da.Fill(myDataTable);

            }
            catch (Exception)
            {
                cnn.Close();
                throw;
            }
            cnn.Close();
            return myDataTable;
        }


        public static void InsertBroker(string broker_name, string broker_link, string mode, int broker_id)
        {

            SqlConnection cnn = new SqlConnection(connection_string);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertBroker";
            cmd.Connection = cnn;
            cmd.Parameters.AddWithValue("@brokerName", broker_name);
            cmd.Parameters.AddWithValue("@brokerLink", broker_link);
            cmd.Parameters.AddWithValue("@mode", mode);
            cmd.Parameters.AddWithValue("@broker_id", broker_id);
            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                cnn.Close();
                throw;
            }
            cnn.Close();
        }
        public static DataTable LoadBrokers(int broker_id)
        {

            DataTable myDataTable = new DataTable();
            SqlConnection cnn = new SqlConnection(connection_string);
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            cmd.Connection = cnn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "LoadBrokers";
            cmd.Parameters.AddWithValue("@broker_id", broker_id);
            try
            {
                cnn.Open();
                da.SelectCommand = cmd;
                da.Fill(myDataTable);

            }
            catch (Exception)
            {
                cnn.Close();
                throw;
            }
            cnn.Close();
            return myDataTable;
        }
        public static void InsertBranch(int broker_id, string branch_name, int city_id, string branch_address, string branch_tel, string mode, int branch_id)
        {

            SqlConnection cnn = new SqlConnection(connection_string);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertBranch";
            cmd.Connection = cnn;
            cmd.Parameters.AddWithValue("@brokerID", broker_id);
            cmd.Parameters.AddWithValue("@branchName", branch_name);
            cmd.Parameters.AddWithValue("@cityID", city_id);
            cmd.Parameters.AddWithValue("@branchAddress", branch_address);
            cmd.Parameters.AddWithValue("@branchTel", branch_tel);

            cmd.Parameters.AddWithValue("@mode", mode);
            cmd.Parameters.AddWithValue("@branch_id", branch_id);
            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                cnn.Close();
                throw;
            }
            cnn.Close();
        }
        public static DataTable LoadBranches(int branch_id)
        {

            DataTable myDataTable = new DataTable();
            SqlConnection cnn = new SqlConnection(connection_string);
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            cmd.Connection = cnn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "LoadBranches";
            cmd.Parameters.AddWithValue("@branch_id", branch_id);
            try
            {
                cnn.Open();
                da.SelectCommand = cmd;
                da.Fill(myDataTable);

            }
            catch (Exception)
            {
                cnn.Close();
                throw;
            }
            cnn.Close();
            return myDataTable;
        }

        /*******************Listing**********************/
        public static DataTable LoadInstruments()
        {
            DataTable myDataTable = new DataTable();
            SqlConnection cnn = new SqlConnection(connection_string);
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            cmd.Connection = cnn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "LoadInstruments";
  
            try
            {
                cnn.Open();
                da.SelectCommand = cmd;
                da.Fill(myDataTable);

            }
            catch (Exception)
            {
                cnn.Close();
                throw;
            }
            cnn.Close();
            return myDataTable;
        }


        public static DataTable LoadInstrumentInfo(int list_id)
        {

            DataTable myDataTable = new DataTable();
            SqlConnection cnn = new SqlConnection(connection_string);
            SqlCommand cmd = new SqlCommand();
            SqlDataAdapter da = new SqlDataAdapter();
            cmd.Connection = cnn;
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "LoadInstrumentInfo";
            cmd.Parameters.AddWithValue("@list_id", list_id);
            try
            {
                cnn.Open();
                da.SelectCommand = cmd;
                da.Fill(myDataTable);

            }
            catch (Exception)
            {
                cnn.Close();
                throw;
            }
            cnn.Close();
            return myDataTable;
        }


        public static void InsertInstrumentInfo(int instrument_id,string address, string email, string tel, string boss,string site, string mode, int list_id)
        {

            SqlConnection cnn = new SqlConnection(connection_string);
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandText = "InsertInstrumentInfo";
            cmd.Connection = cnn;
            cmd.Parameters.AddWithValue("@instrumentID_FK", instrument_id);
            cmd.Parameters.AddWithValue("@address", address);
            cmd.Parameters.AddWithValue("@email", email);
            cmd.Parameters.AddWithValue("@tel", tel);
            cmd.Parameters.AddWithValue("@boss", boss);
            cmd.Parameters.AddWithValue("@site", site); 
            cmd.Parameters.AddWithValue("@mode", mode);
            cmd.Parameters.AddWithValue("@list_id", list_id);
            try
            {
                cnn.Open();
                cmd.ExecuteNonQuery();
            }
            catch (Exception)
            {
                cnn.Close();
                throw;
            }
            cnn.Close();
        }
    }
}