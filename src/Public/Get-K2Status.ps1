function Get-K2Status {

    # 
    $Service = Get-CimInstance -ClassName win32_service -Filter "name ='K2 Server'"

	if (-not ($Service)){
		Write-Warning "K2 Service not found on $env:COMPUTERNAME. This command is only supported on a K2 Server"
		break;
	}



	try {
		# Try getting the process with the username
		$Process = Get-Process K2HostServer -IncludeUserName -ErrorAction Stop
	}
	catch {
		# If it is not allowed, retrive the process without username
		# Write-Warning "Command is not run as Administrator - Process.User will not be retrieved "
		$Process = Get-Process K2HostServer -ErrorAction SilentlyContinue	
		
	}

	if ($Process){
		$RunStatus = "Running"

		$Uptime = ""
		if ($Process.starttime -is [DateTime]){
			$Uptime = New-Timespan -start $Process.starttime
		}
		
		if ($Service.ProcessId -eq $Process.Id){
			$RunType = "Running as service"
		} else {
			$RunType = "Running as console"
		}
	}
	else 
	{
			$RunStatus = "Stopped"
			$RunType = "Unknown (stopped)"
	}

    [pscustomobject]@{
		RunStatus = $RunStatus
		ServiceStatus = $Service.State
        Name = $Service.Name
        UserAccount = $Service.StartName #$Process.username # 
        ProcessId = $Process.Id
        StartTime = $Process.StartTime
		UpTime = $Uptime
		Path = $Service.PathName # $Process.Path
		Responding = $Process.Responding
		RunType = $RunType
    }

}
