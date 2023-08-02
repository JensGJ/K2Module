function Get-K2Environment {

    Get-K2Server -Current | Select-Object -Expandproperty Environment

}