# Invoke-Expression = eval

function norsys {
    If ("${ALIASES_FRAMEWORK_DEFINED}" -eq $null) {
        Write-Output ""
        Write-Output "❌ Le framework d'aliases n'est pas importé !"
        Write-Output ""
        return
    }

    Invoke-Expression $(framework_flag)

    function logo {
        $title="norsys"
        $title_font_family="$(framework_figlet_font_path "electronic")"

        Write-Output "
                                                             █
                  ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
                 ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
                 ░░░░░░░░░░     ░░░░░░░     ░░░░░░░░░░░░░░░░
                 ░░░░░░░░   █ █ ░░░░░░░ ███    ░░░░░░░░░░░░░
                 ░░░░░░░  ██    ░░░░░░░      █ ░░░░░░░░░░░░░░
                 ░░░░░░░ ██  ░░░░░░░░░      ██    ░░░░░░░░░░░
                 ░░░░░░░ █  ░░░░░░░░   ▓██   █ █▓     ░░░░░░░
                 ░░░░░░░ █ ░░░░░░░   █     ░  ██  █ █  ░░░░░░
                ░░░░░░░░ █  ░░░░░  █  █ ░░░░░ █    ███  ░░░░░
                ░░░░░░░░ ██       █           █ ░░  █ █ ░░░░░
    ██          ░░░       ██  █  █▓░  ████ █ █  ░░░  ▓█  ░░░░
      █       █ ░░░ ███  █ ██ ▒  █ █           ░░░░░ ███ ░░░░
        ███       ░           █  █     █  ██▒  ░░░░░  █  ░░░░
              ▓ █ ░    ░░░ █   ███   ██ █    █   ░░░ ██ ░░░░░
          █ █     ░ █ ░░░   █     █       ░░  ██ ░░  ▒  ░░░░░
                ░░░   ░░░ ██  ░░  ▓▓   ░░░░░░  █    ██ ░░░░░░
                ░░░░░░░░░ █  ░░░░  ▒██         █ ███   ░░░░░░
                ░░░░░░░░░  █░ ░░░░     █ ████████    ░░░░░░░░
                ░░░░░░░░░░ █▒  ░░░░░░░       ▓    ░░░░░░░░░░░
                ░░░░░░░░░░  ██    ░░░░░    ███ ░░░░░░░░░░░░░
                ░░░░░░░░░░░   ███ ░     █ ██   ░░░░░░░░░░░░░
                ░░░░░░░░░░░░░   █ ░ ██░ █    ░░░░░░░░░░░░░░░
                ░░░░░░░░░░░░░░░   ░       ░░░░░░░░░░░░░░░░░
                    ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░     ░
               █                                             █"

        framework_title --text "${title}" --font "${title_font_family}" --line_prefix "  " -st
    }

    function help {
        return $(framework_create_help "norsys" @(
            "norsys passwd:cp"
            "⬆️  (alias) norsys pw:cp"
            ""
            "norsys tools:site:list [--whereis|-wi] [--category|-cat <searched category>] [--categories]"
            "⬆️  (alias) norsys tools:s:l [--whereis|-wi] [--category|-cat <searched category>] [--categories]"
        ))
    }
    Invoke-Expression $(framework_sub_command -n "help")

    function tools_sites_list {
        $file_path="${HOME}/.norsys-tools-sites"

        If (-not (Test-Path $file_path)) {
            Write-Output "- Documentations
Vuetify=https://vuetifyjs.com/en/
Bun.js=https://bun.sh/
Deno=https://deno.com/
Angular 17-=https://angular.io/?utm_source=homescreen
Angular 17+=https://angular.dev/
VueUse=https://vueuse.org/
VueMacro=https://vue-macros.sxzz.moe/
SvelteUse=https://svelte-use.vercel.app/
Material Design Lite (MUI)=https://mui.com/
TypeScript=https://www.typescriptlang.org/

- Tools
Create Beautiful images of your code=https://ray.so/
imagecolorpicker.com=https://imagecolorpicker.com/
Regex101=https://regex101.com/
Omatsuri=https://omatsuri.app/?homescreen=1
Chmod Calculator=https://www.nettools.club/chmod_calc
readme.so=https://readme.so/fr
10015Tools=https://10015.io/
CSS Gradient Generator=https://www.joshwcomeau.com/gradient-generator/
GetWaves=https://getwaves.io/
Photopea=https://www.photopea.com/?utm_source=homescreen
Computed Diff=https://www.diffchecker.com/text-compare/
GetNada=https://getnada.cc/
Smiley.cool=https://smiley.cool/fr/emoji-list.php
OnlinePHP.io=https://onlinephp.io/
ChatGPT=https://chat.openai.com/
ImageToText=https://www.imagetotext.info/
ImageToASCII=https://www.asciiart.eu/image-to-ascii
TextToASCII=https://www.asciiart.eu/text-to-ascii-art
Ascii & Art service=https://www.asciiart.eu/
Bash en ligne=https://www.jdoodle.com/test-bash-shell-script-online

- Regex
Regex101=https://regex101.com/
Testeur de regex=https://regexr.com/2rhq7

- Norsys
Norsys Daily=https://norsys-daily.norsys.fr/
NorsysWays=https://norsysways.norsys.fr/
Norsys Democracy 2.0=https://democracy.norsys.fr/
Norsys CV=https://norsys-cv.norsys.fr/" > $file_path
        }

        If ($(flag "whereis" "wi") -eq $true) {
            Write-Host -NoNewline " $(framework_link "${file_path}" "$(framework_format --underline -t "${file_path}")")"
            return
        }

        If (-not (Test-Path $file_path)) {
            touch $file_path
        }

        If ("$(cat "${file_path}")" == "") {
            return framework_warning_message "Aucun site n'a été enregistré"
        }

        $category=$(flag "category" "cat")
        $show_only_categories=$(flag "categories")

        If ($show_only_categories -eq $false) {
            framework_warning_message "$( framework_format --weight -t "La liste ci-dessous est clickable (ctrl-click)" )"
            Write-Output ""
        }

        $lines = "$(cat "${file_path}")".Split("\n")

        $category_selected=$false
        $window_length = $(tput cols)
        $cmp = 0
        foreach ($line in $lines) {
            If ($line.Substring(0, 2) -eq "- ") {
                If ((($show_only_categories -eq $false) -and (($category -eq $false) -or ($category_selected -eq $true))) -and ($cmp -gt 0)) {
                    Write-Output ""
                }
                $width = 80
                If (80 -gt $window_length) {
                    $width = $window_length
                }

                $left = "|= "
                $right = " =|"

                $title = $(framework_format --underline -t $line.SubString(2, ($line.Length - 2)))

                $left_limit = (($width / 2) - ($title.Length / 2)) - 1

                $half_title_length = $title.Length / 2
                If ($half_title_length.GetType().Name -eq "Double") {
                    $left_limit++
                }

                $left_part = $left
                for ($i=0; $i<$left_limit; $i++) {
                    $left_part += "="
                }

                $right_part = ""
                for ($i=0; $i<((($width / 2) - ($title.Length / 2)) - 1); $i++) {
                    $right_part += "="
                }
                $right_part += $right

                If (($show_only_categories -eq $true) -or ($category -eq $false) -or ($category -eq $line.Substring(2))) {
                    $category_selected = $true
                    If ($show_only_categories -eq $true) {
                        Write-Output " • $(framework_format --underline -t $line.Substring(2))"
                    } else {
                        Write-Output "${left_part} $( framework_format --underline -t $line.SubString(2, ($line.Length - 2)) ) ${right_part}"
                        Write-Output ""
                    }
                } else {
                    $category_selected = $false
                }
                continue
            }

            If (($show_only_categories -eq $false) -and (($category -eq $false) -or ($category_selected -eq $true))) {
                If ( $line.Contains("=")) {
                    $parts = $line.Split("=")

                    Write-Host -NoNewline " • $( framework_link "${parts[1]}" "$( framework_format --underline -t "${parts[0]}" )" )"
                    Write-Output ""
                }
                else {
                    Write-Host -NoNewline " • $( framework_link "${line}" )"
                }
            }

            $cmp++
        }
    }
    Invoke-Expression $(framework_sub_command -n "tools:sites:list" -s "tools:s:l")

    function passwd_cp {
        If (-not (Test-Path "${HOME}/.norsys-ldap-password")) {
            touch "${HOME}/.norsys-ldap-password"
        }

        If ("$(cat "${HOME}/.norsys-ldap-password")" -eq "") {
            framework_warning_message "Saisissez votre mot de passe dans un fichier $(framework_link "${HOME}/.norsys-ldap-password" "${HOME}/.norsys-ldap-password")"
            return;
        }

        clipboard copy "$(cat "${HOME}/.norsys-ldap-password")"
    }

    Invoke-Expression $(framework_sub_command -n "passwd:cp" -s "pw:cp")

    Invoke-Expression $(framework_generate_shorts_commands)
    Invoke-Expression $(framework_command_checker --with-help)

    If (($chosen_command -ne "passwd:cp") -and ($chosen_command -ne "pw:cp")) {
        logo
    }

    Invoke-Expression $(framework_run_command)
}