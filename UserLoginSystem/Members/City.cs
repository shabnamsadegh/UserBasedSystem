using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace UserLoginSystem.Members
{
    public class City
    {
        private int city_id;
        private int state_id;
        private string city_name;

        public int getCityID() { return this.city_id; }
        public int getStateID() { return this.state_id; }
        public string getCityName() { return this.city_name; }

        public City(int state_id, string city_name) {
            this.city_id = 0;
            this.state_id = state_id;
            this.city_name = city_name;
        }
    }
}