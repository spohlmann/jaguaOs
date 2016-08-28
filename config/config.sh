#!/bin/bash

# config.sh
#
# Directory Definitions to jaguaOs
#
# @author	Sergio Pohlmann <sergio@ycube.net>
# @date		May, 03 of 2016
#
####################################################

# Base Dir
jaguaOsDir="/opt/jaguaOs";


# Hardware
hardDir="${jaguaOsDir}/hardware";

# DiskDir
diskDir="${hardDir}/disk/dir";

# tty Dir
ttyDir="${hardDir}/tty";

# Memory Dir
memDir="${hardDir}/memory";

# Microprocessor
mpDir="${hardDir}/processor";

# Software
softDir="${jaguaOsDir}/software";

# Parameters
P1=""; P2=""; P3=""; P4=""; 

# ASMInstructions 
ASMInstDir="${softDir}/ASMInstructions";
codeFunction="";
codePar1=""; codePar2="";
isRegister="";


