# Get-SQLservers
function Get-K2server {
	<#
		.SYNOPSIS
			Show information about K2 Servers

		.DESCRIPTION
			TBD

		.PARAMETER  Environment
			Select which environment(s) to show.
			Possible values: ALL, PROD (P, PRD), PREPROD (PP), TEST (TST)
			Default value: ALL

		.PARAMETER  Role
			Select which SQL Roles to search for.
			Possible values: ALL, DB, AR, A, R, WIT
			Default value: ALL
		.PARAMETER  Servernumber
			Select servers with a specific number (100-999)

		.PARAMETER  IP
			Select servers with a specific IP address.
		
		.PARAMETER Current
			Get K2 serverinfo for the current server

		.EXAMPLE
			PS C:\> Get-K2server -Current

		.EXAMPLE
			PS C:\> Get-K2server -Environment PROD

		.EXAMPLE
			PS C:\> Get-K2server -Role APP


		.OUTPUTS
			List of K2 Server objects

		.NOTES
			Role, enviroment and servernumber are extracted from the 4 part server name

		.LINK
			about_functions_advanced

		.LINK
			about_comment_based_help

	#>
	[CmdletBinding()]
	#[OutputType([System.Int32])]
	param(
		[Parameter(Position=0, ParameterSetName="NameFilter")]
		[String[]]
		[ValidateSet("DEV", "TST", "PP", "PRD")]
		$Environment,

		[Parameter(Position=1, ParameterSetName="NameFilter")]
		[ValidateSet("DB", "WEB", "APP")]
		[System.String[]]
		$Role = "",

		[Parameter(Position=2, ParameterSetName="NameFilter")]
		[ValidateNotNull()]
		[String]
		$ServerNumberFilter,

		[Parameter(Mandatory=$true, ParameterSetName="IP")]
		[ValidateNotNull()]
		[System.String]
		$IP,

		[Parameter(Mandatory=$true, ParameterSetName="Current")]
		[switch]
		$Current

	)
	try {


$k2base = "OU=K2,OU=Staff,OU=Servers,DC=hhk,DC=dk"

if ($Current){
	# Fetch current computer
	$serverlist = Get-ADComputer $env:COMPUTERNAME;

} else {
	# Fetch all K2 servers
	$serverlist = Get-ADComputer -SearchBase $k2base -Filter * | Where-Object { $_.Enabled -eq $true }
}


$serverArray = $serverlist | ForEach-Object  {

	$serverProps = $_.Name.Split("-")

	if ($serverProps.Count -ne 4){
		throw "Invalid computername (Not a K2 server?) ($($_.Name))"
	} 

	# Get IP4-address(es) for the server
	$serverIP = [System.Net.Dns]::GetHostAddresses($_.Name) | Where-Object AddressFamily -eq "Internetwork"

	# Adjust roles for DEV and TST environments
	$roles = $serverProps[1]
	if ($serverProps[2] -in @("DEV", "TST") -and $serverProps[1] -eq "WEB") {
		$roles = "WEB+APP"
	}

	$PSProps = @{
			'Name'=$_.Name;
			#'Type'=$serverProps[0];
			'Role'=$roles;
			'Environment'=$serverProps[2];
			'Servernumber'=$serverProps[3];
			'IP'=$serverIP.IPAddressToString
				}
	New-Object -TypeName PSObject -Property $PSProps


}

	if ($IP){
		$serverArray | Where-Object { $_.IP -eq $IP }
	} else {
		# Filter out environments:
		if ($Environment) {
			$serverArray = $serverArray | Where-Object { $Environment -contains $_.Environment }
		}
		# Filter based on role
		#if ($Role -notcontains "ALL") {
		if ($Role) {
			$serverArray = $serverArray | Where-Object { 
				$serverRoles = $_.Role -split "\+"
				$serverRoles | ForEach-Object { $_ } | Where-Object { $Role -contains $_ }
			}
		}
		# Filter based on number
		if ($ServerNumberFilter) {
			$serverArray = $serverArray | Where-Object { $_.Servernumber -like $ServerNumberFilter }
		}

		$serverArray

	}
}
	catch {
		throw
	}

}

