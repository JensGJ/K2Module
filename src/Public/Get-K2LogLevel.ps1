function Get-K2LogLevel {
    [CmdletBinding()]
    param (
        
    )
    
    begin {
        
    }
    
    process {
        $logConfig =[xml](Get-Content 'C:\Program Files (x86)\K2 blackpearl\Host Server\Bin\HostServerLogging.config');
        
        $logConfig.configuration.ApplicationLevelLogSettings.ApplicationLevelLogSetting.LogLocationSettings.LogLocation
    
    }
    end {
        
    }
}
