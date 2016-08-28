#!/bin/bash 

# A9.sh
#
# Jump the execution to the memory position specified
#
# @author	Sergio Pohlmann <sergio@ycube.net>
# @date		June, 02 of 2016
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

