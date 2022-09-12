using System;
using System.Management.Automation;
using System.Management.Automation.Runspaces;
namespace Bypass{
    public class miniPShell{
        public static void Main(string[] args){
            Runspace rs = RunspaceFactory.CreateRunspace();
            rs.Open();
            PowerShell ps = PowerShell.Create();
            ps.Runspace = rs;
            Console.Write("PS> ");
            while (true){
                String cmd = Console.ReadLine();
                ps.AddScript(cmd);
                foreach (PSObject result in ps.Invoke())
                {
                    Console.WriteLine("{0}", result);
                }
                Console.Write("PS> ");
            }
            rs.Close();
        }
    }
}
