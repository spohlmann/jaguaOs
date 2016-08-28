#!/bin/bash 

# A5.sh
#
# Increment value of register (dec RA) 
#
# @author	Emilio Centurion
# @date		May, 23 of 2016
#
####################################################

baseDir="/opt";

. ${baseDir}/jaguaos/config/config.sh
. ${baseDir}/jaguaos/config/ASMFunctions.sh
. ${baseDir}/jaguaos/config/BaseFunctions.sh


parameters=$1;

checkIfParameterIsRegister ${parameters:0:2};
if [ "${exist}" == "1" ] ; then
	if [ "${parameters:2:4}" == "" ] ; then

      echo "Parameters: ${parameters}";

      RegCode=${parameters:0:2};
      echo "RegCode: ${RegCode}";

      register=`grep ".${RegCode};" ${ASMInstDir}/ASMTable.sh | cut -d";" -f 1 | tr -d '[[:space:]]'`;
      register=${register/.};
      reg=${register};

      num1=`cat ${mpDir}/${reg}.reg`;

      dec=`echo $((16#$num1))`
      decVal=$(( $dec + 1)) ;
      newVal=`echo "obase=16; ${decVal}" | bc`;

      echo ${newVal} > ${mpDir}/${reg}.reg;
      
      touchStatus ${reg};


      # Update Accumulator
      writeACC ${decVal};

    else
	  echo "Incorrect sintax";
    fi
else
	echo "${parameters:0:2} is not a Register";
fi






