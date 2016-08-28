#!/bin/bash 

# AX.sh
#
# Store a Direction in the PC register
#
# @author	Emilio Centurion
# @date		June, 08 of 2016
#
####################################################

baseDir="/opt";

. ${baseDir}/jaguaOs/config/config.sh
. ${baseDir}/jaguaOs/config/ASMfunctions.sh
. ${baseDir}/jaguaOs/config/Basefunctions.sh

parameters=$1

position=${parameters:0:4};

writeToRegister "PC" ${position}

touchStatus "PC";



