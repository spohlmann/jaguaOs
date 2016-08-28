#!/bin/bash 

# A7.sh
#
# Execute an interrupt
#
# @author	Sergio Pohlmann <sergio@ycube.net>
# @date		May, 20 of 2016
#
####################################################

baseDir="/opt";

. ${baseDir}/jaguaOs/config/config.sh
. ${baseDir}/jaguaOs/config/ASMfunctions.sh
. ${baseDir}/jaguaOs/config/Basefunctions.sh

function printCharInMemory
{
	char=${1};
	memoryPosition=$(( ${startVideoMemory} + $((${row} *80)) + ${col} ));
	writeMemoryPosition ${memoryPosition} ${char};
	updateRowCol;
	#echo $memoryPosition $row $col;
}



function clearScreen
{
	first=${memoryContent:0:$startVideoMemory};
	echo "${first}" > ${hardDir}/memory/content;
	for i in `seq 1600` ; do 
		echo -n " " >> ${hardDir}/memory/content;
	done
}


# Force a screen refresh
function refreshScreen
{
	echo "" > ${ttyDir}/refresh;
}



function interrupt
{
	function=$(readRegister RA);
	case $function in
		
		"0") # Print char in RB

			char=$( readRegister "RB" );
			row=$(readActualRow);
			col=$(readActualCol);
			printCharInMemory $char;
			refreshScreen;			
			;;

		"1") # Print a string started in a DR address

			row=$(readActualRow);
			col=$(readActualCol);
			address=$(readRegister DR);
			address=`echo $((16#${address}))`;
			char="";
			escape=0;
			backslash='\';
			while [ "${char}" != "$" ];
			do
				readMemoryPosition ${address};
				if [ "${char}" == "${backslash}" ] ; then
					escape=1;
				else
					if [ "${escape}" == "1" ] ; then
						escape=0;
						case ${char} in 
							"t")
								col=$(( ${col} + 8 ));								
								;;
							"n")
								col=79;
								printCharInMemory "space";
								;;
						esac
					else
						if [ "${char}" != "$" ] ; then
							if [ "${char}" == " " ] ; then
								char="space";
							fi
							printCharInMemory $char;
						fi
					fi
				fi 
				address=$(( ${address} + 1 ));
			done
			refreshScreen;
			;;

		"2") # Clear String
			clearScreen;
			row=0;
			col=0;
			refreshScreen;
			;;	


	esac
}

defineVideoMemory;
interrupt;
writeRowCol;

touchStatus "PC";


