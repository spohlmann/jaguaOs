#!/bin/bash 

# runProcessor.sh
#
# Execute a program in the microprocessor
#
# @author	Sergio Pohlmann <sergio@ycube.net>
# @date		May, 20 of 2016
#
####################################################

baseDir="/opt";

. ${baseDir}/jaguaOs/config/config.sh
. ${baseDir}/jaguaOs/config/ASMfunctions.sh
. ${baseDir}/jaguaOs/config/Basefunctions.sh


# Check the status of an specific register
function checkStatus
{
	reg=${1};
	regName=`echo ${reg} | cut -d"." -f 1`;
	regVal=`cat ${mpDir}/${reg}`;
	if [ -f ${mpDir}/${regName}.st ]; then
		rm ${mpDir}/${regName}.st;
		status=" [${regName}:${regVal}] ";
	else
		status=" ${regName}:${regVal} ";
	fi
	echo -n "${status}" >> ${mpDir}/status;
}

# Print line with the status of all registers
function printStatus
{
	# Clear status file
	if [ -f ${mpDir}/status ]; then
		rm ${mpDir}/status;
	fi	
	checkStatus "RA.reg";
	checkStatus "RB.reg";
	checkStatus "RC.reg";
	checkStatus "RD.reg";
	checkStatus "DR.reg";
	checkStatus "PC.reg";
	checkStatus "ACC.alu";
	checkStatus "ZF.alu";
	checkStatus "SF.alu";
}

# Fetch Cycle
function fetch
{
	# Define position to read
	position=$(readRegister "PC");
	position=`echo $((16#${position}))`;

	# Read Instruction from memory
	codeInstruction=$(readInstruction ${position});
	instructionLenght=`grep "${codeInstruction};" ${ASMInstDir}/ASMTable.sh | cut -d";" -f 3 | tr -d '[[:space:]]'`;
	
	# Read Instruction Parameters
	position=$(( ${position} + 2 ));
	parameters=$(readInstructionParameters ${position} ${instructionLenght});
	
	#Update Instruction Interpreter Register
	echo "${codeInstruction}${parameters}" > ${mpDir}/RI.ii;

	# Increment the PC
	position=$(( ${position} + ${instructionLenght} ));
	writeToRegister "PC" `printf '%04X' ${position}`;
	touchStatus "PC";

}


# Execute Cycle
function execute
{
	# Execute Instruction
	${ASMInstDir}/${codeInstruction}.sh ${parameters};
	
	# To debug
	if [ "${par}" == "debug" ] ; then
		echo ${codeInstruction} ${parameters};
	fi
	if [ "${par}" == "step" ] ; then
		touchStatus "PC";
		printStatus;
		echo "" > ${ttyDir}/refresh;
		echo -n ${codeInstruction} ${parameters}"       ";
		read input;
	fi
}



par=${1};

# Clear status file
if [ -f ${mpDir}/status ]; then
	rm ${mpDir}/status;
fi

# Clear Registers
writeToRegister "RA" 0;
writeToRegister "RB" 0;
writeToRegister "RC" 0;
writeToRegister "RD" 0;
writeToRegister "DR" "0000";
echo -n "0" > "${mpDir}/ZF.alu";
echo -n "0" > "${mpDir}/SF.alu";
echo -n "0" > "${mpDir}/ACC.alu";

while true
do 
	fetch;
	execute;

	# Check if instruction is end
	if [ -f ${ASMInstDir}/endProgram ]; then
		rm ${ASMInstDir}/endProgram;
		exit 0;
	fi	

done
