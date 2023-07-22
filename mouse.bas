    1  PRINT "Shows mouse positions and status"
    2  PRINT "This program requires Graphics Controller"
    3  REM
  100  REM WIDTH 255
  110  REM Enable mouse
  120  PRINT CHR$(27);"_H1$";
  130  REM WHILE 1
  140  REM Read mouse status
  150  PRINT CHR$(27);"_M$";
  160  REM S$ = INPUT$(12)
  162  S$ = ""
  164  FOR I = 1 TO 12
  166  S$ = S$ + INKEY$
  168  NEXT
  170  PRINT S$;CHR$(13);
  180  GOTO 130: REM WEND
  200  PRINT CHR$(27);"_H0$";
