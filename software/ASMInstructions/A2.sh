#!/bin/bash 

# A2.sh
#
# Move The content of a Direction to a Register ( mov RA, [1234] )
#
# @author	Sergio Pohlmann <sergio@ycube.net>
# @date		May, 11 of 2016
#
####################################################

baseDir="/opt";

. ${baseDir}/jaguaOs/config/config.sh
. ${baseDir}/jaguaOs/config/ASMfunctions.sh
. ${baseDir}/jaguaOs/config/Basefunctions.sh

parameters=$1

position=$((16#${parameters:3:4}));
regCode=${parameters:0:2};

register=`grep ".${regCode};" ${ASMInstDir}/ASMTable.sh | cut -d";" -f 1 | tr -d '[[:space:]]'`;
register=${register/.};

readMemoryPosition ${position};

writeToRegister ${register} ${char}

touchStatus ${register};






