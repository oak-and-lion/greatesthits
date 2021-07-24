using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace cyberBurnerWS
{
    public class QueryStringArg
    {
        private string arg;
        private string value;
        public QueryStringArg(string arg, string value)
        {
            this.arg = arg;
            this.value = value;
        }

        public string Arg { get { return this.arg; } }
        public string Value { get { return this.value;  } }
    }
}