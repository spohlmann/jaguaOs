#!/bin/bash 

# A4.sh
#
# Sum two registers storing the result in the Object register
# @author	Ẁilliam Martinez
# @date		May, 18 of 2016
#
####################################################

baseDir="/opt";

. ${baseDir}/jaguaOs/config/config.sh
. ${baseDir}/jaguaOs/config/ASMFunctions.sh
. ${baseDir}/jaguaOs/config/BaseFunctions.sh

parameters=$1

regCode1=${parameters:2:4};

regCode2=${parameters:0:2};

register1=`grep ".${regCode1};" ${ASMInstDir}/ASMTable.sh | cut -d";" -f 1 | tr -d '[[:space:]]'`;
register1=${register1/.};
registerValue1=`cat ${mpDir}/${register1}.reg`;
dec1=`echo $((16#$registerValue1))`

register2=`grep ".${regCode2};" ${ASMInstDir}/ASMTable.sh | cut -d";" -f 1 | tr -d '[[:space:]]'`;
register2=${register2/.};
registerValue2=`cat ${mpDir}/${register2}.reg`;


dec2=`echo $((16#$registerValue2))`
decValue=`echo $((16#$regCode1))`

expr1=`expr ${dec1} + ${dec2}`;
expr2=`expr ${decValue} + ${dec2}`;

expr1hexa=`echo "obase=16; ${expr1}" | bc`;
expr2hexa=`echo "obase=16; ${expr2}" | bc`;

testIfRegister ${register1};
if [[ "$isRegister" == "1" ]]; then

	echo ${expr1hexa} > ${mpDir}/${register2}.reg

	# Update Accumulator
      writeACC ${expr1};
else

	echo ${expr2hexa} > ${mpDir}/${register2}.reg
	
	# Update Accumulator
      writeACC ${expr2};
fi

touchStatus ${register2};



