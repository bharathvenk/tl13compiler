%option noyywrap

%{
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "node.h"
#include "project2.tab.h"

extern FILE *yyin;


int yylex(void);
/*void yyerror(const char* s);*/
int stringToEnum(char* string);


%}

/*DIV_OP "div"
/*MUL_OP "*"
/*PLUS_OP "+"
/*MINUS_OP "-"
/*MOD_OP "mod"
/*EQ_OP "="
/*NEQ_OP "!="
/*L_OP "<"
/*G_OP ">"
/*LEQ_OP "<="
/*GEQ_OP ">=" 

%%
[1-9][0-9]*|0    {
                        yylval.iValue = atoi(yytext);
                        return num;
                    }
[A-Z][A-Z0-9]*    {
                        yylval.sString = NULL;
                        char* temp = (char*)malloc(sizeof(yytext));
                        strcpy(temp, yytext);
                        yylval.sString = temp;

                        return ident;
                    }
false|true        {
                        if (strcmp(yytext, "false") == 0)
                            yylval.bValue = 0;
                        else
                            yylval.bValue = 1;

                        return boollit;
                    }
"("            {

                        return LP;
                    }
")"            {

                        return RP;
                    }
":="            {

                        return ASGN;
                    }
";"            {

                        return SC;
                    }
"*"|"div"|"mod"				{
								yylval.sString = (char *)malloc(yyleng+1);
								strcpy(yylval.sString, yytext);
								return OP2;
							}
"+"|"-"						{
								yylval.sString = (char *)malloc(yyleng+1);
								strcpy(yylval.sString, yytext);
								return OP3;
							}
"="|"!="|"<"|">"|"<="|">="	{
								yylval.sString = (char *)malloc(yyleng+1);
								strcpy(yylval.sString, yytext);
								return OP4;
							}
"then"            {

                        return THEN;
                    }

"if"            {

                        return IF;
                    }
"else"            {

                        return ELSE;
                    }
"begin"            {

                        return BEGIN_STMT;
                    }
"end"            {

                        return END;
                    }
"while"            {

                        return WHILE;
                    }
"do"            {

                        return DO;
                    }
"program"        {

                        return PROGRAM;
                    }
"var"            {

                        return VAR;
                    }
"as"            {

                        return AS;
                    }
"int"            {

                        return INT;
                    }
"bool"            {

                        return BOOL;
                    }
"writeInt"        {

                        return WRITEINT;
                    }
"readInt"        {

                        return READINT;
                    }

%%







int main(int argc, char **argv) {
    // Check if input file is provided
    if (argc != 2) {
        fprintf(stderr, "Usage: %s <input_file>\n", argv[0]);
        return 1;
    }

    // Open input file
    yyin = fopen(argv[1], "r");
    if (!yyin) {
        fprintf(stderr, "Error opening input file: %s\n", argv[1]);
        return 1;
    }

    // Initialize lexer
    yyrestart(yyin);

    // Iterate over tokens
    int token;
    while ((token = yylex())) {
        // Print token-lexeme pair
        switch(token) {
            case num:
                printf("number<");
                printf("%d", yylval.iValue);
                printf(">");
                break;
            case ident:
                printf("identifier<");
                printf("%s", yylval.sString);
                free(yylval.sString);
                printf(">");
                break;
            case boollit:
                printf("boollit <");
                printf("%s", yylval.bValue ? "true" : "false");
                printf(">");
                break;
            case VAR:
            case AS:
            case INT:
            case BOOL:
            case PROGRAM:
            case DO:
            case WHILE:
            case END:
            case BEGIN_STMT:
            case ELSE:
            case THEN:
            case IF:
                printf("keyword<");
                printf("%s", yytext);
                printf(">");
                break;
            case LP:
                printf("LP<");
                printf("%s", yytext);
                printf(">");
                break;
            case RP:
                printf("RP<");
                printf("%s", yytext);
                printf(">");
                break;
            case ASGN:
                printf("ASGN<");
                printf("%s", yytext);
                printf(">");
                break;
            case SC:
                printf("SC<");
                printf("%s", yytext);
                printf(">");
                break;
            case OP2:
                printf("OP2<");
                printf("%s", yylval.sString);
                printf(">");
                free(yylval.sString);
                break;
            case OP3:
                printf("OP3<");
                printf("%s", yylval.sString);
                printf(">");
                free(yylval.sString);
                break;
            case OP4:
                printf("OP4<");
                printf("%s", yylval.sString);
                printf(">");
                free(yylval.sString);
                break;
            default:
                printf("%s", yytext);
        }
        printf("\n");
    }

    // Close input file
    fclose(yyin);

    return 0;
}
