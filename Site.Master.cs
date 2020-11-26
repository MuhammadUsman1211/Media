using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Media
{
    public partial class SiteMaster : MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            {
                TimeZone curTimeZone = TimeZone.CurrentTimeZone;
                DateTime curUTC = curTimeZone.ToUniversalTime(DateTime.Now);
                TimeSpan currentOffset = curTimeZone.GetUtcOffset(DateTime.Now);

                DateTime dt = curUTC.Add(currentOffset);

                date.Text = dt.DayOfWeek + " " + dt.ToString("MMM") + " " + dt.ToString("dd");

                lbltime.Text = dt.ToString("HH:mm:ss");
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            TimeZone curTimeZone = TimeZone.CurrentTimeZone;
            DateTime curUTC = curTimeZone.ToUniversalTime(DateTime.Now);
            TimeSpan currentOffset = curTimeZone.GetUtcOffset(DateTime.Now);

            DateTime dt = curUTC.Add(currentOffset);

            lbltime.Text = dt.ToString("HH:mm:ss");
        }
    }
}