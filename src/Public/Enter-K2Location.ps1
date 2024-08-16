function Enter-K2Location {
    [CmdletBinding()]
    param (
        # Named K2location
        [Parameter(Mandatory=$true)]
        [K2.K2Directory]
        $CommonK2Directory
    )

try {
        $defaultLocation =  $K2Config.K2Directories.$CommonK2Directory
        Push-Location -StackName K2Navigation $defaultLocation
}
catch {
    Write-Warning $"Directory {$CommonK2Directory} not found at default location {$defaultLocation}."
    $failedDriveLetter = Split-Path $defaultLocation -Qualifier
    $fallBackDriveLetter = Get-K2ModuleDefault -setting fallbackDrive

    if ($failedDriveLetter -ne $fallBackDriveLetter){
        $fallbackLocation = Join-Path $fallBackDriveLetter (Split-Path $defaultLocation -NoQualifier)
        Write-Verbose "Looking for $CommonK2Directory in $fallbackLocation"
        if (test-path $fallbackLocation){
            Write-Verbose "Found"
            Push-Location $fallbackLocation
        }
    }
}
}