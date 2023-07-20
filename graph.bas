    1  REM Draws some graphics
    2  PRINT "This program requires Graphics Controller"
  100  REM WIDTH 255
  103  FREQ = 440
  105  GOSUB 10000: REM Define functions
  106  REM Disable cursor and clear screen
  107  PRINT FNCURSOROFF$(0);FNCLR$(0);
  108  GOSUB 1000
  110  REM
  120  REM ** POINTS **
  130  FOR I = 0 TO 100
  140  REM Set random pen color
  150  PRINT FNPEN$(RND*255, RND*255, RND*255);
  160  REM Draw a pixel at random position
  170  PRINT FNPIXEL$(RND*640, RND*480);
  180  NEXT I
  185  GOSUB 1000
  190  FOR I = 0 TO 120: PRINT FNSCROLL$(4, 4);: NEXT I
  195  GOSUB 1000
  200  REM
  210  REM ** LINES **
  220  FOR I = 0 TO 100
  230  REM Set random pen color
  240  PRINT FNPEN$(RND*255, RND*255, RND*255);
  250  REM Draw a line
  260  PRINT FNDRAW$(RND*640, RND*480, RND*640, RND*480);
  270  NEXT I
  275  GOSUB 1000
  280  FOR I = 0 TO 120: PRINT FNSCROLL$(-4, 4);: NEXT I
  285  GOSUB 1000
  290  REM
  300  REM ** FILLED RECTANGLES **
  310  FOR I = 0 TO 50
  320  REM Set random brush color
  330  PRINT FNBRUSH$(RND*255, RND*255, RND*255);
  340  REM Set random pen color
  350  PRINT FNPEN$(RND*255, RND*255, RND*255);
  360  REM Fill and draw rectangle
  370  X1 = RND*640: Y1 = RND*480: X2 = RND*640: Y2 = RND*480
  380  PRINT FNFILLRECT$(X1, Y1, X2, Y2);
  390  PRINT FNRECT$(X1, Y1, X2, Y2);
  400  NEXT I
  405  GOSUB 1000
  410  FOR I = 0 TO 120: PRINT FNSCROLL$(4, -4);: NEXT I
  415  GOSUB 1000
  420  REM
  430  REM ** FILLED ELLIPSES **
  440  FOR I = 0 TO 50
  450  REM Set random brush color
  460  PRINT FNBRUSH$(RND*255, RND*255, RND*255);
  470  REM Set random pen color
  480  PRINT FNPEN$(RND*255, RND*255, RND*255);
  490  REM Fill and draw ellipse
  500  X = RND*640: Y = RND*480: W = RND*320: H = RND*240
  510  PRINT FNFILLELLIPSE$(X, Y, W, H);
  520  PRINT FNELLIPSE$(X, Y, W, H);
  530  NEXT I
  535  GOSUB 1000
  540  FOR I = 0 TO 120: PRINT FNSCROLL$(-4, -4);: NEXT I
  545  GOSUB 1000
  550  REM
  560  REM ** FILLED POLYGONS **
  570  FOR I = 0 TO 50
  580  REM Set random brush color
  590  PRINT FNBRUSH$(RND*255, RND*255, RND*255);
  600  REM Set random pen color
  610  PRINT FNPEN$(RND*255, RND*255, RND*255);
  620  REM Build coordinates
  630  C = 3 + INT(RND*4): REM Number of points
  640  P$ = ""
  650  FOR J = 1 TO C
  660  X = INT(RND*640): Y = INT(RND*480)
  670  P$ = P$ + STR$(X) + ";" + STR$(Y)
  680  IF J < C THEN P$ = P$ + ";"
  690  NEXT J
  700  REM Fill and draw path
  710  PRINT FNFILLPATH$(P$);
  720  PRINT FNPATH$(P$);
  725  GOSUB 1100
  730  NEXT I
  735  GOSUB 1000
  740  FOR I = 0 TO 120: PRINT FNSCROLL$(-4, 0);: NEXT I
  745  GOSUB 1000
  750  REM Clear screen, clear terminal and enable cursor
  760  PRINT FNCLR$(0);FNCLRTERM$(0);FNCURSORON$(0);
  765  REM WIDTH 80
  770  END
 1000  REM Generate a sound (_S), sine waveform (0),
 1010  REM frequency FREQ, duration 80ms, volume 100
 1020  PRINT CHR$(27)+"_S0;"+STR$(FREQ)+";80;100$";
 1030  REM delay 100ms
 1040  PRINT CHR$(27)+"_Y100$";
 1050  IF INKEY$ <> "$" THEN GOTO 1050
 1060  RETURN
 1100  REM delay 10ms
 1110  PRINT CHR$(27)+"_Y10$";
 1120  GOTO 1050
10000  REM
10010  REM ** DEFINE FUNCTIONS **
10020  DEF FNPEN$(R%, G%, B%) = CHR$(27)+"_GPEN"+STR$(INT(R%))+";"+STR$(INT(G%))+";"+STR$(INT(B%))+"$"
10030  DEF FNBRUSH$(R%, G%, B%) = CHR$(27)+"_GBRUSH"+STR$(INT(R%))+";"+STR$(INT(G%))+";"+STR$(INT(B%))+"$"
10040  DEF FNPIXEL$(X%, Y%) = CHR$(27)+"_GPIXEL"+STR$(INT(X%))+";"+STR$(INT(Y%))+"$"
10050  DEF FNDRAW$(X1%,Y1%,X2%,Y2%)=CHR$(27)+"_GLINE"+STR$(INT(X1%))+";"+STR$(INT(Y1%))+";"+STR$(INT(X2%))+";"+STR$(INT(Y2%))+"$"
10060  DEF FNRECT$(X1%,Y1%,X2%,Y2%)=CHR$(27)+"_GRECT"+STR$(INT(X1%))+";"+STR$(INT(Y1%))+";"+STR$(INT(X2%))+";"+STR$(INT(Y2%))+"$"
10070  DEF FNFILLRECT$(X1,Y1,X2,Y2)=CHR$(27)+"_GFILLRECT"+STR$(INT(X1))+";"+STR$(INT(Y1))+";"+STR$(INT(X2))+";"+STR$(INT(Y2))+"$"
10080  DEF FNELLIPSE$(X,Y,W,H)=CHR$(27)+"_GELLIPSE"+STR$(INT(X))+";"+STR$(INT(Y))+";"+STR$(INT(W))+";"+STR$(INT(H))+"$"
10090  DEF FNFILLELLIPSE$(X,Y,W,H)=CHR$(27)+"_GFILLELLIPSE"+STR$(INT(X))+";"+STR$(INT(Y))+";"+STR$(INT(W))+";"+STR$(INT(H))+"$"
10110  DEF FNPATH$(POINTS$) = CHR$(27)+"_GPATH"+POINTS$+"$"
10120  DEF FNFILLPATH$(POINTS$) = CHR$(27)+"_GFILLPATH"+POINTS$+"$"
10130  DEF FNSCROLL$(X%, Y%) = CHR$(27)+"_GSCROLL"+STR$(X%)+";"+STR$(Y%)+"$"
10140  DEF FNCLR$(d) = CHR$(27)+"_GCLEAR$"
10150  DEF FNCURSORON$(d) = CHR$(27)+"_E1$"
10160  DEF FNCURSOROFF$(d) = CHR$(27)+"_E0$"
10170  DEF FNCLRTERM$(d) = CHR$(27)+"_B$"
10180  RETURN
