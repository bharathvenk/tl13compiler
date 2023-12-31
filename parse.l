%{
#include <stdlib.h>
#include "node.h"
#include "parse.tab.h"
%}

DIV_OP "div"
MUL_OP "*"
PLUS_OP "+"
MINUS_OP "-"
MOD_OP "mod"
EQ_OP "="
NEQ_OP "!="
L_OP "<"
G_OP ">"
LEQ_OP "<="
GEQ_OP ">="

%%
[1-9][0-9]*|0	{
			yylval.iValue = atoi(yytext);
			return num;
		}
[A-Z][A-Z0-9]*	{
			yylval.sString = NULL;
			char* temp = malloc(sizeof(yytext));
			strcpy(temp,yytext);
			yylval.sString = temp;
			
			return ident;
		}
false|true	{
			if (yytext == "false")
				yylval.bValue = 0;
			else
				yylval.bValue = 1;
			
			return boollit;
		}
"("		{
			
			return LP;
		}
")"		{
			
			return RP;
		}
":="		{
			
			return ASGN;
		}
";"		{
			
			return SC;
		}
{MUL_OP}|{DIV_OP}|{MOD_OP}	{
			yylval.iValue = stringToEnum(yytext);
			
			return OP2;
		}
{PLUS_OP}|{MINUS_OP}		{
			yylval.iValue = stringToEnum(yytext);
			
			return OP3;
		}
{EQ_OP}|{NEQ_OP}|{L_OP}|{G_OP}|{LEQ_OP}|{GEQ_OP}	{
					yylval.iValue = stringToEnum(yytext);
					
					return OP4;
		}
"then"		{
			
			return THEN;
		}

"if"		{
			
			return IF;
		}
"else"		{
			
			return ELSE;
		}
"begin"		{
			
			return BEGIN_STMT;
		}
"end"		{
			
			return END;
		}
"while"		{
			
			return WHILE;
		}
"do"		{
			
			return DO;
		}
"program"	{
			
			return PROGRAM;
		}
"var"		{
			
			return VAR;
		}
"as"		{
			
			return AS;
		}
"int"		{
			
			return INT;
		}
"bool"		{
			
			return BOOL;
		}
"writeInt"	{
			
			return WRITEINT;
		}
"readInt"	{
			
			return READINT;
		}
[\n]		{yylineno++;}

%%
int stringToEnum(char* string)
{
	if (!strcmp(string, "div"))
        	return DIV_OP;	
	if (!strcmp(string,  "*"))
		return MUL_OP;
	if (!strcmp(string, "+"))
        	return PLUS_OP;
	if (!strcmp(string, "-"))
   		return MINUS_OP;
	if (!strcmp(string, "mod"))
        	return MOD_OP;
	if (!strcmp(string, "="))
        	return EQ_OP;
	if (!strcmp(string, "!="))
        	return NEQ_OP;
	if (!strcmp(string, "<"))
        	return L_OP;
	if (!strcmp(string, ">"))
        	return G_OP;
	if (!strcmp(string, "<="))
        	return LEQ_OP;
	if (!strcmp(string, ">="))
        	return GEQ_OP;
}