Write-Verbose "Initializing config.json"
# $K2Config = Get-Content config.json | ConvertFrom-JSON

# $PsScriptRoot | fl *

$K2Config = Get-Content -Path "$($PSScriptRoot)\config.json" -ErrorAction "Stop" | ConvertFrom-JSON

Import-Enums $K2Config -Verbose

$K2Config | fl