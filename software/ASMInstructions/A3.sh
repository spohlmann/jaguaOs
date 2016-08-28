#!/bin/bash 

# A3.sh
#
# Move Register Contents to Direction ( mov [0123], RA )
#
# @author	Sergio Pohlmann <sergio@ycube.net>
# @date		May, 03 of 2016
#
####################################################

baseDir="/opt";

. ${baseDir}/jaguaOs/config/config.sh
. ${baseDir}/jaguaOs/config/ASMfunctions.sh
. ${baseDir}/jaguaOs/config/Basefunctions.sh


echo ========================

parameters=$1

echo "Parameters: ${parameters}"

position=$((16#${parameters:0:4}));

echo "Position: ${position}"

regCode=${parameters:4:2};

echo "RegCode: ${regCode}"


register=`grep ".${regCode};" ${ASMInstDir}/ASMTable.sh | cut -d";" -f 1 | tr -d '[[:space:]]'`;
register=${register/.};

value=`cat ${mpDir}/${register}.reg`; 

echo "Register ${register} = ${value}";



writeMemoryPosition ${position} ${value}



exit 0


readMemoryPosition ${position};



writeToRegister ${register} ${char}



