flex ternary.l
bison -yd ternary.y
gcc lex.yy.c y.tab.c -o Prog
Prog.exe