function Get-K2Service {
    [CmdletBinding()]
    param (
        
    )
    
    begin {
        
    }
    
    process {
        Get-CimInstance -ClassName win32_service -Filter "name ='K2 Server'"
    }
    
    end {
        
    }
}