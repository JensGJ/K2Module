# Dot source this script in any Pester test script that requires the module to be imported.

Write-Host -ForegroundColor DarkMagenta ".\Shared.ps1 running"
$ModuleManifestName = 'K2Module.psd1'
$ModuleName = "K2Module"
$ModuleManifestPath = "$PSScriptRoot\..\$ModuleManifestName"

$ModuleRoot = "$PSScriptRoot\.."
# -Scope Global is needed when running tests from inside of psake, otherwise
# the module's functions cannot be found in the K2Module\ namespace
Import-Module $ModuleManifestPath -Scope Global -Verbose

