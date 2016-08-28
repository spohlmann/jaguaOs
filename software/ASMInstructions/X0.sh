#!/bin/bash 

# X0.sh
#
# Move Direction to Direction Register (DR, 0123 )
# @author	Sergio Pohlmann <sergio@ycube.net>
# @date		May, 11 of 2016
#
####################################################

baseDir="/opt";

. ${baseDir}/jaguaOs/config/config.sh
. ${baseDir}/jaguaOs/config/ASMfunctions.sh
. ${baseDir}/jaguaOs/config/Basefunctions.sh


parameters=$1

value=${parameters:2:4};

regCode=${parameters:0:2};

register=`grep ".${regCode};" ${ASMInstDir}/ASMTable.sh | cut -d";" -f 1 | tr -d '[[:space:]]'`;
register=${register/.};

echo ${value} > ${mpDir}/${register}.reg; 

touchStatus ${register};







