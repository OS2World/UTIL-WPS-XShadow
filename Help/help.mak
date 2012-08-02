# help.mak
# Created by IBM WorkFrame/2 MakeMake at 12:37:54 on 16 July 1999
#
# The actions included in this make file are:
#  Compile::IPF Compiler

.SUFFIXES:

.SUFFIXES: \
    .IPF .hlp 

.IPF.hlp:
    @echo " Compile::IPF Compiler "
    ipfc.exe %s

all: \
    .\XShadow.hlp

.\XShadow.hlp: XShadow.IPF AboutXShadow.bmp RestoreShadowTitle.bmp
    ipfc.exe %s
   
