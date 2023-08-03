<#
.SYNOPSIS
Return Enum values from the config.json file

.DESCRIPTION
Long description

.PARAMETER EnumObject
Parameter description

.EXAMPLE
An example

.NOTES
General notes
#>
function Get-EnumValues {
    [CmdletBinding()]
    param (
        
        $EnumObject, 

        $ConfigObject = $K2Config
    )

    $valueList =  $EnumObject.Values; 
    
    if ($valueList -is [String]){
        $valueList =  ($ConfigObject.$ValueList) |  Get-Member -MemberType NoteProperty | Select -ExpandProperty Name 
    }

    $valueList -join ", `n";
}