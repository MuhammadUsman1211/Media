using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Xml.Linq;
using System.ServiceModel.Syndication;
using System.Xml.Serialization;
using Media.App_Code;

namespace Media
{
    public partial class Contact : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {           
            if (!IsPostBack)
            {
                Category objcat = new Category();
                objcat.IncrementPageCount(4);
                getbusinessrss();
            }
        }

        public void getbusinessrss()
        {
            try
            {
                List<RSS> feedList = new List<RSS>();
                string []RssFeedUrl = { "https://www.cbc.ca/cmlink/rss-sports", "http://rss.cnn.com/rss/edition_sport.rss" };
                foreach (var items in RssFeedUrl)
                {
                    using (var reader = XmlReader.Create(items))
                    {
                        var feeds = SyndicationFeed.Load(reader);

                        var serializer = new XmlSerializer(typeof(MediaGroup));
                        string link1 = "";
                        foreach (SyndicationItem item in feeds.Items)
                        {
                            string subject = item.Title.Text;
                            string link = item.Id;
                            string Desc = item.Summary == null ? "" : item.Summary.Text;
                            DateTime pubdate = item.PublishDate.DateTime;


                            var mediaGroup = item.ElementExtensions
                                .ReadElementExtensions<MediaGroup>("group", "http://search.yahoo.com/mrss/", serializer)
                                .FirstOrDefault();
                            if (mediaGroup != null)
                            {
                                for (int a = 0; a < mediaGroup.Items.Count(); a++)
                                {
                                    if (a == 1)
                                        link1 = mediaGroup.Items[a].Url;
                                }
                            }
                            RSS f = new RSS
                            {
                                Title = subject,
                                Link = link,
                                PublishDate = pubdate,
                                Description = Desc,
                                image1 = link1
                            };
                            feedList.Add(f);

                        }
                    }
                }
                if (feedList.Count > 0)
                {
                    feedList = feedList.OrderByDescending(x => x.PublishDate).ToList();
                }
                sportrss.DataSource = feedList;
                sportrss.DataBind();
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}