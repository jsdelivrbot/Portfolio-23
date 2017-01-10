using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace File_Mover
{
    public class MyClass
    {
        public static string src = @"C:\Users\Bold Defiance\Desktop\FolderA";
        public static string dst = @"C:\Users\Bold Defiance\Desktop\FolderB\";
        public static string[] files = System.IO.Directory.GetFiles(src, "*.txt");

        public void Move_Modified_Files()
        {
            foreach (string s in files)
            {
                string fileName = Path.GetFileName(s);
                DateTime filesInfo = File.GetLastWriteTime(s);

                try
                {
                    if (filesInfo >= DateTime.Now.AddDays(-1))
                    {
                        File.Move(s, dst + fileName);
                        Console.WriteLine("Modified files in {0} were moved to {1}", src, dst);
                    }
                    else
                    {
                        Console.WriteLine("File was skipped, no modification.");
                    }
                }
                catch (Exception e)
                {
                    Console.WriteLine("The process failed: {0}", e.ToString());
                }
            }
        }
    }

    class Program
    {
        static void Main(string[] args)
        {
            MyClass cls = new MyClass();
            cls.Move_Modified_Files();
        }
    }
}