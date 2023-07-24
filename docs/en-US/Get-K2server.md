---
external help file: K2Module-help.xml
Module Name: K2Module
online version:
schema: 2.0.0
---

# Get-K2server

## SYNOPSIS
Show information about K2 Servers

## SYNTAX

### NameFilter
```
Get-K2server [[-Environment] <String[]>] [[-Role] <String[]>] [[-ServerNumberFilter] <String>]
 [<CommonParameters>]
```

### IP
```
Get-K2server -IP <String> [<CommonParameters>]
```

### Current
```
Get-K2server [-Current] [<CommonParameters>]
```

## DESCRIPTION
TBD

## EXAMPLES

### EXAMPLE 1
```
Get-K2server -Current
```

### EXAMPLE 2
```
Get-K2server -Environment PROD
```

### EXAMPLE 3
```
Get-K2server -Role APP
```

## PARAMETERS

### -Environment
Select which environment(s) to show.
Possible values: ALL, PROD (P, PRD), PREPROD (PP), TEST (TST)
Default value: ALL

```yaml
Type: String[]
Parameter Sets: NameFilter
Aliases:

Required: False
Position: 1
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Role
Select which SQL Roles to search for.
Possible values: ALL, DB, AR, A, R, WIT
Default value: ALL

```yaml
Type: String[]
Parameter Sets: NameFilter
Aliases:

Required: False
Position: 2
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -ServerNumberFilter
{{ Fill ServerNumberFilter Description }}

```yaml
Type: String
Parameter Sets: NameFilter
Aliases:

Required: False
Position: 3
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -IP
Select servers with a specific IP address.

```yaml
Type: String
Parameter Sets: IP
Aliases:

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -Current
Get K2 serverinfo for the current server

```yaml
Type: SwitchParameter
Parameter Sets: Current
Aliases:

Required: True
Position: Named
Default value: False
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### List of K2 Server objects
## NOTES
Role, enviroment and servernumber are extracted from the 4 part server name

## RELATED LINKS

[about_functions_advanced]()

[about_comment_based_help]()

