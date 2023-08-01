---
external help file: K2Module-help.xml
Module Name: K2Module
online version:
schema: 2.0.0
---

# Get-K2DBInstance

## SYNOPSIS
Get-K2DBInstance leverer dns-navnet på databaseserveren tilknyttet K2.

## SYNTAX

```
Get-K2DBInstance [[-Environment] <Environment>] [<CommonParameters>]
```

## DESCRIPTION
Uden parametre levere den en hashtabel med værdierne for alle fire miljøer. 
Angiver man miljø i parameteren Environment, returneres kun den databaseinstans der hører til dér.

## EXAMPLES

### EXAMPLE 1
```
Get-K2DBInstance
```

Returnerer alle DB-instanser med angivelse af hvilket miljø de hører til

### EXAMPLE 2
```
Get-K2DBInstance -Environmnet DEV
```

Returnerer db-instansen for DEV-miljøet

## PARAMETERS

### -Environment
{{ Fill Environment Description }}

```yaml
Type: Environment
Parameter Sets: (All)
Aliases:
Accepted values: PRD, PP, TST, DEV

Required: False
Position: 1
Default value: (Get-K2Environment)
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

## OUTPUTS

## NOTES
Det er alene instansen (eller dns-navnet på instansen) der returneres. 
Der er dermed ingen angivelse af hvilken database på serveren man skal have fat i

## RELATED LINKS

[Specify a URI to a help page, this will show when Get-Help -Online is used.]()

