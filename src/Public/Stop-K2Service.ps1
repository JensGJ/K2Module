function Stop-K2Service {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        
    )
    
    begin {
        
    }
    
    process {
        if ($PSCmdlet.ShouldProcess("K2 Server", "Stop Service")) {
            Stop-Service "K2 Server"
        }
    }
    
    end {
        
    }
}