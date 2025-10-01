
%{
    // Definitions
%}


%%
    // Rules: Patterns actions
     
%%

int yywrap(){ return 0;}  //wraps above rule section

int main()
{

    yylex();
    return 0;
}