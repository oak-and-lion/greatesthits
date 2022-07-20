using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Reflection;

namespace cyberBurnerWS
{
    public class DataAccess
    {
        SqlConnection _conn = null;

        public DataAccess(string connection)
        {
            OpenConnection(connection);
        }

        public void OpenConnection(string connection)
        {
            string connString = ConfigurationManager.ConnectionStrings[connection].ConnectionString;

            _conn = new SqlConnection(connString);
            _conn.Open();
        }

        public DataSet RetrieveData(string objectName, object[] parameters)
        {
            DataSet result = new DataSet();

            MethodInfo method = this.GetType().GetMethod(objectName, BindingFlags.NonPublic | BindingFlags.Instance);

            if (method != null)
            {
                try
                {
                    result = (DataSet)method.Invoke(this, new object[1] { parameters });
                }
                catch (Exception exc)
                {
                    result = new DataSet();
                    result.Tables.Add("GetDataError");
                    result.Tables[0].Columns.Add("Error", typeof(string));
                    result.Tables[0].Rows.Add(new object[1] { exc.ToString() });
                }
            }

            return result;
        }

        private DataSet SearchForBands(object[] parameters)
        {
            DataSet result = PrepReturn("bands");

            result.Tables[0].Columns.Add("id");
            result.Tables[0].Columns.Add("name");

            SqlCommand cmd = PrepCmd("dbo._disc_getBands");

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                result.Tables[0].Rows.Add(new object[] { reader["id"], reader["bandName"] });
            }

            CloseDown(cmd, reader);

            return result;
        }

        private DataSet SearchForAlbums(object[] parameters)
        {
            DataSet result = PrepReturn("albums");

            result.Tables[0].Columns.Add("id");
            result.Tables[0].Columns.Add("id_band");
            result.Tables[0].Columns.Add("album_year");
            result.Tables[0].Columns.Add("id_album_type");

            SqlCommand cmd = PrepCmd("dbo._disc_getBandAlbums");

            cmd.Parameters.Add(new SqlParameter("@idArtist", parameters[0].ToString()));
            cmd.Parameters.Add(new SqlParameter("@idAlbumType", parameters[2].ToString()));
            cmd.Parameters.Add(new SqlParameter("@minYear", parameters[7].ToString()));
            cmd.Parameters.Add(new SqlParameter("@maxYear", parameters[8].ToString()));

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                result.Tables[0].Rows.Add(new object[] { reader["id"], reader["idBand"], reader["albumYear"], reader["idAlbumType"] });
            }

            CloseDown(cmd, reader);

            return result;
        }

        private DataSet SearchForTracks(object[] parameters)
        {
            DataSet result = PrepReturn("tracks");

            result.Tables[0].Columns.Add("track_title");
            result.Tables[0].Columns.Add("length");
            result.Tables[0].Columns.Add("album");
            result.Tables[0].Columns.Add("release_year");
            result.Tables[0].Columns.Add("track_number");
            result.Tables[0].Columns.Add("album_type");
            result.Tables[0].Columns.Add("artist");
            result.Tables[0].Columns.Add("writers");

            SqlCommand cmd = PrepCmd("dbo._disc_searchTracks");

            cmd.Parameters.Add(new SqlParameter("@idArtist", parameters[0].ToString()));
            cmd.Parameters.Add(new SqlParameter("@trackNumber", parameters[1].ToString()));
            cmd.Parameters.Add(new SqlParameter("@idAlbumType", parameters[2].ToString()));
            cmd.Parameters.Add(new SqlParameter("@idAlbum", parameters[3].ToString()));
            cmd.Parameters.Add(new SqlParameter("@maxtime", parameters[4].ToString()));
            cmd.Parameters.Add(new SqlParameter("@mintime", parameters[5].ToString()));
            cmd.Parameters.Add(new SqlParameter("@writers", parameters[6].ToString()));
            cmd.Parameters.Add(new SqlParameter("@minyear", parameters[7].ToString()));
            cmd.Parameters.Add(new SqlParameter("@maxyear", parameters[8].ToString()));

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                result.Tables[0].Rows.Add(new object[] { reader["track title"], reader["length"], reader["album"], reader["releaseYear"], reader["track number"], reader["album type"], reader["artist"], reader["writer(s)"] });
            }

            CloseDown(cmd, reader);

            return result;
        }

        private DataSet GetMaxTracks(object[] parameters)
        {
            DataSet result = PrepReturn("maxtracks");

            result.Tables[0].Columns.Add("max");

            SqlCommand cmd = PrepCmd("dbo._disc_getMaxTracks");

            cmd.Parameters.Add(new SqlParameter("@idArtist", parameters[0].ToString()));

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                result.Tables[0].Rows.Add(new object[] { reader["maxTracks"] });
            }

            CloseDown(cmd, reader);

            return result;
        }

        private DataSet GetWriters(object[] parameters)
        {
            DataSet result = PrepReturn("writers");

            result.Tables[0].Columns.Add("id");
            result.Tables[0].Columns.Add("name");

            SqlCommand cmd = PrepCmd("dbo._disc_getBandWriters");

            cmd.Parameters.Add(new SqlParameter("@idArtist", parameters[0].ToString()));

            SqlDataReader reader = cmd.ExecuteReader();

            while (reader.Read())
            {
                result.Tables[0].Rows.Add(new object[] { reader["id"], reader["writer"] });
            }

            CloseDown(cmd, reader);

            return result;
        }

        private void CloseDown(SqlCommand cmd, SqlDataReader reader)
        {
            try
            {
                reader.Close();
            }
            catch { }
            try
            {
                reader.Dispose();
            }
            catch { }

            try
            {
                _conn.Close();
            }
            catch { }
            try
            {
                _conn.Dispose();
            }
            catch { }
            try
            {
                cmd.Dispose();
            }
            catch { }
        }

        private DataSet PrepReturn(string name)
        {
            DataSet result = new DataSet();

            result.Tables.Add(name);

            return result;
        }

        private SqlCommand PrepCmd(string storedProc)
        {
            return new SqlCommand(storedProc, _conn)
            {
                CommandType = CommandType.StoredProcedure
            };
        }
    }
}