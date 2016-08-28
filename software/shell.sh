#!/bin/bash 

# shell.sh
#
# Shell to a jaguaOs System
#
# @author	Sergio Pohlmann <sergio@ycube.net>
# @date		May, 20 of 2016
#
####################################################

baseDir="/opt";

. ${baseDir}/jaguaOs/config/config.sh
. ${baseDir}/jaguaOs/config/ASMfunctions.sh
. ${baseDir}/jaguaOs/config/Basefunctions.sh


# exec Instruction
function execInstruction
{
	command=${1}
	par1=${2};
	par2=${3};
	case ${command} in
		"dir")
			ls ${dir};
			;;

		"cat")
			cat ${dir}/${par1};
			;;

		"prompt")
			prompt=${par1};
			;;

		"exit")
			echo;
			echo "Thanks for try our jaguaOs!!!";
			echo;
			exit 0;
			;;

		"history")
			cat .history;
			echo;
			if [ "${par1}" == "clear" ] ; then
				echo "" > .history;
				echo "History cleaned.";
				echo;
			fi
			;;

		"exec")
			loadFile ${dir}/${par1}.exe;
			updateMemory;
			./runProcessor.sh ${par2};			
			;;

		"jasm")
			./jasm ${par1};
			;;


		"*")
			echo "Unrecognized Command";
			;;
	esac
}


function loadFile
{
	. ${1};
	stackDec=`echo $((16#${stack}))`;
	echo ${stackDec} > ${mpDir}/stack;

}


function updateMemory
{

	# Preparing variables
	position=-1; 	# Memory position;

	# Making stack space
	stackLengh=`echo $((16#${stack}))`;
	for count in `seq ${stackLengh}` ; do
		position=$(( ${position} + 1));
		writeMemoryPosition ${position} "0";
	done
	for (( count=0; $count<${#code}; count++ )) ; do 
		position=$(( ${position} + 1));
		char=${code:$count:1};
		writeMemoryPosition ${position} ${char};
	done
	for (( count=0; $count<${#vars}; count++ )) ; do 
		position=$(( ${position} + 1));
		char=${vars:$count:1};
		if [ "${char}" == " " ]; then
			char="space";
		fi
		writeMemoryPosition ${position} ${char};
	done

	# Update Program Counter
	writeToRegister "PC" ${stack};

	# Create a stack pointer
	stackPointer=$(( ${stackLengh} - 1 ));
	writeSP ${stackPointer};
}


# Variable definitions
command="";
prompt="> ";
dir=${diskDir};

header "jaguaOs - Academic Emulation of Operational System in Bash";



while true
do 
	echo ""
	echo -n "$prompt";
	read command;
	if [ "${command}" != "" ] ; then
		echo ${command} >> ".history";
		execInstruction ${command};
	fi
done
