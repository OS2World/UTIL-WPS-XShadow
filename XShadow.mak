# XShadow.mak
# Created by IBM WorkFrame/2 MakeMake at 20:16:44 on 31 Mar 2002
#
# The actions included in this make file are:
#  Compile::Resource Compiler
#  Compile::C++ Compiler
#  Link::Linker
#  Bind::Resource Bind

.SUFFIXES:

.SUFFIXES: \
    .cpp .obj .rc .res 

.rc.res:
    @echo " Compile::Resource Compiler "
    rc.exe -r %s %|fF.RES

{C:\Misc\WPSProgramming\XShadow\Source}.rc.res:
    @echo " Compile::Resource Compiler "
    rc.exe -r %s %|fF.RES

.cpp.obj:
    @echo " Compile::C++ Compiler "
    icc.exe /Ss /Ti /Gm /Ge- /C %s

{C:\Misc\WPSProgramming\XShadow\Source}.cpp.obj:
    @echo " Compile::C++ Compiler "
    icc.exe /Ss /Ti /Gm /Ge- /C %s

all: \
    .\XShadow.dll

.\XShadow.map .\XShadow.dll: \
    .\XShadow.obj \
    .\Resource.res \
    {$(LIB)}somtk.lib \
    {$(LIB)}XShadow.def
    @echo " Link::Linker "
    @echo " Bind::Resource Bind "
    icc.exe @<<
     /B" /de /pmtype:pm"
     /FeXShadow.dll 
     /Fm"XShadow.map" 
     somtk.lib 
     XShadow.def
     .\XShadow.obj
<<
    rc.exe .\Resource.res XShadow.dll

.\Resource.res: \
    C:\Misc\WPSProgramming\XShadow\Source\Resource.rc \
    {C:\Misc\WPSProgramming\XShadow\Source;$(INCLUDE)}resource.h

.\XShadow.obj: \
    C:\Misc\WPSProgramming\XShadow\Source\XShadow.cpp \
    {C:\Misc\WPSProgramming\XShadow\Source;$(INCLUDE);}XShadow.xih \
    {C:\Misc\WPSProgramming\XShadow\Source;$(INCLUDE);}Resource.h
