If (-not (Test-Path "$(pwd)/bash-aliases-framework")) {
    git clone git@github.com:nicolachoquet06250/bash-aliases-framework.git
}

Remove-Item -Recurse -Force "$(Get-Location)/bash-aliases-framework/.git/hooks/post-checkout"
New-Item -ItemType SymbolicLink -Path "$(Get-Location)/bash-aliases-framework/.githooks/post-checkout.ps1" -Target "$(Get-Location)/bash-aliases-framework/.git/hooks/post-checkout.ps1"
Set-ExecutionPolicy Bypass -command "$(Get-Location)/bash-aliases-framework/.githooks/post-checkout.ps1"

. "$(Get-Location)/bash-aliases-framework/.git/hooks/post-checkout.ps1" "install-script"

If (-not (Test-Path "$(Get-Location)/bash-alias-clipboard")) {
    git clone git@github.com:nicolachoquet06250/bash-alias-clipboard.git
}

Remove-Item -Recurse -Force "$(Get-Location)/bash-alias-clipboard/.git/hooks/post-checkout"
New-Item -ItemType SymbolicLink -Path "$(Get-Location)/bash-alias-clipboard/.githooks/post-checkout.ps1" -Target "$(Get-Location)/bash-alias-clipboard/.git/hooks/post-checkout.ps1"
Set-ExecutionPolicy Bypass -command "$(Get-Location)/bash-alias-clipboard/.githooks/post-checkout.ps1"

. "$(Get-Location)/bash-alias-clipboard/.git/hooks/post-checkout" "install-script"

If (-not (Test-Path "$HOME/.bash-aliases-norsys")) {
    $path = ""
    If ($args[1] -eq "install-script") {
        $path = "/bash-aliases-norsys"
    }
    New-Item -ItemType SymbolicLink -Path "$(Get-Location)$path" -Target "$HOME/.bash-aliases-norsys"
}

$file_path=".bash-aliases-norsys/.aliases.ps1"
$source="source \"\$HOME/$file_path\""

If (-not (Select-String $profile -Pattern $source)) {
    Set-Content -Path $profile -Value $source
}