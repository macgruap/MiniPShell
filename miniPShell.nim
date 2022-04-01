#[
    Author: Marcello Salvati, Twitter: @byt3bl33d3r
    License: BSD 3-Clause

    References:
        - https://gist.github.com/cpoDesign/66187c14092ceb559250183abbf9e774
]# 

import winim/clr
import sugar
import strformat

echo "F*ck PowerShell.exe!"
echo "lvazquez, 2022"

var Automation = load("System.Management.Automation")
#dump Automation
var RunspaceFactory = Automation.GetType("System.Management.Automation.Runspaces.RunspaceFactory")
#dump RunspaceFactory

var runspace = @RunspaceFactory.CreateRunspace()
#dump runspace

runspace.Open()

stdout.write "PS> "

while true:
    try:
        stdout.flushFile()
        var command = readLine(stdin)
        var pipeline = runspace.CreatePipeline()
        #dump pipeline
        pipeline.Commands.AddScript(command)
        pipeline.Commands.Add("Out-String")

        var results = pipeline.Invoke()

        for i in countUp(0,results.Count()-1):
            echo results.Item(i)
        stdout.write "PS> "
    except:
        stdout.write "PS [X] > "

    #dump results
    #echo results.isType()
    #var t = results.GetType()
    #dump t
    #discard readLine(stdin)
    #echo t.isType()
    #echo t.unwrap.vt

runspace.Close()