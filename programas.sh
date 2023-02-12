 #!/bin/bash
  #####################################################################################
  #### SUPORTE REGIONAL - SANTA INÊS - MA
  #### Nilsonlinux
  #####################################################################################
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
  NOME_PROG="NPROG - Instalador de software Offline"
  THEME="Nilsonlinux-Theme-Dark"
  #####################################################################################
  version="1.0"
  #########################################
  sudo su -y
#####################################################################################
#####################################################################################
#####################################################################################
 $WINWELCOME | GTK_THEME="$THEME" yad --form --title="$NOME_PROG   $(date +%d-%m-%Y) " --height=500 --width=990 \
--center --image=$DIR/img/programas.png \
--borders=10  \
--text="
<span font='35' font_weight='bold' font-family='ubuntu' color='#6E6E6E'>   $NOME_PROG</span><span font='20'>® 
<span font_weight='bold' font='08' color='#4A90D9'>                                                                                                NILSONLINUX SOFTWARE - PROGRAMA PARA INSTALAÇÃO</span>
</span>                                         🐧 S.O: $OSNAME  Versão: $OSVERSION  Desenvolvido por: <span font_weight='bold' color='#616161'>Nilsonlinux 👨🏻‍💻</span>
<span font='10' font-family='ubuntu' color='#FF1493'>                                                                                                                    VR</span><span font-family='ubuntu' font_weight='bold' font='14' color='#00FF00'>$version</span>
" \
--columns=5 \
--field="   AnyDesk!$DIR/img/anydesk.png!<span color='#5CF30B' font_weight='bold'>O Software para Computador Remoto</span>":fbtn $DIR/anydesk.sh \
--field="   TeamViewer!$DIR/img/teamviewer.png!<span color='#5CF30B' font_weight='bold'>Suporte remoto, acesso remoto, assistência ...</span>":fbtn $DIR/teamviewer.sh \
--field="   Geany!$DIR/img/geany.png!<span color='#5CF30B' font_weight='bold'>IDE para edição e criação de códigos ...</span>":fbtn $DIR/geany.sh \
--field="   Chrome!$DIR/img/chrome.png!<span color='#5CF30B' font_weight='bold'>Navegador Google Chrome ...</span>":fbtn $DIR/chrome.sh \
--field="   Chrome!$DIR/img/chrome.png!<span color='#5CF30B' font_weight='bold'>Navegador Google Chrome ...</span>":fbtn $DIR/chrome.sh \
--field="   Chrome!$DIR/img/chrome.png!<span color='#5CF30B' font_weight='bold'>Navegador Google Chrome ...</span>":fbtn $DIR/chrome.sh \
--field="   Flameshot!$DIR/img/flameshot.webp!<span color='#5CF30B' font_weight='bold'>Navegador Google Chrome ...</span>":fbtn $DIR/flameshot.sh \
--field="   Chrome!$DIR/img/chrome.png!<span color='#5CF30B' font_weight='bold'>Navegador Google Chrome ...</span>":fbtn $DIR/chrome.sh \
--field="   Chrome!$DIR/img/chrome.png!<span color='#5CF30B' font_weight='bold'>Navegador Google Chrome ...</span>":fbtn $DIR/chrome.sh \
--field="   Chrome!$DIR/img/chrome.png!<span color='#5CF30B' font_weight='bold'>Navegador Google Chrome ...</span>":fbtn $DIR/chrome.sh \
--field="   Chrome!$DIR/img/chrome.png!<span color='#5CF30B' font_weight='bold'>Navegador Google Chrome ...</span>":fbtn $DIR/chrome.sh \
--field="   Chrome!$DIR/img/chrome.png!<span color='#5CF30B' font_weight='bold'>Navegador Google Chrome ...</span>":fbtn $DIR/chrome.sh \
--button="FECHAR":1
###########################################################################################
$WINSHUTDOWN
clear
######## FIM
