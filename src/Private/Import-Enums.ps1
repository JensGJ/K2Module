function Import-Enums {
    [CmdletBinding()]
    param (
        [Parameter()]
        [PSCustomObject]
        $K2config = $K2config
    )

    # Import the JSON-parsed data from config.json and read and add all enums

    foreach ($enum in $K2config.enums) {
        Write-Verbose "Adding $($enum.namespace).$($enum.EnumName)"
        $values = Get-EnumValues $enum
        Add-CSharpType -Namespace $enum.namespace -EnumName $enum.EnumName -EnumValues $values        

        #Write-Verbose "Done:"
        #Write-Verbose ( [$($enum.namespace).$($enum.EnumName)].DeclaredMembers) | Where-Object Attributes -Like "*Static*" | Select-Object Name, FieldType
    } 
}