BeforeAll{
    Write-Host -ForegroundColor Blue "Beforeall..."
    . $PSScriptRoot\Shared.ps1
    $scripts = Get-ChildItem $moduleRoot -Include *.ps1, *.psm1, *.psd1 -Recurse
    $testCase = $scripts | Foreach-Object { @{file = $_ } }

    # $ModulePath = Split-Path -Parent $MyInvocation.MyCommand.Path

    # # Support tests-directory
    # if ((Split-Path -Leaf $ModulePath) -eq "Tests"){
    #     $ModulePath = Split-Path -Parent $ModulePath
    # }

#    $ModuleName = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -Replace ".Tests.ps1"

    #$ManifestPath   = "$ModulePath\$ModuleName.psd1"
    $ManifestPath = $ModuleManifestPath

    Write-Host $ManifestPath -ForegroundColor Blue

}
# test the module manifest - exports the right functions, processes the right formats, and is generally correct
Describe "Manifest" {
    $Manifest = $null
    It "has a valid manifest" {
        {
            $Script:Manifest = Test-ModuleManifest -Path $ManifestPath -ErrorAction Stop -WarningAction SilentlyContinue
        } | Should -Not -Throw
    }

    It "has a valid name" {
        $Manifest.Name | Should -Be $ModuleName
    }

	It "has a valid root module" {
        $Manifest.RootModule | Should -Be "$ModuleName.psm1"
    }

	It "has a valid Description" {
        $Manifest.Description | Should -Not -BeNullOrEmpty
    }

    It "has a valid guid" {
        $Manifest.Guid | Should -Not -BeNullOrEmpty
    }

    # Skal rettes så funktionerne så ikke længere har prefixes.
	# It "has a valid prefix" {
	# 	$Manifest.Prefix | Should -Not -BeNullOrEmpty
	# }

	It "has a valid copyright" {
		$Manifest.CopyRight | Should -Not -BeNullOrEmpty
	}

    It "exports all public functions (number comparison)"{
        $FunctionFiles = Get-ChildItem "$ModuleRoot\Public" -Filter *.ps1  
        $Manifest.ExportedFunctions.Values | Should -HaveCount $FunctionFiles.Count
    }
    

	It 'exports all public functions' {
		$FunctionFiles = Get-ChildItem "$ModuleRoot\Public" -Filter *.ps1 | Select -ExpandProperty BaseName
		$FunctionNames = $FunctionFiles | ForEach-Object {$_ -replace '-', "-$($Manifest.Prefix)"}
		$ExFunctions = $Manifest.ExportedFunctions.Values.Name
		foreach ($FunctionName in $FunctionNames)
		{
			$ExFunctions -contains $FunctionName | Should -Be $true
		}
	}
}