---
external help file: K2Module-help.xml
Module Name: K2Module
online version:
schema: 2.0.0
---

# Get-K2server

## SYNOPSIS
Listing information about SQLservers in the HA Cluster

## SYNTAX

```
Get-K2server [[-Environment] <String[]>] [[-Role] <String[]>] [[-ServerNumberFilter] <String>] [[-IP] <String>]
 [<CommonParameters>]
```

## DESCRIPTION
TBD

## EXAMPLES

### EXAMPLE 1
```
Get-SQLservers -Environment PROD
```

### EXAMPLE 2
```
Get-SQLservers -ServerNumber 201 -Role DB
```

## PARAMETERS

### -Environment
Select which environment(s) to show.
Possible values: ALL, PROD (P, PRD), PREPROD (PP), TEST (TST)
Default value: ALL

```yaml
Type: String[]
Parameter Sets: (All)
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
Parameter Sets: (All)
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
Parameter Sets: (All)
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
Parameter Sets: (All)
Aliases:

Required: False
Position: 4
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

### List of Custom SQLserver objects
## NOTES
TBD

## RELATED LINKS

[about_functions_advanced]()

[about_comment_based_help]()

