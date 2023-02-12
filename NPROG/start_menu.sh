 #!/bin/bash
  #####################################################################################
  #### SUPORTE REGIONAL - PE/PB/AL/RN
  #### Nilsonlinux
  #####################################################################################
  killall -9 yad
# #####################################################################################
  export DIR="$(dirname "$(readlink -f "$0")")"
  OPEN="play $DIR/sounds-alert/window-new.oga"
  WELCOME="play $DIR/sounds-alert/welcome.ogg"
  CLOSE="play $DIR/sounds-alert/window-close.oga"
  ERRO="play $DIR/sounds-alert/erro.oga"
  CONECTADO="play $DIR/sounds-alert/ok.oga"
  ALERTA="mpv $DIR/sounds-alert/update.mp3"
  WINWELCOME="mpv $DIR/sounds-alert/windows-xp-startup.mp3"
  WINSHUTDOWN="mpv $DIR/sounds-alert/shutdown.mp3"
  OSNAME=$(lsb_release -d | awk '{print $2}')
  OSVERSION=$(lsb_release -r | awk '{print $2}')
  OSCODE=$(lsb_release -c | awk '{print $2}')
  NOME_PROG="NPROG"
  THEME="Nilsonlinux-Theme-Dark"
  #####################################################################################
  version="1.0"
  #########################################
  inicio () {
    play $DIR/sounds-alert/welcome.ogg &>/dev/null;
    }
# VERIFICAÇÃO DE CONEXÃO
  fim () {
    play $DIR/sounds-alert/window-close.oga &>/dev/null;
    }
    #########################################
