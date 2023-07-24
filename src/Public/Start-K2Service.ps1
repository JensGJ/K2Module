function Start-K2Service {
    [CmdletBinding()]
    param (
        
    )
    
    begin {
        
    }
    
    process {
        Start-Service "K2 Server"
    }
    
    end {
        
    }
}