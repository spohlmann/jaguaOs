#!/bin/bash 

# AF.sh
#
# pushr - Push all registers to the Stack
# @author	Sergio Pohlmann <sergio@ycube.net>
# @date		June, 08 of 2016
#
####################################################

baseDir="/opt";

. ${baseDir}/jaguaOs/config/config.sh
. ${baseDir}/jaguaOs/config/ASMfunctions.sh
. ${baseDir}/jaguaOs/config/Basefunctions.sh


RA=$( readAnyRegister "RA.reg" 1 );
RB=$( readAnyRegister "RB.reg" 1 );
RC=$( readAnyRegister "RC.reg" 1 );
RD=$( readAnyRegister "RD.reg" 1 );
DR=$( readAnyRegister "DR.reg" 4 );
PC=$( readAnyRegister "PC.reg" 4 );
ZF=$( readAnyRegister "ZF.alu" 1 );
SF=$( readAnyRegister "SF.alu" 1 );

string="${RA}${RB}${RC}${RD}${DR}${PC}${ZF}${SF}";

for (( i=0; $i< ${#string}; i++ )) ; do
	value=${string:$i:1};
	SP=$( readSP );
	writeMemoryPosition ${SP} ${value};
	decreaseSP ${SP};
done







