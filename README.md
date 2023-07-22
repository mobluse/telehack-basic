# Telehack BASIC
Scripts in TeleBASIC for [Telehack.com](https://telehack.com/telehack.html). The scripts, so far, are translations of the scripts of the same name in the file [programs.h](https://github.com/fdivitto/FabGL/blob/master/examples/VGA/MultitaskingCPM/src/programs.h) in MultitaskingCPM in [FabGL](https://github.com/fdivitto/FabGL).

I use `sed` to extract the programs:

    sed -e '/0x/ d' -e 's/^[^"]*\"\(.*\)\".*NL/\1/;s/\\\"/\"/g' programs.h

The BASIC dialect that the example scripts in MultitaskingCPM is using is MBASIC AKA BASIC-80 by Microsoft. This is similar to GW-BASIC, since GWBASIC is a translation to 8086 assembler from MBASIC's 8080 assembler.

Telehack BASIC doesn't have WHILE, WEND, and WIDTH. TeleBASIC don't use % after variables to indicate that they are integers; at least not in practice for functions. In Telehack BASIC all numbers seem to be floats. When numbers are printed a space is added before positive numbers as in MBASIC, but STR$() doesn't add a space in TeleBASIC. The editor inside BASIC doesn't seem to handle lines wider than the terminal.

Telehack BASIC claims to be Dartmouth DTSS TeleBASIC (c) 1964,1966,1969,1970,1971,1979.
