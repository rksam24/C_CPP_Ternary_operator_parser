%{ 
  #include "y.tab.h"

  /*
	lex file that provides token to the parser.
	This lex file will extract all the tokens and everthing else is sent as well.
	The yacc file will parse the tokens as per the grammar rules 
	
	semmantic action:
		prints vaild input if the parser is able to generate the parser tree
		for the given input.

  */

%}

/*  Regular definitions */

digit [0-9]+
alpha [a-zA-Z_][a-zA-Z0-9_]*


%%
{digit}		return NUMBER;
"<"			return LT;
">"			return GT;
"<="      	return LE;
">="      	return GE;
"=="      	return EQ;
"!="      	return NE;
"||"      	return OR;
"&&"      	return AND;
"!"       	return NOT;
"true"    	return T;
"false"   	return F;
{alpha}    	return VARIABLE;
[\t]|" "	;
.         	return *yytext;
\n        	return NEWLINE;
%%

int yywrap()
{
  return 1;
}