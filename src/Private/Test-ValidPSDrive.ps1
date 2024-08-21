function Test-ValidPSDrive {
    param (
        [string]$Drive
    )

    $driveName = $Drive.TrimEnd(':')
    $psDrive = Get-PSDrive -Name $driveName -ErrorAction SilentlyContinue

    return $null -ne $psDrive
}
