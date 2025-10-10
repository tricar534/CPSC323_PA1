%{
#include <stdio.h>
#include <string.h>

/* Collect lexemes per token type */
#define BUFSZ 16384
static char KW[BUFSZ]="", IDB[BUFSZ]="", PUNC[BUFSZ]="", OP[BUFSZ]="";
static char INTL[BUFSZ]="", REALS[BUFSZ]="", STRL[BUFSZ]="", UNK[BUFSZ]="";

static void append(char *buf, size_t cap, const char *txt){
    size_t n = strlen(buf);
    if (n && n + 2 < cap) { buf[n++]=','; buf[n++]=' '; buf[n]='\0'; }
    strncat(buf, txt, cap - 1 - strlen(buf));
}
%}

    
%option noyywrap

%%
    /* Ignore comments */
"//".*                                  ;
"/*".*"*/"                              ;

    /* Ignore whitespaces */
[ \t\n]+                                ;

    /* String */
\"[^\"]*\"                              { append(STRL, BUFSZ, yytext); }

    /* Keywords */
"int"                                   { append(KW,   BUFSZ, yytext); }
"while"                                 { append(KW,   BUFSZ, yytext); }
"for"                                   { append(KW,   BUFSZ, yytext); }
"else"                                  { append(KW,   BUFSZ, yytext); }
"if"                                    { append(KW,   BUFSZ, yytext); }
"return"                                { append(KW,   BUFSZ, yytext); }
   
    /* Punctuation */
"("                                     { append(PUNC, BUFSZ, yytext); }
")"                                     { append(PUNC, BUFSZ, yytext); }
";"                                     { append(PUNC, BUFSZ, yytext); }
","                                     { append(PUNC, BUFSZ, yytext); }
"{"                                     { append(PUNC, BUFSZ, yytext); }
"}"                                     { append(PUNC, BUFSZ, yytext); }

    /* Identifier */
[a-zA-Z][a-zA-Z0-9]*                    { append(IDB,  BUFSZ, yytext); }

    /* Operator */
"<="                                    { append(OP,   BUFSZ, yytext); }
">="                                    { append(OP,   BUFSZ, yytext); }
">>"                                    { append(OP,   BUFSZ, yytext); }
"<<"                                    { append(OP,   BUFSZ, yytext); }
"=="                                    { append(OP,   BUFSZ, yytext); }
"!="                                    { append(OP,   BUFSZ, yytext); }
"&&"                                    { append(OP,   BUFSZ, yytext); }
"||"                                    { append(OP,   BUFSZ, yytext); }
"+="                                    { append(OP,   BUFSZ, yytext); }
"-="                                    { append(OP,   BUFSZ, yytext); }
"*="                                    { append(OP,   BUFSZ, yytext); }
"/="                                    { append(OP,   BUFSZ, yytext); }
"%="                                    { append(OP,   BUFSZ, yytext); }
"&="                                    { append(OP,   BUFSZ, yytext); }
"|="                                    { append(OP,   BUFSZ, yytext); }
"^="                                    { append(OP,   BUFSZ, yytext); }
"<<="                                   { append(OP,   BUFSZ, yytext); }
">>="                                   { append(OP,   BUFSZ, yytext); }
"++"                                    { append(OP,   BUFSZ, yytext); }
"--"                                    { append(OP,   BUFSZ, yytext); }
"->"                                    { append(OP,   BUFSZ, yytext); }

"<"                                     { append(OP,   BUFSZ, yytext); }
">"                                     { append(OP,   BUFSZ, yytext); }
"="                                     { append(OP,   BUFSZ, yytext); }
"+"                                     { append(OP,   BUFSZ, yytext); }
"-"                                     { append(OP,   BUFSZ, yytext); }
"*"                                     { append(OP,   BUFSZ, yytext); }
"/"                                     { append(OP,   BUFSZ, yytext); }
"%"                                     { append(OP,   BUFSZ, yytext); }


    /* Octal*/
0[0-7]+                                 { append(UNK,  BUFSZ, yytext); }

    /* Real number */
[0-9]+"."[0-9]*                         { append(REALS,BUFSZ, yytext); }

    /* Negative Integer */
"-"[0-9]+                                { append(INTL, BUFSZ, yytext); }

    /* Integer */
[0-9]+                                  { append(INTL, BUFSZ, yytext); }

    /* Unknown */
.                                       { append(UNK,  BUFSZ, yytext); }
%%

int main(void){
    printf("%-13s %s\n","Token","Lexemes");
    printf("-------------------------------\n");

    /* Run the scanner to fill the buffers */
    yylex();

    /* Print one row per token type (blank if none matched) */
    printf("%-13s %s\n","KEYWORD",     *KW    ? KW    : "");
    printf("%-13s %s\n","IDENTIFIER",  *IDB   ? IDB   : "");
    printf("%-13s %s\n","PUNCTUATION", *PUNC  ? PUNC  : "");
    printf("%-13s %s\n","OPERATOR",    *OP    ? OP    : "");
    printf("%-13s %s\n","INTEGER",     *INTL  ? INTL  : "");
    printf("%-13s %s\n","REAL NUMBER",        *REALS ? REALS : "");
    printf("%-13s %s\n","STRING",      *STRL  ? STRL  : "");
    printf("%-13s %s\n","Error",     *UNK   ? UNK   : "");
    return 0;
}
