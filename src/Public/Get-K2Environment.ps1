function Get-K2Environment {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$false)]
        [CBS.Environment]
        $FallBackEnvironment = [CBS.Environment]::PRD
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