%{
    // Definitions
    #include <stdio.h>
%}

%%
    /* Rules: Patterns actions */

"//".*      { /* Ignore comments */ }
[ \t\n]+    { /* Ignore whitespaces */ } 

    /* STRING */
\"[^\"]*\"      { printf("%-14s %s\n", "STRING", yytext); }   // 

    /* KEYWORD */ 
"int"       { printf("%-14s %s\n", "KEYWORD", yytext); }
"while"     { printf("%-14s %s\n", "KEYWORD", yytext); }
"for"       { printf("%-14s %s\n", "KEYWORD", yytext); }
"else"      { printf("%-14s %s\n", "KEYWORD", yytext); }
"if"        { printf("%-14s %s\n", "KEYWORD", yytext); }
"return"    { printf("%-14s %s\n", "KEYWORD", yytext); }

    /* PUNCTUATION */ 
"("     { printf("%-14s %s\n", "PUNCTUATION", yytext); }
")"     { printf("%-14s %s\n", "PUNCTUATION", yytext); }
";"     { printf("%-14s %s\n", "PUNCTUATION", yytext); }
","     { printf("%-14s %s\n", "PUNCTUATION", yytext); }
"{"     { printf("%-14s %s\n", "PUNCTUATION", yytext); }
"}"     { printf("%-14s %s\n", "PUNCTUATION", yytext); }
    
    /* IDENTIFIER */
[a-zA-Z][a-zA-Z0-9]* { printf("%-14s %s\n", "IDENTIFIER", yytext); }

    /* OPERATOR — longer ones first */ 
"=="    { printf("%-14s %s\n", "OPERATOR", yytext); }
"!="    { printf("%-14s %s\n", "OPERATOR", yytext); }
"<="    { printf("%-14s %s\n", "OPERATOR", yytext); }
">="    { printf("%-14s %s\n", "OPERATOR", yytext); }
">>"    { printf("%-14s %s\n", "OPERATOR", yytext); }
"<<"    { printf("%-14s %s\n", "OPERATOR", yytext); }
"&&"    { printf("%-14s %s\n", "OPERATOR", yytext); }
"||"    { printf("%-14s %s\n", "OPERATOR", yytext); }
"+="    { printf("%-14s %s\n", "OPERATOR", yytext); }
"-="    { printf("%-14s %s\n", "OPERATOR", yytext); }
"*="    { printf("%-14s %s\n", "OPERATOR", yytext); }
"/="    { printf("%-14s %s\n", "OPERATOR", yytext); }
"%="    { printf("%-14s %s\n", "OPERATOR", yytext); }
"&="    { printf("%-14s %s\n", "OPERATOR", yytext); }
"|="    { printf("%-14s %s\n", "OPERATOR", yytext); }
"^="    { printf("%-14s %s\n", "OPERATOR", yytext); }
"<<="   { printf("%-14s %s\n", "OPERATOR", yytext); }
">>="   { printf("%-14s %s\n", "OPERATOR", yytext); }
"++"    { printf("%-14s %s\n", "OPERATOR", yytext); }
"--"    { printf("%-14s %s\n", "OPERATOR", yytext); }
"->"    { printf("%-14s %s\n", "OPERATOR", yytext); }

    /* Single-char operators */ 
"<"     { printf("%-14s %s\n", "OPERATOR", yytext); }
">"     { printf("%-14s %s\n", "OPERATOR", yytext); }
"="     { printf("%-14s %s\n", "OPERATOR", yytext); }
"+"     { printf("%-14s %s\n", "OPERATOR", yytext); }
"-"     { printf("%-14s %s\n", "OPERATOR", yytext); }
"*"     { printf("%-14s %s\n", "OPERATOR", yytext); }
"/"     { printf("%-14s %s\n", "OPERATOR", yytext); }
"%"     { printf("%-14s %s\n", "OPERATOR", yytext); }
"!"     { printf("%-14s %s\n", "OPERATOR", yytext); }
"&"     { printf("%-14s %s\n", "OPERATOR", yytext); }
"|"     { printf("%-14s %s\n", "OPERATOR", yytext); }
"^"     { printf("%-14s %s\n", "OPERATOR", yytext); }
"~"     { printf("%-14s %s\n", "OPERATOR", yytext); }
"?"     { printf("%-14s %s\n", "OPERATOR", yytext); }
":"     { printf("%-14s %s\n", "OPERATOR", yytext); }

    /* INTEGER */ 
[0-9]+   { printf("%-14s %s\n", "INTEGER", yytext); }

    /* REAL NUMBER */ 
[0-9]+"."[0-9]*   { printf("%-14s %s\n", "REAL NUMBER", yytext); }

%%

int yywrap(){ return 1; }  //wraps above rule section, return 1 = eof

int main()
{
    printf("%-14s %s\n", "TOKEN", "Lexemes");
    printf("-------------- ----------------\n");
    yylex();
    return 0;
}
