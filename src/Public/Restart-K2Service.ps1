function Restart-K2Service {
    [CmdletBinding(SupportsShouldProcess)]
    param ()
        # Get the K2 status
        Write-Verbose "Calling Get-K2Status"
        $status = Get-K2Status

        # Check if K2 is running (only restart if K2 is actually running)
        if ($status.RunStatus -ne "Running") {
            Write-Warning "K2 is not running"
            return
        }

    if ($PSCmdlet.ShouldProcess("K2 Server", "Restart Service")) {
        if ($status.RunType -eq "Running as console") {
            # Call Stop-K2service and then Start-K2Service
            Write-Verbose "Restarting (console mode)"
            Write-Verbose "Calling Stop-K2Service"
            Stop-K2Service
            Write-Verbose "Calling Start-K2Service"
            Start-K2Service      
        } else {
            Restart-Service "K2 Server"
        }
    }
}