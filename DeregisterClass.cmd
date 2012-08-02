/* Deregister the a WPS class */

/* load the REXX utility */
call RxFuncAdd 'SysLoadFuncs', 'RexxUtil', 'SysLoadFuncs'
call SysLoadFuncs

If SysDestroyObject("<XShadow>") 
  then Say "Object '<XShadow>' destroyed."
  else Say 'Could not destroy object "<XShadow>"'

/* unreplace WPS class */
'repclass.exe WPShadow XShadow'

/*
if result
   then say 'XShadow instance '<XShadow>' created sucessfully. result= ' result
   else say 'Error creating XShadow instance. result=' result
*/

/* Deregister Class with WPS shell */
if SysDeregisterObjectClass('XShadow') /* Class Name            */
   then say 'XShadow class deregistered sucessfully.'
   else say 'Error deregistering XShadow class.'

If SysDestroyObject("c:\os2\dll\XShadow.dll") 
  then Say "Object 'c:\os2\dll\XShadow.dll' destroyed."
  else Say "Could not destroy object 'c:\os2\dll\XShadow.dll'"

'pause'
