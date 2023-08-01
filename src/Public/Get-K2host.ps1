function Get-K2Host {
    [CmdletBinding()]
    param (
        [CBS.Environment]$Environment = (Get-K2Environment)
    )

    begin {
        $K2hosts =  @{
            DEV =  "https://dev-workflow.cbs.dk/";
            TST = "https://tst-workflow.cbs.dk/";
            PP = "https://pp-workflow.cbs.dk/";
            PRD = "https://workflow.cbs.dk/";
        }
    }

    process {
        $K2hosts[([string]$Environment)];
    }

    end {

    }
}