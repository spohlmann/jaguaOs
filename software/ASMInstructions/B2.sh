#!/bin/bash 

# B2.sh
#
# Salta para una posición si la última 
# operación aritmética resultó mayor que cero
#
# @author	Yenny Vega Grahl
# @date		June, 13 of 2016
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

