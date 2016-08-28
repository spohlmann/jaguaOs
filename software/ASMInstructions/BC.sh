#!/bin/bash 

# BC.sh
#
# Compare a register with a value
# @author	Lourdes Velazquez
# @date		June, 11 of 2016
#
####################################################

baseDir="/opt";

. ${baseDir}/jaguaOs/config/config.sh
. ${baseDir}/jaguaOs/config/ASMfunctions.sh
. ${baseDir}/jaguaOs/config/Basefunctions.sh


parameters=$1

firstCode=${parameters:0:2};
value=${parameters:2:4};

register=`grep ".${firstCode};" ${ASMInstDir}/ASMTable.sh | cut -d";" -f 1 | tr -d '[[:space:]]'`;
register=${register/.};
first=${register};


firstValue=`cat ${mpDir}/${first}.reg`;

decReg=`echo $((16#${firstValue}))`

value2=$(( decReg - Value ));

writeACC ${value2};

