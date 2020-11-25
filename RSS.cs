using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Xml.Serialization;

namespace Media
{
    public class RSS
    {
        public string Title { get; set; }
        public string Link { get; set; }
        public DateTime PublishDate { get; set; }
        public string Description { get; set; }
        public string image1 { get; set; }      

    }

    [XmlRoot("group", Namespace = "http://search.yahoo.com/mrss/")]
    public class MediaGroup
    {
        [XmlElement(ElementName = "content", Namespace = "http://search.yahoo.com/mrss/")]
        public MediaContent[] Items { get; set; }
    }
    public class MediaContent
    {
        [XmlAttribute("url")]
        public string Url { get; set; }

        [XmlAttribute("height")]
        public int Height { get; set; }

        [XmlAttribute("width")]
        public int Width { get; set; }

        [XmlAttribute("medium")]
        public string Medium { get; set; }
    }
}