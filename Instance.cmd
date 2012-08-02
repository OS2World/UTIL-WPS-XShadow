/* Make an instance of a HelloWPS object */

/* load the REXX utility */
call RxFuncAdd 'SysLoadFuncs', 'RexxUtil', 'SysLoadFuncs'
call SysLoadFuncs

'echo.'
'echo.'
/* make the object instance */
result = SysCreateObject('XShadow',,             /* Class name            */
                   'X Shadow',,                  /* Instance name         */
                   '<WP_DESKTOP>',,              /* Folder for object     */
                   'OBJECTID=<XShadow>;',,       /* Object ID */
                   'Replace')                    /* replace if exists */


if result
   then say 'XShadow instance '<XShadow>' created sucessfully. result= ' result
   else say 'Error creating XShadow instance. result=' result

'pause'