#!/bin/bash 

# B0.sh
#
# popr - pop all registers from the Stack
# @author	Sergio Pohlmann <sergio@ycube.net>
# @date		June, 08 of 2016
#
####################################################

baseDir="/opt";

. ${baseDir}/jaguaOs/config/config.sh
. ${baseDir}/jaguaOs/config/ASMfunctions.sh
. ${baseDir}/jaguaOs/config/Basefunctions.sh


function popChar
{
	SP=$( readSP );
	increaseSP ${SP};
	readMemoryPosition ${SP};
	echo ${char};
}

echo $( popChar ) > "${mpDir}/SF.alu";
echo $( popChar ) > "${mpDir}/ZF.alu";

PC=$( popChar );
PC="$(popChar)${PC}";
PC="$(popChar)${PC}";
PC="$(popChar)${PC}";

DR=$( popChar );
DR="$( popChar )${DR}";
DR="$( popChar )${DR}";
DR="$( popChar )${DR}";
echo ${DR} > "${mpDir}/DR.reg";

echo $( popChar ) > "${mpDir}/RD.reg";
echo $( popChar ) > "${mpDir}/RC.reg";
echo $( popChar ) > "${mpDir}/RB.reg";
echo $( popChar ) > "${mpDir}/RA.reg";

echo ${PC} > "${mpDir}/PC.reg";

touchStatus ${RA};
touchStatus ${RB};
touchStatus ${RC};
touchStatus ${RD};
touchStatus ${DR};
touchStatus ${PC};
touchStatus ${RA};
touchStatus ${ZF};
touchStatus ${SF};





