function Get-K2Environment {

    Get-K2Server -Current | Select -Expandproperty Environment

}