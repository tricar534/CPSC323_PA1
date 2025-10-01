
%{
    // Definitions
    #include <stdio.h>
%}


%%
    // Rules: Patterns actions
     
%%

int yywrap(){ return 1; }  //wraps above rule section, return 1 = eof

int main()
{
    yylex();
    printf("Hello\n");
    return 0;
}