function Get-K2ModuleDefault {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter()]
        [ValidateSet("All", "browsername", "fallbackEnvironment", "RelativeUrl")]
        [string]
        $setting = "All"
    )
    
    begin {
        # Validate $K2Config.defaults
        if (-not ($K2Config.defaults -is [System.Management.Automation.PSCustomObject])){
            throw {
                "`$K2Config.defaults not found"
            }
        }
    }
    
    process {
        # Retrieve/show defaults

        switch ($setting) {
            "All" { 
                $K2Config.defaults
                break;
             }
            Default {
                $K2Config.defaults.$setting
                break;            
            }
        }
    }
    
    end {
        
    }
}