checkinternet () {
  if ping -c 1 8.8.8.8 &>/dev/null; then
    NPDVsCheck
  else
  notify-send -i dialog-error "PROGRAMA DESCONECTADO. Iniciando em modo offline..." -t 5000
  fi
}
#####################################################################################
atualizar () {
( 
${CONECTADO}
echo "Iniciando atualização." ; sleep 1
echo "Conectando com o servidor de atualizações..." ; sleep 1
echo "Baixando atualizações. Por favor aguarde... ⌛️" ; sleep 1
datainicial=`date +%s`
sudo wget -O /tmp/sistemanpdvs_amd64.deb https://github.com/sistemanpdvs/sistemanpdvs/raw/main/sistemanpdvs-stable_amd64.deb &&
sudo gdebi --non-interactive /tmp/sistemanpdvs_amd64.deb
rm -rf .themes npdvs-grafico && git clone https://sistemanpdvs:armateus2020@github.com/sistemanpdvs/.themes.git && git clone https://sistemanpdvs:armateus2020@github.com/sistemanpdvs/npdvs-grafico.git && chmod +x ./npdvs-grafico/* && chmod +x ./npdvs-grafico/radio/* && cp npdvs-grafico/Nilsonlinux.desktop Área\ de\ Trabalho/ && sudo cp npdvs-grafico/NPDVs-Grafico.desktop /usr/share/applications/""; 
echo "----------------------------------------------------------------" ; sleep 1
echo "Concluíndo atualização." ; sleep 1
echo "----------------------------------------------------------------" ; sleep 1
echo 
echo "****************************************************************"
echo "***** ATUALIZAÇÃO APLICADA COM SUCESSO **** By: Nilsonlinux ****"
echo "****************************************************************"
echo
datafinal=`date +%s`
soma=`expr $datafinal - $datainicial`
resultado=`expr 10800 + $soma`
tempo=`date -d @$resultado +%H:%M:%S`
echo
${CONECTADO} | echo "🕠 Tempo de execução: $tempo "
firefox https://sistemanpdvs.github.io/tabs/contribuir/
) | GTK_THEME="Nilsonlinux-Neon-Originals-Gtk" yad --text-info --window-icon "audio-x-generic.png" --title "INFORMAÇÃO" --center --height 250 --width 570 --tail --margins 4 --button="gtk-close"
}
#####################################################################################
${CLOSE}
# CHECANDO NOVA VERSÃO
NPDVsCheck () {
  changelog=$(curl --silent -q https://raw.githubusercontent.com/sistemanpdvs/version/main/changelog)
  uversion=$(curl --silent -q https://raw.githubusercontent.com/sistemanpdvs/version/main/version)
  if [[ $uversion > $version ]]; then
  echo "              ⚠️⚠️⚠️ Nova versão disponível ⚠️⚠️⚠️

         Versão em uso: $version 🙁 ➤  Nova versão: $uversion 😎
  ----------------------------------------------------------------
         $changelog 
  ----------------------------------------------------------------" |
GTK_THEME="$THEME" yad --text-info --window-icon "audio-x-generic.png" --title "ATUALIZAÇÃO DISPONÍVEL" --center --height 500 --width 670 --tail --margins 4 --button="gtk-close" | ${ALERTA}
atualizar
fi
}
#####################################################################################
# INICIALIZAÇÃO DO SCRIPT
checkinternet 
clear && reset
#####################################################################################
 inicio | GTK_THEME="$THEME" yad --form --title="$NOME_PROG   $(date +%d-%m-%Y)" --height=405 --width=340 \
--center \
--borders=5 \
--text="
<span font='28' font_weight='bold' font-family='ubuntu' color='#6E6E6E'>                                $NOME_PROG</span><span font='20'>®
<span font_weight='bold' font='08' color='#4A90D9'>                                                                        PAINEL ADMINISTRATIVO PARA AUTOMATIZAÇÃO DE PROCESSOS.</span>
</span>                                                                     🐧 S.O: $OSNAME  Versão: $OSVERSION  -  Desenvolvido por: <span font_weight='bold' color='#FFFF00'>Nilsonlinux 👨🏻‍💻</span>
<span font='10' font-family='ubuntu' color='#FF1493'> VR </span><span font-family='ubuntu' font_weight='bold' font='14' color='#00FF00'>$version</span>" \
--columns=3 \
--field="   GMCORE!$DIR/img/GMCORE.png!<span color='#5CF30B' font_weight='bold'>Instalação Rdesktop e FreeRDP com atalhos</span>":fbtn $DIR/gmcore.sh \
--field="   AnyDesk!$DIR/img/anydesk.png!<span color='#5CF30B' font_weight='bold'>O Software para Computador Remoto</span>":fbtn $DIR/anydesk.sh \
--field="   Geany!$DIR/img/geany.png!<span color='#5CF30B' font_weight='bold'>IDE para edição e criação de códigos ...</span>":fbtn $DIR/geany.sh \
--field="   TeamViewer!$DIR/img/teamviewer.png!<span color='#5CF30B' font_weight='bold'>Suporte remoto, acesso remoto, assistência ...</span>":fbtn $DIR/teamviewer.sh \
--field="   Chrome!$DIR/img/chrome.png!<span color='#5CF30B' font_weight='bold'>Navegador Google Chrome ...</span>":fbtn $DIR/chrome.sh \
--field="   Flameshot!$DIR/img/flameshot.svg!<span color='#5CF30B' font_weight='bold'>Ferramenta para capturar tela ...</span>":fbtn $DIR/flameshot.sh \
--scroll "auto" \
--button='🌎 MaxiPOS:sensible-browser "pdv.mateus/maxipos_backoffice/app"' \
--button='🌎 E-Mail Mateus:sensible-browser "email.grupomateus.com.br/"' \
--button='🌎 e-Sitef:sensible-browser "sitefconciliacao.softwareexpress.com.br/sitefweb/"' \
--button='🌎 Jira:sensible-browser "grupomateus.atlassian.net/servicedesk/customer/portals"' \
--button='🌎 DownDetector:sensible-browser "downdetector.com.br"' \
--button='🌎 Github page:sensible-browser "github.com/sistemanpdvs/npdvs-grafico"' \
###########################################################################################
fim
######## FIM
