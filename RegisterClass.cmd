/* Register the WPS class */

/* load the REXX utility */
call RxFuncAdd 'SysLoadFuncs', 'RexxUtil', 'SysLoadFuncs'
call SysLoadFuncs

/* Destroy Object instance */
If SysDestroyObject("<XShadow>")
  then Say "Object destroyed."
  else Say 'Could not destroy Object "<XShadow>"'

/* Deregister Class with WPS shell */
if SysDeregisterObjectClass('XShadow') /* Class Name */
   then say 'XShadow class deregistered sucessfully.'
   else say 'Error deregistering XShadow class.'

/* Copy class DLL to system DLL directory */
'repmod XShadow.dll'
'copy XShadow.dll c:\os2\dll'
'copy help\XShadow.hlp c:\os2\help'

/* Register Class with WPS shell */
result = SysRegisterObjectClass('XShadow',,             /* Class Name   */
                                'c:\os2\dll\XShadow.dll') /* DLL Name     */
if result
   then say 'XShadow class registered sucessfully. result=' result
   else say 'Error registering XShadow class. result =' result

/* make the object instance */
result = SysCreateObject('WPFolder',,             /* Class name            */
                         'Test Folder',,          /* Instance name         */
                         '<WP_DESKTOP>',,         /* Folder for object     */
                         'OBJECTID=<TestFolder>',, /* Object ID */
                         'Replace')               /* replace if exists */



/* make the object instance */
result = SysCreateObject('XShadow',,              /* Class name            */
                         'Shadow of TestFolder',,       /* Instance name         */
                         '<WP_DESKTOP>',,         /* Folder for object     */
                         'OBJECTID=<XShadowofTestFolder>;'||, /* Object ID */
                         'SHADOWID=<TestFolder>',,
                         'Replace')               /* replace if exists */


if result
   then say 'XShadow instance '<XShadowofTemp>' created sucessfully. result= ' result
   else say 'Error creating XShadow instance. result=' result

