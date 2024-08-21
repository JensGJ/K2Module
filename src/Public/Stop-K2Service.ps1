function Stop-K2Service {
    [CmdletBinding(SupportsShouldProcess)]
    param ()
       # Get the K2 status
       Write-Verbose "Calling Get-K2Status"
        $status = Get-K2Status

        # Check if K2 is running
        if ($status.RunStatus -ne "Running") {
            Write-Warning "K2 is not running"
            return
        }

    if ($PSCmdlet.ShouldProcess("K2 Server", "Stop Service")) {
            if ($status.RunType -eq "Running as console") {
                # Stop the process if running as console
                Write-Verbose "Stopping K2Hostserver process (console mode)"
                Stop-Process -Name K2HostServer -Force
            } else {
                # Stop the service if running as a service
                Write-Verbose "Stopping K2 Server service"
                Stop-Service -Name "K2 Server" -Force
            }
        }
}
