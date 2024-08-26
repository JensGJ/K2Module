function Start-K2RemoteSession {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        # Role parameter set
        [Parameter(Mandatory = $true, ParameterSetName = 'RoleSet')]
        [string[]]
        $Role,

        # Server parameter set
        [Parameter(Mandatory = $true, ValueFromPipeline = $true, ParameterSetName = 'ServerSet')]
        [PSObject]
        $Server
    )

    begin {
        if (-not ($cred -is [pscredential])) {
            # Hent og gem credentials til at åbne PSsession
            $cred = Get-Credential -Message "Angiv credentials med adgang til K2serverne"
         }

         # Validate credential to avoid locking the user out if password is wrong
         if (-not (Test-WinCredential $cred)){
            throw "Cannot validate credentials (Username='$($cred.UserName)'). Exiting."
         }

         $serverList = @()
    }

    process {
        if ($PSCmdlet.ParameterSetName -eq 'RoleSet') {
            $servers = Get-K2server -Role $Role | Select-Object -ExpandProperty Name
            $serverList += $servers
        }

        if ($PSCmdlet.ParameterSetName -eq 'ServerSet') {
            if ($Server -is [string]) {
                $serverList += $Server
            } elseif ($Server -is [PSObject]) {
                $serverList += $Server.Name
            }
        }
    }

    end {
        $serverList = $serverList | Select-Object -Unique
        if ($PSCmdlet.ShouldProcess($serverList -join ", ")) {
            $global:K2session = $serverList | New-PSSession -Authentication Credssp -Credential $cred 
            $K2session
        }
    }
}