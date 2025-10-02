
%{
    // Definitions
    #include <stdio.h>
%}


%%
    // Rules: Patterns actions

"//".*      { /*Ignore comments, .* any character reapeated*/ }
[ \t\n]+    { /* Ignore whitespaces */ } 

    /* KEYWORD */ 
"int"       { printf("KEYWORD \t%s\n", yytext); }
"while"     { printf("KEYWORD \t%s\n", yytext); }
"for"       { printf("KEYWORD \t%s\n", yytext); }
"else"      { printf("KEYWORD \t%s\n", yytext); }
"if"        { printf("KEYWORD \t%s\n", yytext); }
"return"    { printf("KEYWORD \t%s\n", yytext); }

    /* PUNCTUATION */ 
"("     { printf("PUNCTUATION \t%s\n", yytext);}
")"     { printf("PUNCTUATION \t%s\n", yytext);}
";"     { printf("PUNCTUATION \t%s\n", yytext);}
","     { printf("PUNCTUATION \t%s\n", yytext);}
"{"     { printf("PUNCTUATION \t%s\n", yytext);}
"}"     { printf("PUNCTUATION \t%s\n", yytext);}
    
    /* IDENTIFIER */
[a-zA-Z][a-zA-Z0-9]* {printf("IDENTIFIER \t%s\n", yytext);}

    /* OPERATOR */ 
"<="    { printf("OPERATOR \t%s\n", yytext);}
">="    { printf("OPERATOR \t%s\n", yytext);}
">>"    { printf("OPERATOR \t%s\n", yytext);}
"<<"    { printf("OPERATOR \t%s\n", yytext);}
"=="    { printf("OPERATOR \t%s\n", yytext);}
"<"     { printf("OPERATOR \t%s\n", yytext);}
">"     { printf("OPERATOR \t%s\n", yytext);}
"="     { printf("OPERATOR \t%s\n", yytext);}
"+"     { printf("OPERATOR \t%s\n", yytext);}
"-"     { printf("OPERATOR \t%s\n", yytext);}
"%"     { printf("OPERATOR \t%s\n", yytext);}

    /* INTEGER */ 
[0-9]+   { printf("INTEGER \t%s\n", yytext);}

    /* REAL NUMBER */ 
[0-9]+"."[0-9]*   {printf("REAL NUMBER \t%s\n", yytext);}

%%

int yywrap(){ return 1; }  //wraps above rule section, return 1 = eof

int main()
{
    printf("TOKEN\t\tLexems\n------------------------\n");
    yylex();
    return 0;
}