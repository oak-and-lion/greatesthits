using System;
using System.Collections.Generic;
using System.Text;

namespace cyberBurnerWS
{
    public partial class WebForm1 : System.Web.UI.Page, ICallback
    {
        StringBuilder _result = new StringBuilder(1024);

        protected void Page_Load(object sender, EventArgs e)
        {
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
                else if (Request.QueryString["pf"].Equals("albums"))
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