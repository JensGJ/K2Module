---
external help file: K2Module-help.xml
Module Name: K2Module
online version:
schema: 2.0.0
---

# Set-K2ModuleDefault

## SYNOPSIS
{{ Fill in the Synopsis }}

## SYNTAX

### browser (Default)
```
Set-K2ModuleDefault -browsername <String> [<CommonParameters>]
```

### environment
```
Set-K2ModuleDefault -FallBackEnvironment <Environment> [<CommonParameters>]
```

### RelativeUrl
```
Set-K2ModuleDefault -RelativeUrl <RelativeUrl> [<CommonParameters>]
```

## DESCRIPTION
{{ Fill in the Description }}

## EXAMPLES

### Example 1
```powershell
PS C:\> {{ Add example code here }}
```

{{ Add example description here }}

## PARAMETERS

### -FallBackEnvironment
{{ Fill FallBackEnvironment Description }}

```yaml
Type: Environment
Parameter Sets: environment
Aliases:
Accepted values: PRD, PP, TST, DEV

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -RelativeUrl
{{ Fill RelativeUrl Description }}

```yaml
Type: RelativeUrl
Parameter Sets: RelativeUrl
Aliases:
Accepted values: Management, Workspace, Designer, LandingPage

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### -browsername
{{ Fill browsername Description }}

```yaml
Type: String
Parameter Sets: browser
Aliases:
Accepted values: chrome, edge, firefox

Required: True
Position: Named
Default value: None
Accept pipeline input: False
Accept wildcard characters: False
```

### CommonParameters
This cmdlet supports the common parameters: -Debug, -ErrorAction, -ErrorVariable, -InformationAction, -InformationVariable, -OutVariable, -OutBuffer, -PipelineVariable, -Verbose, -WarningAction, and -WarningVariable. For more information, see [about_CommonParameters](http://go.microsoft.com/fwlink/?LinkID=113216).

## INPUTS

### None

## OUTPUTS

### System.Object
## NOTES

## RELATED LINKS
