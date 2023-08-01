function Restart-K2Service {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        
    )
    
    begin {
        
    }
    
    process {
        if ($PSCmdlet.ShouldProcess("K2 Server", "Restart Service")) {
            Restart-Service "K2 Server"
        }
    }
    
    end {
        
    }
}