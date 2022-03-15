%{
  #include <stdio.h>
  #include <stdlib.h>
  void yyerror(char*);

%}

/*
This yacc program defines Grammar for ternary operator of C/C++ language and generate
the parser for the same.

TERNARY OPERATOR	
	ternary operator takes 3 argument
	1. The first is a comparison argument 
	2. The second is the result upon a true comparision.
	3. the third is the result upon false comparision.
	
	Syntax:
		condition ? statement_if_true : statement_if_false


Program Info:
	Purpose	:	The program will check the given input is vaild ternary operator or
				not based on the grammar rules defined. Whenever input is valid 
				program continue running and when input is invalid program stop.
	INPUT	:	Ternary operator with and without nesting.
	OUTPUT	:	Displays 'Input accepted' for a vaild input.
				otherwise, displays 'Invalid input' for invaild input.


Names of symbols that are tokens:
	NUMBER :		for any numeric value
	VARIABLE  :		for any variable.
	NEWLINE :		for newline character.
	LT :			for less than "<"
	GT :			for greater than ">
	LE :			for less than and equal to "<=".
	GE :			for greater than and equal to ">=".
	EQ :			for equals to "==".
	NE :			for not equals "!="
	OR :			for logical OR '||'
	AND :			for logical AND '&&''
	NOT :			for logical not "!"
	T : 			for boolean "true"
	F :				for boolean "false"
	
		
Assumption : 
		1. The paser only accepts boolean, logical and comparison statements only.
		2. The program will check if the given input is valid or not based on the 
		   grammar rules defined.
		   

GRAMMAR RULES:
        smallest string accepted by the grammar is :
			statement?statement:statement
*/



%token NUMBER VARIABLE NEWLINE LT GT LE GE EQ NE OR AND NOT T F
%right '?' ':'
%left OR
%left AND 
%left EQ NE
%left LE GE LT GT
%right NOT 
%left '(' ')'

/* Grammar */

%%
stmt	:stmt S NEWLINE 	{	printf("Input accepted.\n\n");	}
		|
		;

S	:EXP S1
	|'(' S ')'
	|'(' S ')' S1
	;

S1	:'?' S2
	;

S2	:EXP S3
	|S S3
	;

S3	:':' S4
	;
        
S4	:EXP 
    |S
    ;

EXP : EXP LT EXP  
    | EXP GT EXP  
    | EXP LE EXP 
	| EXP GE EXP 
	| EXP EQ EXP 
    | EXP NE EXP 
	| EXP OR EXP 
	| EXP AND EXP
	| NOT EXP
	| VAL
	|'(' EXP ')'
	;
	
VAL :VARIABLE
	| NUMBER
	| T
	| F
	;
%%

int main() {
    printf("Enter expression: \n");
    yyparse();
	system("pause");
	return 0;
}
 
void yyerror(char* s) {
    printf("Invalid input\n");
}