if (-not ('CBS.K2.RelativeURLs' -as [System.Type])) {
	$cSharpCode = @'
using System;

namespace CBS
{
	namespace K2
	{
		public enum RelativeURL
		{
            Management,
			Workspace,
			Designer,
			LandingPage
        }
	}
}
'@

	Add-Type -TypeDefinition $cSharpCode
}

