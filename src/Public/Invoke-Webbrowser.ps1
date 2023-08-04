function Invoke-Webbrowser {
    [CmdletBinding(SupportsShouldProcess)]

    param (
        # URL
        [Parameter(Mandatory=$true,ValueFromPipeline=$true)]
        [String]
        $URL,

        # Name of the browser to open
        [Parameter()]
        [ValidateSet("Chrome", "Edge", "Firefox")]
        [String]
        $Browsername = (Get-K2ModuleDefault -setting browsername),


        # Private?
        [Parameter()]
        [switch]
        $Private
    )

    begin {
        $browsers = @{}

        $browsers.Add("chrome", @{ProcessName="chrome";PrivateArgument="--incognito"});
        $browsers.Add("edge", @{ProcessName="msedge";PrivateArgument="-inprivate"});
        $browsers.Add("firefox", @{ProcessName="firefox";PrivateArgument = "-private-window"})
    }

    process {
        $processName = $browsers[$Browsername.ToLower()].ProcessName;
        if ($null -eq $processName){
            throw "No process defined for $Browsername"
        }
        $argument = $URL
        if ($Private) {
            $argument = $browsers[$Browsername.ToLower()].PrivateArgument + " " + $argument;
        }

        if ($PSCmdlet.ShouldProcess(("{0} -ArgumentList {1}" -f $processName, $argument), "Start-Process")) {
            
            try {
                Start-Process $processName -ArgumentList $argument
            }
            catch {
                Write-Error "Failed to start $Browsername (might not be installed). (Process: $processName, Argument: $argument)"
            }
        }

    }

    end {

    }
}