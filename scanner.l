%{
#include "tokens.h"
int lineNumber = 1;
%}

op_simp [\,\;\:\(\)\[\]\{\}\+\-\|\*\/\<\>\=\!\&\%\#\^\.\$]
char_uc [A-Z]
char_lc [a-z]
alfab {char_uc}|{char_lc}|_
dig [0-9]
sig \+|\-

ident {alfab}({alfab}|{dig})*
lit_i {sig}?{dig}+
lit_f ({lit_i}.{dig}+)|(E{lit_i})
lit_c \'\.\'
lit_s \"\.*\"

ignore [' ']


%%

{op_simp}   { return yytext[0]; }
int         { return TK_PR_INT; }
float       { return TK_PR_FLOAT; }
bool        { return TK_PR_BOOL; }
char        { return TK_PR_CHAR; }
string      { return TK_PR_STRING; }
if          { return TK_PR_IF; }
then        { return TK_PR_THEN; }
else        { return TK_PR_ELSE; }
while       { return TK_PR_WHILE; } 
do          { return TK_PR_DO; }
input       { return TK_PR_INPUT; }
output      { return TK_PR_OUTPUT; }
return      { return TK_PR_RETURN; }
const       { return TK_PR_CONST; }
static      { return TK_PR_STATIC; }
foreach     { return TK_PR_FOREACH; }
for         { return TK_PR_FOR; }
switch      { return TK_PR_SWITCH; }
case        { return TK_PR_CASE; }
break       { return TK_PR_BREAK; }
continue    { return TK_PR_CONTINUE; }
class       { return TK_PR_CLASS; }
private     { return TK_PR_PRIVATE; }
public      { return TK_PR_PUBLIC; }
protected   { return TK_PR_PROTECTED; }
end         { return TK_PR_END; }
default     { return TK_PR_DEFAULT; }
"<="        { return TK_OC_LE; }
">="        { return TK_OC_GE; }
"=="        { return TK_OC_EQ; }
"!="        { return TK_OC_NE; }
"&&"        { return TK_OC_AND; }
"||"        { return TK_OC_OR; }
">>"        { return TK_OC_SL; }
"<<"        { return TK_OC_SR; }
{lit_i}     { return TK_LIT_INT; }
{lit_f}     { return TK_LIT_FLOAT; }
"false"     { return TK_LIT_FALSE; }
"true"      { return TK_LIT_TRUE; }
{lit_c}     { return TK_LIT_CHAR; }
{lit_s}     { return TK_LIT_STRING; }
{ident}     { return TK_IDENTIFICADOR; }

{ignore}    { }

"\n"                 {++lineNumber;}

. return TOKEN_ERRO;


%%
int yywrap() {
    return 1;
}

int get_line_number() {
    return lineNumber;
}

