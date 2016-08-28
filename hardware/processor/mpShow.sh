#!/bin/bash

# author	Sergio Pohlmann
# date		April, 27 of 2016
########################################


while (true);
do

	RA=`cat RA.reg`;
	RB=`cat RB.reg`;
	RC=`cat RC.reg`;
	RD=`cat RD.reg`;
	PC=`cat PC.reg`;
	DR=`cat DR.reg`;
	ACC=`cat ACC.alu`;
	ZF=`cat ZF.alu`;
	SF=`cat SF.alu`;
	RI=`cat RI.ii`;


	clear
	echo "Jagua Microprocessor";
	echo
	echo "Registers:";
	echo
	echo "RA: ${RA}";
	echo "RB: ${RB}";
	echo "RC: ${RC}";
	echo "RD: ${RD}";
	echo
	echo "DR: ${DR}";
	echo
	echo "PC: ${PC}";
	echo; echo
	echo "ALU:"
	echo
	echo "ACC: ${ACC}";
	echo " ZF: ${ZF}";
	echo " SF: ${SF}";
	echo; echo
	echo "Instruction Interpreter: ${RI}";
done

