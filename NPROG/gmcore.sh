 #!/bin/bash
  #####################################################################################
  #### SUPORTE REGIONAL - PE/PB/AL/RN
  export DIR="$(dirname "$(readlink -f "$0")")"
  #### Nilsonlinux
  OPEN="play $DIR/sounds-alert/window-new.oga"
  CLOSE="play $DIR/sounds-alert/window-close.oga"
  ERRO="play $DIR/sounds-alert/erro.oga"
  CONECTADO="play $DIR/sounds-alert/ok.oga"
  NOME="GMCORE"
  PACOTE="$DIR/dados/gmcore/gmcore.zip"
  #####################################################################################
  #####################################################################################
(
echo "# Buscando pacote..." ; sleep 1
sleep 1
) |
zenity --progress \
  --title="Pacote encontrado." \
  --text="Por favor aguarde..." \
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
echo "-------------------- INICIANDO INSTALAÇÃO DO PROGRAMA $NOME PARA SEU SISTEMA -------------------" ; sleep 1
echo "Copiando atalhos para área de trabalho. ⏳" ; sleep 2
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
unzip -o $PACOTE -d /home/$USER/.icons/ && mv /home/$USER/.icons/GMCORE.desktop "/home/$USER/Desktop/"
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
) | yad --text-info --window-icon "audio-x-generic.png" --title "Informação de processo de instalação do programa." --center --height 250 --width 700 --tail --margins 4 --button="gtk-close"
########################################################
    fi
########################################################
