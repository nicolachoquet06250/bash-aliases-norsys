#!/bin/bash

function norsys() {
  if [[ "${ALIASES_FRAMEWORK_DEFINED}" == "" ]];then
    echo ""
    echo "❌ Le framework d'aliases n'est pas importé !"
    echo ""
    return
  fi

  eval "$(framework_flag)"

  function logo() {
    title="norsys"
    title_font_family="$(framework_figlet_font_path "electronic")"

    echo "
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

  function help() {
    commands_lines=(
      "norsys passwd:cp"
      "⬆️  (alias) norsys pw:cp"
      ""
      "norsys tools:site:list [--whereis|-wi] [--category|-cat <searched category>] [--categories]"
      "⬆️  (alias) norsys tools:s:l [--whereis|-wi] [--category|-cat <searched category>] [--categories]"
    )

    framework_create_help "norsys" "${commands_lines[@]}"
  }
  eval "$(framework_sub_command -n "help")"

  function tools_sites_list() {
    file_path="${HOME}/.norsys-tools-sites"

    if [[ ! -f "${file_path}" ]];then
      echo "- Documentations
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
Norsys CV=https://norsys-cv.norsys.fr/" > "${file_path}"
    fi

    if [[ "$(flag "whereis" "wi")" == true ]];then
      echo -n " $(framework_link "${file_path}" "$(framework_format --underline -t "${file_path}")")"
      return
    fi

    [[ ! -f "${file_path}" ]] && touch "${file_path}"

    if [[ "$(cat "${file_path}")" == "" ]];then
      framework_warning_message "Aucun site n'a été enregistré"
      return;
    fi

    category="$(flag "category" "cat")"
    show_only_categories="$(flag "categories")"

    if [[ "${show_only_categories}" == false ]];then
      framework_warning_message "$(framework_format --weight -t "La liste ci-dessous est clickable (ctrl-click)")"
      echo ""
    fi

    IFS=$'\n'
    read -rd '' -a lines <<<"$(cat "${file_path}")"

    category_selected=false
    window_length=$(tput cols)
    cmp=0
    for line in "${lines[@]}";do
      if [[ "${line:0:2}" == "- " ]];then
        {
          [[ "${show_only_categories}" == false ]] &&
          {
            [[ "${category}" == false ]] ||
            [[ "${category_selected}" == true ]]
          }
        } && [[ $cmp -gt 0 ]] && echo ""
        width=80
        [[ 80 -gt $window_length ]] && width=$window_length

        left="|= "
        right=" =|"

        title="$(framework_format --underline -t "${line:2:$((${#line} - 2))}")"

        left_limit=$((((width / 2) - (${#title} / 2)) - 1))
        [[ ! "$(echo "scale=2; ${#title}/2" | bc)" =~ .5 ]] && left_limit=$((left_limit+1))

        left_part="${left}"
        for ((i=0; i<left_limit;i++));do
          left_part+="="
        done

        right_part=""
        for ((i=0; i<$((((width / 2) - (${#title} / 2)) - 1));i++));do
          right_part+="="
        done
        right_part+="${right}"

        if {
          [[ "${show_only_categories}" == true ]] ||
          [[ "${category}" == false ]] ||
          [[ "${category}" == "${line:2:$((${#line} - 2))}" ]]
        };then
          category_selected=true
          if [[ "${show_only_categories}" == true ]];then
            echo " • $(framework_format --underline -t "${line:2:$((${#line} - 2))}")"
          else
            echo "${left_part} $(framework_format --underline -t "${line:2:$((${#line} - 2))}") ${right_part}"
            echo ""
          fi
        else
          category_selected=false
        fi
        continue
      fi

      if [[ "${show_only_categories}" == false ]] && {
        [[ "${category}" == false ]] ||
        [[ "${category_selected}" == true ]]
      };then
        if [[ "${line}" =~ "=" ]];then
          IFS=$'='
          read -rd '' -a parts <<<"${line}"
          echo -n " • $(framework_link "${parts[1]}" "$(framework_format --underline -t "${parts[0]}")")"
          echo ""
        else
          echo -n " • $(framework_link "${line}")"
        fi
      fi

      cmp=$((cmp+1))
    done
  }
  eval "$(framework_sub_command -n "tools:sites:list" -s "tools:s:l")"

  function passwd_cp() {
    if [[ ! -f "${HOME}/.norsys-ldap-password" ]];then
      touch "${HOME}/.norsys-ldap-password"
    fi

    if [[ "$(cat "${HOME}/.norsys-ldap-password")" == "" ]];then
      framework_warning_message "Saisissez votre mot de passe dans un fichier $(framework_link "${HOME}/.norsys-ldap-password" "${HOME}/.norsys-ldap-password")"
      return;
    fi

    clipboard copy "$(cat "${HOME}/.norsys-ldap-password")"
  }
  eval "$(framework_sub_command -n "passwd:cp" -s "pw:cp")"

  eval "$(framework_run --with-help --except-logo "passwd:cp")"
}