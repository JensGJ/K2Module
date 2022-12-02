
if (-not ('CBS.Environment' -as [System.Type])) {
	$cSharpCode = @'
using System;

	namespace CBS
	{
		public enum Environment : int
		{
		      PROD,
		      PREPROD,
		      TEST,
		      DEV
		}
	}
'@

	Add-Type -TypeDefinition $cSharpCode
}

