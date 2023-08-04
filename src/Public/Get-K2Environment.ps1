function Get-K2Environment {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false)]
        [CBS.Environment]
        $FallBackEnvironment = (Get-K2ModuleDefault -setting fallbackEnvironment)
    )

    [CBS.Environment]$Environment = $FallBackEnvironment

    try {
        $Environment = Get-K2Server -Current | Select-Object -Expandproperty Environment
    }
    catch {
        Write-Verbose "Using fallback enviroment"
        $Environment = $FallBackEnvironment
    }

    $Environment

}