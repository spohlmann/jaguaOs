#!/bin/bash 

# instructionTest.sh
#
# Makes a test with instructions
#
# @author	Sergio Pohlmann <sergio@ycube.net>
# @date		May, 03 of 2016
#
####################################################

baseDir="/opt";

. ${baseDir}/jaguaOs/config/config.sh
. ${baseDir}/jaguaOs/config/ASMfunctions.sh
. ${baseDir}/jaguaOs/config/Basefunctions.sh


function useForm
{
	echo "		  Use form:"
	echo ""
	echo "		  instructionTest mov RA, 5"
	echo ""
}

header "instructionTest - Try instructions from jaguaOs Microprocessor";
if [ "${1} " == " " ] ; then
	useForm;
	exit 0;
fi

# define parameters
defineASMParameters $1 $2 $3 $4;

if [ "${P2}" != "" ] ; then
	defineCodePar1;
fi
if [ "${P3}" != "" ] ; then
	defineCodePar2;
fi


echo "     Command:     $@"
echo "  Parameters:     $P2 $P3 $P4"
echo " Instruction:     $P1"
echo "Function Code     ${codeFunction}"
echo " Param. Code:     ${codePar1} ${codePar2}"
echo "Memory Format     ${codeFunction}${codePar1}${codePar2}"

# Execute Instruction
$ASMInstDir/${codeFunction}.sh ${codePar1}${codePar2};


