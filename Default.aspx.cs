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

namespace Media
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            getrss();
        }

        private void PopulateRssFeed()
        {
            string RssFeedUrl = "http://rss.cnn.com/rss/edition.rss";
            List<RSS> feeds = new List<RSS>();
            try
            {
                XDocument xDoc = new XDocument();
                xDoc = XDocument.Load(RssFeedUrl);
                var items = (from x in xDoc.Descendants("item")
                             select new
                             {
                                 title = x.Element("title").Value,
                                 link = x.Element("link").Value,
                                 pubDate = x.Element("pubDate").Value,
                                 description = x.Element("description") == null ? "" : x.Element("description").Value

                             }).ToList();
                if (items != null)
                {
                    foreach (var i in items)
                    {
                        RSS f = new RSS
                        {
                            Title = i.title,
                            Link = i.link,
                            PublishDate = i.pubDate,
                            Description = i.description
                        };
                        feeds.Add(f);
                    }
                }
                gvRss.DataSource = feeds;
                gvRss.DataBind();
            }
            catch (Exception ex)
            {
                throw;
            }

        }

        public void getrss()
        {
            try
            {
                List<RSS> feedList = new List<RSS>();
                string RssFeedUrl = "http://rss.cnn.com/rss/edition.rss";
                using (var reader = XmlReader.Create(RssFeedUrl))
                {
                    var feeds = SyndicationFeed.Load(reader);

                    var serializer = new XmlSerializer(typeof(MediaGroup));
                    string link1 = "";
                    string link2 = "";
                    string link3 = "";
                    foreach (SyndicationItem item in feeds.Items)
                    {
                        string subject = item.Title.Text;
                        string link = item.Id;
                        string Desc = item.Summary == null ? "" : item.Summary.Text;
                        string pubdate = item.PublishDate.ToString();


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

                    gvRss.DataSource = feedList;
                    gvRss.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw;
            }
        }
    }
}