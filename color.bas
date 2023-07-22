   10  FOR I = 0 TO 255
   20  S$ = TH_SPRINTF$( "%4S", I )
   30  ? CHR$(27) "[38;5;" STR$(I) "m" S$ ;
   40  IF NOT (I+1) MOD 16 THEN ?
   50  NEXT
