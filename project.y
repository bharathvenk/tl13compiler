%{
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int yylex();
void yyerror(char const *);

/* Define the union */


%}


/* Define the token types */
%token <iValue> num
%token <sString> ident
%token <bValue> boollit
%token LP
%token RP
%token ASGN
%token SC
%token OP2
%token OP3
%token OP4
%token THEN
%token IF
%token ELSE
%token BEGIN_STMT
%token END
%token WHILE
%token DO
%token PROGRAM
%token VAR
%token AS
%token INT
%token BOOL
%token WRITEINT
%token READINT
%token DIV_OP
%token MUL_OP
%token PLUS_OP
%token MINUS_OP
%token MOD_OP
%token EQ_OP
%token NEQ_OP
%token L_OP
%token G_OP
%token LEQ_OP
%token GEQ_OP

%union {
    int iValue;
    char* sString;
    int bValue;
};

/* Define the grammar rules */
%%
program:
    PROGRAM ident SC declarations subprogram_declarations compound_statement

declarations:
    VAR var_declaration_list
    | empty

var_declaration_list:
    var_declaration_list var_declaration SC
    | var_declaration SC

var_declaration:
    id_list AS type

id_list:
    id_list AS ident
    | ident

type:
    INT
    | BOOL

subprogram_declarations:
    subprogram_declarations subprogram_declaration SC
    | empty

subprogram_declaration:
    subprogram_head declarations compound_statement

subprogram_head:
    type ident LP formal_parameter_list RP

formal_parameter_list:
    formal_parameter_list SC formal_parameter
    | formal_parameter

formal_parameter:
    id_list AS type

compound_statement:
    BEGIN_STMT optional_statements END

optional_statements:
    statement_list
    | empty

statement_list:
    statement_list SC statement
    | statement

statement:
    ident ASGN expression
    | compound_statement
    | IF expression THEN statement ELSE statement
    | WHILE expression DO statement

IDENT:
    ident

expression:
    simple_expression optional_relational_expression

optional_relational_expression:
    relational_operator simple_expression
    | empty

simple_expression:
    optional_sign term more_terms

optional_sign:
    PLUS_OP
    | MINUS_OP
    | empty

more_terms:
    more_terms adding_operator term
    | empty

term:
    term multiplying_operator factor
    | factor

factor:
    LP expression RP
    | ident
    | num
    | boollit
    | NEQ_OP factor

relational_operator:
    EQ_OP
    | NEQ_OP
    | L_OP
    | G_OP
    | LEQ_OP
    | GEQ_OP

adding_operator:
    PLUS_OP
    | MINUS_OP
    | OP3

multiplying_operator:
    MUL_OP
    | DIV_OP
    | MOD_OP
    | OP2

empty:

%%

void yyerror(char const *s) {
    fprintf(stderr, "%s\n", s);
}

/*int main() {
    yyparse();
    return 0;
}*/
