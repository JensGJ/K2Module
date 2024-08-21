function Start-K2Service {
    [CmdletBinding(SupportsShouldProcess)]
    param ()

        # Get the K2 status
        $status = Get-K2Status

        # Check if K2 is already running
        if ($status.RunStatus -eq "Running") {
            Write-Warning "K2 is already running"
			return
        }

        # Get the environment
        $environment = Get-K2Environment

        if (($PSVersionTable.PSEdition -eq "Desktop" ) -and ($environment -eq "DEV")) {
            Write-Warning "Start-K2Service on DEV (console mode) requires PowerShell 7 or higher. Please run this command in PowerShell 7 or start K2 from the Start Menu"
            return
        }

        if ($PSCmdlet.ShouldProcess("K2 Server", "Start Service")) {
            if ($environment -eq "DEV") {
                # Run the command for DEV environment
				Write-Verbose "In dev environment - trying to start K2 as console app"
			    $command = "C:\Windows\System32\runas.exe /user:HHK\svc-k2-app-dev /savecred 'powershell.exe -File `"C:\Program Files (x86)\K2 blackpearl\Setup\Powershell\K2 Server (Service Account).ps1`"'"
                Invoke-Expression $command -verbose
            } else {
				Write-Verbose "Trying to start K2 Server as service"
                # Start the service normally
                Start-Service -Name "K2 Server"
            }
        }
}