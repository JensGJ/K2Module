function Enter-K2Location {
    [CmdletBinding()]
    param (
        # Named K2location
        [Parameter(Mandatory=$true)]
        [K2.K2Directory]
        $CommonK2Directory
    )

        Push-Location -StackName K2Navigation $K2Config.K2Directories.$CommonK2Directory
}