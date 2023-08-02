function Add-CSharpType{
    [CmdletBinding()]
    param (
        [Parameter()]
        [String]
        $Namespace = "CBS",

        # Parameter help description
        [Parameter(Mandatory=$true)]
        [String]
        $EnumName,
        
        # Parameter help description
        [Parameter(Mandatory=$true)]
        [String[]]
        $EnumValues
    )


    Write-Verbose "Checking for type $Namespace.$Enumname"
    if (-not ("$Namespace.$EnumName" -as [System.Type])) {
        $Values = $EnumValues -join ", `n";
        $cSharpCode = @"
using System;
    namespace $Namespace
    {
        public enum $EnumName 
        {
            $Values
        }
    }
"@

    Add-Type -TypeDefinition $cSharpCode -Verbose

} else {
    Write-Verbose "Type $Namespace.$Enumname already exists!"
}

}
