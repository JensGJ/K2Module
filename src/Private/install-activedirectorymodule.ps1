# Installer K2Modul: 


$MyOS = (Get-CimInstance Win32_OperatingSystem).ProductType
if ($MyOS -gt 1) {
	# Running on server: 
	
		# Tjek feature: 
		$rsat =Get-WindowsFeature rsat-ad-powershell


		if (-not $rsat.Installed) { 

			"Mangler ActiveDirectory Feature" 
			
			if ($rsat.InstallState -eq "Available") { 
				"Kører autoinstallation" 
				Install-WindowsFeature rsat-ad-powershell -Confirm
			}
			
		}


}
else {
	
	# Running on workstation
     
	 $rsat = Get-WindowsCapability -Online -name "Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0"
	if ($rsat.State -ne "Installed") { 

			"Mangler ActiveDirectory Feature" 
			
			Add-WindowsCapability -Online -name "Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0"
			
	}
}


