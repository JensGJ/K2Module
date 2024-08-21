function Get-K2LogLevel {
    [CmdletBinding()]
    param (
        
    )
    
    try {
                $logConfig =[xml](Get-Content 'C:\Program Files (x86)\K2 blackpearl\Host Server\Bin\HostServerLogging.config' -ErrorAction Stop);
                
                $logConfig.configuration.ApplicationLevelLogSettings.ApplicationLevelLogSetting.LogLocationSettings.LogLocation
        
    }
    catch {
        Write-Warning "HostServerLogging.config not found or not in correct format. Note that this command only works on a K2 server"
    }    
}
