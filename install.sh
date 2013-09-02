#!/bin/sh
# Simple installer for Big Data ecosystem shapes
# https://github.com/lbendig/dia-shapes-big-data
#
TMPFILE=`tempfile`

DIA_HOME="$HOME/.dia"
ADDON_NAME="big_data_ecosystem"
SHEETS_DIR="$DIA_HOME/sheets"
SHAPES_DIR="$DIA_HOME/shapes/$ADDON_NAME"

BASE="https://github.com/lbendig/dia-shapes-big-data/archive/master.zip"

if [ ! -d $DIA_HOME ]; 
then
  echo "Can't find DIA_HOME!"
  exit 1
fi

if [ "$(pidof dia-normal)" ] 
then
  echo "Dia is running, please exit from program first!"
  exit 1
fi

wget "$BASE" -O $TMPFILE
mkdir -p $SHEETS_DIR
mkdir -p $SHAPES_DIR

unzip -o -j $TMPFILE dia-shapes-big-data-master/sheets/* -d $SHEETS_DIR
unzip -o -j $TMPFILE dia-shapes-big-data-master/shapes/* -d $SHAPES_DIR
rm $TMPFILE

echo "Done!"