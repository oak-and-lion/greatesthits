using System;
using System.Collections.Generic;
using System.Collections.Specialized;
using System.Configuration;
using System.Text;

namespace cyberBurnerWS
{
    public partial class WebForm1 : System.Web.UI.Page, ICallback
    {
        StringBuilder _result = new StringBuilder(1024);

        protected void Page_Load(object sender, EventArgs e)
        {
            string corsEntries = ConfigurationManager.AppSettings["cors"];
            string value = null;
            string[] entries = new string[0];

            if (corsEntries != null)
            {
                entries = corsEntries.Split(new string[] { "," }, StringSplitOptions.RemoveEmptyEntries);

                value = Request.Headers["Origin"];
            }
            if (value != null)
            {
                bool found = false;
                foreach (string entry in entries)
                {
                    if (entry == value)
                    {
                        Response.Headers.Add("Access-Control-Allow-Origin", entry);
                        found = true;
                        break;
                    }
                }

                if (!found)
                {
                    Response.Headers.Add("Access-Control-Allow-Origin", "invalid");
                }
            }

            if (Request.QueryString["pf"] == "ip")
            {
                Response.ContentType = "text/plain";
                Response.Write(Request.UserHostAddress);
            }
            else
            {
                List<QueryStringArg> args = new List<QueryStringArg>();

                for (int i = 0; i < Request.QueryString.Count; i++)
                {
                    args.Add(new QueryStringArg(Request.Params.Keys[i], Request.Params[i]));
                }

                if (Request.QueryString["pf"] == "bands")
                {
                    args.Add(new QueryStringArg("func", "SearchForBands"));
                }
                else if (Request.QueryString["pf"] == "albums")
                {
                    args.Add(new QueryStringArg("func", "SearchForAlbums"));
                }

                DiscographyCallback pb = new DiscographyCallback();
                pb.ProcessPostBack(args.ToArray(), this);
                pb.DoPostBack();

                Response.ContentType = "application/javascript";
                if (_result.Length > 0)
                    Response.Write(_result.ToString());
                else
                    Response.Write(string.Empty);
            }
        }

        public void AddToBuffer(string s)
        {
            _result.Append(s);
        }
    }
}