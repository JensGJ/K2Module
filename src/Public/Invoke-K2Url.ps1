function Invoke-K2Url {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        [Parameter(Mandatory=$false)]
        [K2.RelativeURL]
        $RelativeURL = (Get-K2ModuleDefault -setting RelativeUrl),

        [Parameter(Mandatory=$false)]
        [CBS.Environment]
        $Environment = (Get-K2Environment),

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