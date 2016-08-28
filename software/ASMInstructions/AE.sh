#!/bin/bash 

# AE.sh
#
# Pop - Pop data from Stack
# @author	Sergio Pohlmann <sergio@ycube.net>
# @date		June, 08 of 2016
#
####################################################

baseDir="/opt";

. ${baseDir}/jaguaOs/config/config.sh
. ${baseDir}/jaguaOs/config/ASMfunctions.sh
. ${baseDir}/jaguaOs/config/Basefunctions.sh


regCode=$1;

register=`grep ".${regCode};" ${ASMInstDir}/ASMTable.sh | cut -d";" -f 1 | tr -d '[[:space:]]'`;
register=${register/.};

SP=$( readSP );

increaseSP ${SP};

readMemoryPosition ${SP};

writeToRegister ${register} ${char};






