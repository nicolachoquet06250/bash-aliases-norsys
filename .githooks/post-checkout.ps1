If (-not (Test-Path "$(Get-Location)/bash-aliases-framework")) {
    git clone git@github.com:nicolachoquet06250/bash-aliases-framework.git
}

If (Test-Path "$(Get-Location)/bash-aliases-framework/.git/hooks/post-checkout.ps1")
{
    Remove-Item -Recurse -Force "$( Get-Location )/bash-aliases-framework/.git/hooks/post-checkout.ps1"
}
New-Item -ItemType SymbolicLink -Path "$(Get-Location)/bash-aliases-framework/.git/hooks/post-checkout.ps1" -Target "$(Get-Location)/bash-aliases-framework/.githooks/post-checkout.ps1"

powershell "$(Get-Location)/bash-aliases-framework/.git/hooks/post-checkout.ps1" "install-script"

If (-not (Test-Path "$(Get-Location)/bash-alias-clipboard")) {
    git clone git@github.com:nicolachoquet06250/bash-alias-clipboard.git
}

If (Test-Path "$(Get-Location)/bash-alias-clipboard/.git/hooks/post-checkout.ps1")
{
    Remove-Item -Recurse -Force "$( Get-Location )/bash-alias-clipboard/.git/hooks/post-checkout.ps1"
}

New-Item -ItemType SymbolicLink -Path "$(Get-Location)/bash-alias-clipboard/.git/hooks/post-checkout.ps1" -Target "$(Get-Location)/bash-alias-clipboard/.githooks/post-checkout.ps1"

powershell "$(Get-Location)/bash-alias-clipboard/.git/hooks/post-checkout" "install-script"

If (-not (Test-Path "$HOME/.bash-aliases-norsys")) {
    $path = ""
    If ($args[1] -eq "install-script") {
        $path = "/bash-aliases-norsys"
    }
    New-Item -ItemType SymbolicLink -Path  "$HOME/.bash-aliases-norsys" -Target "$(Get-Location)$path"
}
