var shell = WScript.CreateObject("WScript.Shell");
var link = shell.CreateShortcut(WScript.Arguments(0));
link.TargetPath = WScript.Arguments(1);
link.WorkingDirectory = ".";
link.Arguments = WScript.Arguments(2);
link.Description = "h:"
link.HotKey = "ALT+CTRL+F"
link.HotKey = ""
link.IconLocation = WScript.Arguments(1)+ ", 1"
link.Save();
