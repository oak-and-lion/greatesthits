using System.Data;
using System.Text;

namespace cyberBurnerWS
{
    public class DiscographyCallback
    {
        private ICallback _callingFilter;

        private QueryStringArg[] _queryArgs;

        public void ProcessPostBack(QueryStringArg[] args, ICallback filter)
        {
            _queryArgs = args;
            _callingFilter = filter;
        }

        public void DoPostBack()
        {
            object[] parameters = new object[8];
            for (int x = 0; x < parameters.Length; x++)
                parameters[x] = 0;

            foreach (QueryStringArg arg in _queryArgs)
            {
                if (arg.Arg.Equals("artist"))
                {
                    parameters[0] = arg.Value;
                }
                else if (arg.Arg.Equals("tracknumber"))
                {
                    parameters[1] = arg.Value;
                }
                else if (arg.Arg.Equals("albumtype"))
                {
                    parameters[2] = arg.Value;
                }
                else if (arg.Arg.Equals("album"))
                {
                    parameters[3] = arg.Value;
                }
                else if (arg.Arg.Equals("maxtime"))
                {
                    parameters[4] = arg.Value;
                }
                else if (arg.Arg.Equals("mintime"))
                {
                    parameters[5] = arg.Value;
                }
            }

            DataAccess dataAccess = new DataAccess("Burner");
            DataSet result = dataAccess.RetrieveData("SearchForTracks", parameters);
            FormatResult(result);
        }

        private void FormatResult(DataSet dataSet)
        {
            DataTable dataTable = dataSet.Tables[0];
            StringBuilder stringBuilder = new StringBuilder(1024);

            stringBuilder.Append("{\"total\":");
            stringBuilder.Append(dataTable.Rows.Count.ToString());
            stringBuilder.Append(",\"columns\":[");
            bool firstCol = true;
            foreach(DataColumn dataColumn in dataTable.Columns)
            {
                if (firstCol)
                {
                    firstCol = false;
                }
                else
                {
                    stringBuilder.Append(",");
                }

                stringBuilder.Append("\"");
                stringBuilder.Append(dataColumn.ColumnName);
                stringBuilder.Append("\"");
            }
            stringBuilder.Append("],\"tracks\":[");

            bool firstRow = true;
            foreach(DataRow row in dataTable.Rows)
            {
                if (firstRow)
                {
                    firstRow = false;
                }
                else
                {
                    stringBuilder.Append(",");
                }
                stringBuilder.Append("{");

                bool first = true;
                foreach(DataColumn column in dataTable.Columns)
                {
                    if (!first)
                    {
                        stringBuilder.Append(",");
                    }
                    else
                    {
                        first = false;
                    }
                    stringBuilder.Append("\"");
                    stringBuilder.Append(column.ColumnName);
                    stringBuilder.Append("\":\"");
                    stringBuilder.Append(row[column].ToString());
                    stringBuilder.Append("\"");
                }

                stringBuilder.Append("}");
            }

            stringBuilder.Append("]}");

            _callingFilter.AddToBuffer(stringBuilder.ToString());
        }
    }
}