
# if (-not ('CBS.Environment' -as [System.Type])) {
# 	$cSharpCode = @'
# using System;

# 	namespace CBS
# 	{
# 		public enum Environment : int
# 		{
# 		      PRD,
# 		      PP,
# 		      TST,
# 		      DEV
# 		}
# 	}
# '@

# 	Add-Type -TypeDefinition $cSharpCode
# }


# if (-not ('K2.Directory' -as [System.Type])) {
# 	$cSharpCode = @'
# using System;

# 	namespace K2
# 	{
# 		public enum Directory : int
# 		{
# 			Certificate,
# 			Deploy,
# 			EndpointAssemblies,
# 			HostServerBin,
# 			HostServerLogs,
# 			K2Logs,
# 			ServiceDescriptions
# 		}
# 	}
# '@

# 	Add-Type -TypeDefinition $cSharpCode
# }

