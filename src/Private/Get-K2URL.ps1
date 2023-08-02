function Get-K2Url {
        [CmdletBinding()]
        param (
            [Parameter(Mandatory=$true)]
            [K2.RelativeURL]
            $RelativeURL,

            [Parameter(Mandatory=$false)]
            [CBS.Environment]
            $Environment = (Get-K2Environment)



        )

    begin {

    }

    process {
        $K2server = Get-K2Host -Environment $Environment;

        $url = 
        switch ($RelativeURL) {
            LandingPage   { "Runtime/Runtime/Form/LandingPageForretning.form" }
            Default {$RelativeURL.ToString() }
        }

        return $K2server + $url
    }

    end {

    }
}