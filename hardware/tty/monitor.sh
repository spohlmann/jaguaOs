#!/bin/bash 

# monitor.sh
#
# Shows a monitor contents
#
# @author	Sergio Pohlmann <sergio@ycube.net>
# @date		May, 21 of 2016
#
####################################################

baseDir="/opt";

. ${baseDir}/jaguaOs/config/config.sh
. ${baseDir}/jaguaOs/config/ASMfunctions.sh
. ${baseDir}/jaguaOs/config/Basefunctions.sh


function refresh
{
	clear
	
	# First screen Border
	echo -n " "
	printf '%80s\n' | tr ' ' -

	position=${startVideoMemory};

	# Print each data row ov Video Memory
	for (( row = 0; $row < 20; row++ )) ; do

		# Read Memory
		memRow=${memoryContent:$position:80};

		echo "|${memRow}|";
		position=$(( ${position} + 80 ));
	done

	# Print the last rown of screen
	echo -n "" `printf '%80s\n' | tr ' ' -` ;
	echo;

	# Print status of registers
	if [ -f ${mpDir}/status ]; then
		status=`cat ${mpDir}/status`;
		echo -n " "${status};
		touch ${mpDir}/temp.st
		rm ${mpDir}/*.st > /dev/null;
	fi
}


echo "" > ${ttyDir}/refresh;

while true
do
	if [ -f ${ttyDir}/refresh ] ; then
		defineVideoMemory
		refresh;
		rm ${ttyDir}/refresh;
	fi
done
