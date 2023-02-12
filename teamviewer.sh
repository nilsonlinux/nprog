 #!/bin/bash
  #####################################################################################
  #### SUPORTE REGIONAL - SANTA INÊS - MA
  export DIR="$(dirname "$(readlink -f "$0")")"
  #### Nilsonlinux
  IPSERV='192.168'
  OPEN="play $DIR/sounds-alert/window-new.oga"
  CLOSE="play $DIR/sounds-alert/window-close.oga"
  ERRO="play $DIR/sounds-alert/erro.oga"
  CONECTADO="play $DIR/sounds-alert/ok.oga"
  PACOTE="teamviewer_amd64.deb"
  FONTE="https://download.teamviewer.com/download/linux/teamviewer_amd64.deb"
  #####################################################################################
  #####################################################################################
(
echo "# Testando conexão com o a internet" ; sleep 1
sleep 1
) |
zenity --progress \
  --title="Teste de conexão." \
  --text="Verificando conexão..." \
  --pulsate=0 \
   --width=500 --auto-close
########################################################
if ! ping -c 1 8.8.8.8 >> /dev/null ; then
yad --form --title="Informação!" --height=1 --width=500 \
--center --image=$DIR/img/erro.png \
--borders=10 --button="Sair:0"  \
--text="<span font='15' color='#FFBF00'>ERRO! VOCÊ ESTÁ SEM CONEXÃO COM A INTERNET.</span>
<span font='15' color='#FFBF00'>VERIFIQUE SUA CONEXÃO E TENTE NOVAMENTE . . .</span>"
########################################################
else
########################################################
(
echo "-------------------- INICIANDO INSTALAÇÃO DO PACOTE $PACOTE PARA SEU SISTEMA -------------------" ; sleep 1
echo "Iniciando download do pacote. ⏳" ; sleep 1
echo "----------------------------------------------------------------" ; sleep 1
tempoinicial=`date +%s`
wget -O /tmp/$PACOTE $FONTE 2>&1 | sed -u 's/.* \([0-9]\+%\)\ \+\([0-9.]\+.\) \(.*\)/\1\n# Taxa de download \2\/s, Tempo restante \3/' | zenity --progress --title="Baixando pacote." --width=500 --title="Baixando pacote..." --auto-close
#Start a loop testing if zenity is running, and if not kill wget
RUNNING=0
while [ $RUNNING -eq 0 ]
do
if [ -z "$(pidof zenity)" ]
then
  pkill wget
  RUNNING=1
fi
done
echo "A seguir você precisará digitar sua senha. Para processeguir com a instalação." ; sleep 2
zenity --password --title="Autenticação!" | sudo -S gdebi --non-interactive /tmp/$PACOTE
echo "****************************************************************"
echo "***** COMANDO FINALIZADO COM SUCESSO ***** By: Nilsonlinux *****"
echo "****************************************************************"
echo
tempofinal=`date +%s`
soma=`expr $tempofinal - $tempoinicial`
resultado=`expr 10800 + $soma`
tempo=`date -d @$resultado +%H:%M:%S`
echo
echo "🕠 Tempo de instalação: $tempo "
) | yad --text-info --window-icon "audio-x-generic.png" --title "Informação de processo de instalação do programa." --center --height 250 --width 850 --tail --margins 4 --button="gtk-close"
########################################################
    fi
########################################################
