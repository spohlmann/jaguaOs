#!/bin/bash 

# AC.sh
#
# Compare two registers
# @author	Sergio Pohlmann <sergio@ycube.net>
# @date		June, 02 of 2016
#
####################################################

baseDir="/opt";

. ${baseDir}/jaguaOs/config/config.sh
. ${baseDir}/jaguaOs/config/ASMfunctions.sh
. ${baseDir}/jaguaOs/config/Basefunctions.sh


parameters=$1

firstCode=${parameters:0:2};
secCode=${parameters:2:4};

register=`grep ".${firstCode};" ${ASMInstDir}/ASMTable.sh | cut -d";" -f 1 | tr -d '[[:space:]]'`;
register=${register/.};
first=${register};

register=`grep ".${secCode};" ${ASMInstDir}/ASMTable.sh | cut -d";" -f 1 | tr -d '[[:space:]]'`;
register=${register/.};
sec=${register};

firstValue=`cat ${mpDir}/${first}.reg`;
secValue=`cat ${mpDir}/${sec}.reg`;

decFirst=`echo $((16#${firstValue}))`;
decSec=`echo $((16#${secValue}))`

value=$(( decFirst - decSec ));

writeACC ${value};







