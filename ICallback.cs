using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace cyberBurnerWS
{
    public interface ICallback
    {
        void AddToBuffer(string s);
    }
}
