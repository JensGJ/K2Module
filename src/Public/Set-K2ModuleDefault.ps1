function Set-K2ModuleDefault {
    [CmdletBinding(DefaultParameterSetName="browser")]
    param (
        # New default for browser
        [Parameter(ParameterSetName="browser", Mandatory=$true)]
        [ValidateSet("chrome", "edge", "firefox")]
        [string]
        $browsername,


        [Parameter(ParameterSetName="environment", Mandatory=$true)]
        [CBS.Environment]
        $FallBackEnvironment,

        [Parameter(ParameterSetName="RelativeUrl", Mandatory=$true)]
        [K2.RelativeUrl]
        $RelativeUrl

    )
    
    begin {
        # Validate $K2Config.defaults
        if (-not ($K2Config.defaults -is [System.Management.Automation.PSCustomObject])){
            throw {
                "`$K2Config.defaults not found"
            }
        }
    }
    
    process {
        # Set new default

        switch ($PSCmdlet.ParameterSetName) {

            "browser" { 
                $global:K2Config.defaults.browsername = $browsername
                break;
             }
             "environment" {
                $global:K2Config.defaults.fallbackEnvironment = $FallBackEnvironment
                break;
             }
            "RelativeUrl" {
                $global:K2Config.defaults.RelativeUrl = $RelativeUrl
                break;
            }
            Default {
                Write-Warning "No new setting declared"
            }
        }
    }
    
    end {
        
    }
}