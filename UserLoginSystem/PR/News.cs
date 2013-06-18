using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace CustomWebControlUI
{
    public class News
    {
        private DateTime publish_datetime;
        private string time;
        private string desc_title;// رو تیتر
        private string title1;
        private string title2;
        private string News_summery;
        private string News_body;
        private string image_file_name;
        private const string image_destination_url = "";
        private string News_resource;
        private string symbol_string;
        private bool publication;

        public DateTime getPublishDatetime() { return this.publish_datetime; }
        public string getTime() { return this.time; }
        public string getDescTitle() { return this.desc_title; }
        public string getTitle1() { return this.title1; }
        public string getTitle2() { return this.title2; }
        public string getNewsSummery() { return this.News_summery; }
        public string getNewsBody() { return this.News_body; }
        public string getImageFileName() { return this.image_file_name; }
        public string getSymbolString() { return this.symbol_string; }
        public string getNewsResource() { return this.News_resource; }
        
        public bool getPublication() { return this.publication; }

        public News(string time,DateTime News_date, string desc_title, string title1, string title2, string News_summery, string News_body, string image_file_name, string News_resource, bool publication,string symbol_string)
        {
            this.publish_datetime = News_date.Date;
            this.time = time;
            this.desc_title = desc_title;
            this.title1 = title1;
            this.title2 = title2;
            this.News_summery = News_summery;
            this.News_body = News_body;
            this.image_file_name = image_destination_url + image_file_name;
            this.News_resource = News_resource;
            this.publication = publication;
            this.symbol_string = symbol_string;
        }

        public static DateTime makeTime(DateTime date, string time)
        {
            DateTime dt;
            int hour;
            int minute;
            hour = int.Parse(time.Substring(0, 2));
            minute = int.Parse(time.Substring(3, 2));
            date.AddHours(hour);
            date.AddMinutes(minute);
            dt = new DateTime(date.Year, date.Month, date.Day, hour, minute, 0);
            return dt;
        }
    
        public static List<News> GetNews(SqlDataReader dr)
        {
            List<News> news = new List<News>();
            News temp;
            while (dr.Read())
            {
                //DateTime dt = (DateTime)dr["date_time"];

            } return news;
        }
    }
}