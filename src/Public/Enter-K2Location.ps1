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
            if (Test-Path $defaultLocation) {
                Push-Location -StackName K2Navigation $defaultLocation
            } else {
                throw "Path '$defaultLocation' does not exist."
            }
    }
    catch {
        Write-Warning "Directory $CommonK2Directory not found at default location $defaultLocation."
        $failedDriveLetter = Split-Path $defaultLocation -Qualifier
        $fallBackDriveLetter = Get-K2ModuleDefault -setting fallbackDrive

        if (-not (Test-ValidPSDrive $fallBackDriveLetter)){
            Write-Warning "Invalid fallbackdriveLetter ($fallBackDriveLetter)."
            return
        }

        if ($failedDriveLetter -ne $fallBackDriveLetter){
            $fallbackLocation = Join-Path $fallBackDriveLetter (Split-Path $defaultLocation -NoQualifier)
            Write-Verbose "Looking for $CommonK2Directory in $fallbackLocation"
            if (test-path $fallbackLocation){
                Write-Verbose "Found"
                Write-Warning "Using fallbacklocation: $fallbackLocation"
                Push-Location -StackName K2Navigation $fallbackLocation
            }
        }
    }
}