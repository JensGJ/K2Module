function Start-K2RemoteSession {
    [CmdletBinding(SupportsShouldProcess)]
    param (
        # Role
        [Parameter(Mandatory)]
        [string[]]
        $Role
    )

    begin {
        if (-not ($cred -is [pscredential])) {
            # Hent og gem credentials til at åbne PSsession
            $cred = Get-Credential -Message "Angiv credentials med adgang til K2serverne"
         }
    }

    process {
        $global:K2session = Get-K2server -Role $Role | Select-Object -ExpandProperty Name | New-PSSession -Authentication Credssp -Credential $cred
        $K2session
    }

    end {

    }
}