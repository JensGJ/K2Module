# Get-SQLservers
function Get-K2server {
	<#
		.SYNOPSIS
			Listing information about SQLservers in the HA Cluster

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


		.EXAMPLE
			PS C:\> Get-SQLservers -Environment PROD

		.EXAMPLE
			PS C:\> Get-SQLservers -ServerNumber 201 -Role DB

		.OUTPUTS
			List of Custom SQLserver objects

		.NOTES
			TBD

		.LINK
			about_functions_advanced

		.LINK
			about_comment_based_help

	#>
	[CmdletBinding()]
	#[OutputType([System.Int32])]
	param(
		[Parameter(Position=0)]
		[System.String[]]
		[ValidateSet("DEV", "TST", "PP", "PRD")]
		$Environment,

		[Parameter(Position=1)]
		[ValidateSet("DB", "WEB", "APP")]
		[System.String[]]
		$Role = "",

		[Parameter(Position=2)]
		[ValidateNotNull()]
		[String]
		$ServerNumberFilter,

		[Parameter(Position=3)]
		[ValidateNotNull()]
		[System.String]
		$IP

	)
	try {



# $sqlbase = "OU=SQL HA Cluster,OU=Staff,OU=Servers,DC=hhk,DC=dk"
$k2base = "OU=K2,OU=Staff,OU=Servers,DC=hhk,DC=dk"

$serverlist = Get-ADComputer -SearchBase $k2base -Filter * | Where-Object { $_.Enabled -eq $true }

$serverArray = $serverlist | foreach  {

	$serverProps = $_.Name.Split("-")

#	$serverIP = [System.Net.Dns]::GetHostAddresses($_.Name)

	$PSProps = @{
			'Name'=$_.Name;
			#'Type'=$serverProps[0];
			'Role'=$serverProps[1];
			'Environment'=$serverProps[2];
			'Servernumber'=$serverProps[3];
#			'IP'=$serverIP.IPAddressToString
				}
	New-Object -TypeName PSObject -Property $PSProps


	#$PSserver

}

	if ($IP){
		$serverArray | where { $_.IP -eq $IP }
	} else {
		# Filter out environments:
		if ($Environment) {
			$serverArray = $serverArray | Where-Object { $Environment -contains $_.Environment }
		}
		# Filter based on role
		#if ($Role -notcontains "ALL") {
		if ($Role) {
			$serverArray = $serverArray | Where-Object { $Role -contains $_.Role }
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

