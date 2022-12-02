function Get-K2Host {
    [CmdletBinding()]
    param (
        [CBS.Environment]$Environment = [CBS.Environment]::PROD
    )

    begin {
        $K2hosts =  @{
            DEV =  "https://dev-workflow.cbs.dk/";
            TEST = "https://tst-workflow.cbs.dk/";
            PREPROD = "https://pp-workflow.cbs.dk/";
            PROD = "https://workflow.cbs.dk/";
        }
    }

    process {
        $K2hosts[([string]$Environment)];
    }

    end {

    }
}