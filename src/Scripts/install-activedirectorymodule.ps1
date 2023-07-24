#Requires -RunAsAdministrator

# Installer K2Modul: 


$MyOS = (Get-CimInstance Win32_OperatingSystem).ProductType
if ($MyOS -gt 1) {
	# Running on server: 
"ServerOS detected"	
		# Tjek feature: 
		$rsat =Get-WindowsFeature rsat-ad-powershell

$rsat

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
"Workstation OS detected"

	 $rsat = Get-WindowsCapability -Online -name "Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0"

$rsat

if ($rsat.State -ne "Installed") { 

			"Mangler ActiveDirectory Feature" 
			
			Add-WindowsCapability -Online -name "Rsat.ActiveDirectory.DS-LDS.Tools~~~~0.0.1.0"
			
	}
}


