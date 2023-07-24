function Get-K2LogLevel {
    [CmdletBinding()]
    param (
        
    )
    
    begin {
        
    }
    
    process {
        $logConfig =[xml](gc 'C:\Program Files (x86)\K2 blackpearl\Host Server\Bin\HostServerLogging.config');
        
        $logConfig.configuration.ApplicationLevelLogSettings.ApplicationLevelLogSetting.LogLocationSettings.L
ogLocation
    
    end {
        
    }
}