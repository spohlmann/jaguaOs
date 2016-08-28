#!/bin/bash 

# AL.sh
#
# Jump to a position if the last arithmetic operation resulted nonzero
# 
# @author	Maria Lorena Del Puerto Gomez
# @date		June, 08 of 2016
#
####################################################

baseDir="/opt";

. ${baseDir}/jaguaOs/config/config.sh
. ${baseDir}/jaguaOs/config/ASMfunctions.sh
. ${baseDir}/jaguaOs/config/Basefunctions.sh

touchStatus "PC";

