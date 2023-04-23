namespace Database;
using System.Reflection;
using System.IO;


class AutoRawDataLocation : IRawDataLocation {
    public string Path => System.IO.Path.GetDirectoryName(Assembly.GetExecutingAssembly().Location) + "/raw_data";
}