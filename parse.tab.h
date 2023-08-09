/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     num = 258,
     boollit = 259,
     OP2 = 260,
     OP3 = 261,
     OP4 = 262,
     ident = 263,
     LP = 264,
     RP = 265,
     ASGN = 266,
     SC = 267,
     INT = 268,
     BOOL = 269,
     IF = 270,
     THEN = 271,
     ELSE = 272,
     BEGIN_STMT = 273,
     END = 274,
     WHILE = 275,
     DO = 276,
     PROGRAM = 277,
     VAR = 278,
     AS = 279,
     WRITEINT = 280,
     READINT = 281
   };
#endif
/* Tokens.  */
#define num 258
#define boollit 259
#define OP2 260
#define OP3 261
#define OP4 262
#define ident 263
#define LP 264
#define RP 265
#define ASGN 266
#define SC 267
#define INT 268
#define BOOL 269
#define IF 270
#define THEN 271
#define ELSE 272
#define BEGIN_STMT 273
#define END 274
#define WHILE 275
#define DO 276
#define PROGRAM 277
#define VAR 278
#define AS 279
#define WRITEINT 280
#define READINT 281




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 27 "parse.y"
{
	int iValue; // for integer value
	int bValue; // for boolean value
	char *sString; // for string value
	nodeType *nPtr;  // for node pointer
}
/* Line 1529 of yacc.c.  */
#line 108 "parse.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

