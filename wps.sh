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
  PACOTE="flameshot.deb"
  FONTE="$DIR/dados/wps/*"
  #####################################################################################
  #####################################################################################
(
echo "# Procurando o pacote selecionado" ; sleep 1
sleep 1
) |
zenity --progress \
  --title="Encontrando o pacote." \
  --text="Por favor aguarde a instalação..." \
  --pulsate=0 \
   --width=500 --auto-close
########################################################
(
echo "-------------------- INICIANDO INSTALAÇÃO DO PACOTE $PACOTE PARA SEU SISTEMA -------------------" ; sleep 1
echo "Iniciando download do pacote. ⏳" ; sleep 1
echo "----------------------------------------------------------------" ; sleep 1
tempoinicial=`date +%s`
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
zenity --password --title="Autenticação!" | sudo -S dpkg -i $FONTE
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
