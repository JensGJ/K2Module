function Invoke-K2Url {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory=$true)]
        [CBS.K2.RelativeURL]
        $RelativeURL,

        [Parameter(Mandatory=$false)]
        [CBS.Environment]
        $Environment = [CBS.Environment]::PROD,

        # Name of the browser to open
        [Parameter()]
        [ValidateSet("Chrome", "Edge", "Firefox")]
        [String]
        $Browsername = "Chrome",


        # Private?
        [Parameter()]
        [switch]
        $Private
        

    )

    begin {

    }

    process {
        $URL = Get-K2Url -RelativeURL $RelativeURL -Environment $Environment

        if ($PSCmdlet.ShouldProcess("$URL", "Invoke-Webbrowser ($($BrowserName))")) {
            Invoke-Webbrowser -URL $URL -BrowserName $Browsername -private:$private;    
        }
        
    }

    end {

    }
}