Describe 'Module Manifest Tests' {
    BeforeAll{
    . $PSScriptRoot\Shared.ps1
    $scripts = Get-ChildItem $moduleRoot -Include *.ps1, *.psm1, *.psd1 -Recurse
    $testCase = $scripts | Foreach-Object { @{file = $_ } }
        
}
    BeforeEach {
    Write-Host "BeforeEach ..."
    Write-Host $file
    } 
    
    # It 'Passes Test-ModuleManifest' {
    #      Test-ModuleManifest -Path $ModuleManifestPath
    #      $? | Should -Be $true
    #  }

    # TestCases are splatted to the script so we need hashtables
   
    It "Script <file> should be valid powershell" -TestCases $testCase {
        param($file)

        $file.fullname | Should -Exist

        $contents = Get-Content -Path $file.fullname -ErrorAction Stop
        $errors = $null
        $null = [System.Management.Automation.PSParser]::Tokenize($contents, [ref]$errors)
        $errors.Count | Should -Be 0
    }
}
