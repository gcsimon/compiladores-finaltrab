%{
#define NUMBER 256
#define PLUS 257
#define MINUS 258
#define TIMES 259
#define DIVIDE 260
#define POWER 261
#define LEFT 262
#define RIGHT 263
#define END 264
%}

%option noyywrap

white [ \t]+
digit [0-9]
integer {digit}+
exponent [eE][+-]?{integer}
real {integer}("."{integer})?{exponent}?

%%


{white} { }
{real} { return NUMBER; }

"+" return PLUS;
"-" return MINUS;
"*" return TIMES;
"/" return DIVIDE;
"^" return POWER;
"(" return LEFT;
")" return RIGHT;
"\n" return END;

%%

int main () {
  int token;

  while ((token = yylex())){
    printf("TOKEN [%d] [%s]\n", token, yytext);

  }

  return 0;
}
