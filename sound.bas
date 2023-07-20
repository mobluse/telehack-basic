    1  PRINT "Generates some sounds"
    2  REM
  110  FOR FREQ = 100 TO 2000 STEP 50
  120  GOSUB 1000
  130  NEXT FREQ
  140  FOR FREQ = 2000 TO 100 STEP -50
  150  GOSUB 1000
  160  NEXT FREQ
  180  END
 1000  REM Generate a sound (_S), sine waveform (0),
 1010  REM frequency FREQ, duration 80ms, volume 100
 1020  PRINT CHR$(27)+"_S0;"+STR$(FREQ)+";80;100$";
 1030  REM delay 100ms
 1040  PRINT CHR$(27)+"_Y100$";
 1050  IF INKEY$ <> "$" THEN GOTO 1050
 1060  RETURN
