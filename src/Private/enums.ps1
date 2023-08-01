
if (-not ('CBS.Environment' -as [System.Type])) {
	$cSharpCode = @'
using System;

	namespace CBS
	{
		public enum Environment : int
		{
		      PRD,
		      PP,
		      TST,
		      DEV
		}
	}
'@

	Add-Type -TypeDefinition $cSharpCode
}

