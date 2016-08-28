#!/bin/bash 

# A8.sh
#
# End - Terminate a program
#
# @author	Sergio Pohlmann <sergio@ycube.net>
# @date		May, 21 of 2016
#
####################################################

baseDir="/opt";

. ${baseDir}/jaguaOs/config/config.sh
. ${baseDir}/jaguaOs/config/ASMfunctions.sh
. ${baseDir}/jaguaOs/config/Basefunctions.sh

echo " " > ${ASMInstDir}/endProgram;
