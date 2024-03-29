<#
.SYNOPSIS
    Get-K2DBInstance leverer dns-navnet på databaseserveren tilknyttet K2. 
.DESCRIPTION
    Uden parametre levere den en hashtabel med værdierne for alle fire miljøer. 
    Angiver man miljø i parameteren Environment, returneres kun den databaseinstans der hører til dér. 
.NOTES
    Det er alene instansen (eller dns-navnet på instansen) der returneres. 
    Der er dermed ingen angivelse af hvilken database på serveren man skal have fat i
.LINK
    Specify a URI to a help page, this will show when Get-Help -Online is used.
.EXAMPLE
    Get-K2DBInstance

    Returnerer alle DB-instanser med angivelse af hvilket miljø de hører til
.EXAMPLE
    Get-K2DBInstance -Environmnet DEV

    Returnerer db-instansen for DEV-miljøet

#>

function Get-K2DBInstance {
    [CmdletBinding()]
    param (
        [CBS.Environment]$Environment  = (Get-K2Environment)
    )

    begin {
        $K2DBinstances =  @{
            DEV =  "k2.dev.db.hhk.dk";
            TEST = "k2.tst.db.hhk.dk";
            PREPROD = "k2.pp.db.hhk.dk";
            PROD = "k2.db.hhk.dk";
        }
    }

    process {
        if ($Environment){
            $K2DBinstances[([string]$Environment)];
        } else {
            $K2DBinstances
        }
    }

    end {

    }
}