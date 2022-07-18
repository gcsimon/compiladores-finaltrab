%{

// Turma B
// Giovani Chassot Simon (244113)
// Vinicius Meirelles Pereira (285637)

#include <stdio.h>
int yylex(void);
void yyerror (char const *s);
int get_line_number();
%}

%start programa

%token TK_PR_INT
%token TK_PR_FLOAT
%token TK_PR_BOOL
%token TK_PR_CHAR
%token TK_PR_STRING
%token TK_PR_IF
%token TK_PR_THEN
%token TK_PR_ELSE
%token TK_PR_WHILE
%token TK_PR_DO
%token TK_PR_INPUT
%token TK_PR_OUTPUT
%token TK_PR_RETURN
%token TK_PR_CONST
%token TK_PR_STATIC
%token TK_PR_FOREACH
%token TK_PR_FOR
%token TK_PR_SWITCH
%token TK_PR_CASE
%token TK_PR_BREAK
%token TK_PR_CONTINUE
%token TK_PR_CLASS
%token TK_PR_PRIVATE
%token TK_PR_PUBLIC
%token TK_PR_PROTECTED
%token TK_PR_END
%token TK_PR_DEFAULT
%token TK_OC_LE
%token TK_OC_GE
%token TK_OC_EQ
%token TK_OC_NE
%token TK_OC_AND
%token TK_OC_OR
%token TK_OC_SL
%token TK_OC_SR
%token TK_LIT_INT
%token TK_LIT_FLOAT
%token TK_LIT_FALSE
%token TK_LIT_TRUE
%token TK_LIT_CHAR
%token TK_LIT_STRING
%token TK_IDENTIFICADOR
%token TOKEN_ERRO
%token TK_EOF 0

%%

programa:
	  TK_EOF
	| list_def_glob;

list_def_glob:
	  list_def_glob def_glob
	| def_glob;
def_glob:
	  TK_PR_STATIC dec
	| dec
	| func;

list_ident:
	  list_ident ',' TK_IDENTIFICADOR
	| TK_IDENTIFICADOR;

type:
	  TK_PR_INT
	| TK_PR_FLOAT
	| TK_PR_BOOL
	| TK_PR_CHAR
	| TK_PR_STRING;

lit_var:
	  lit_arit
	| lit_log
	| TK_LIT_CHAR
	| TK_LIT_STRING;
lit_arit:
	  TK_LIT_INT
	| TK_LIT_FLOAT;
lit_log:
	  TK_LIT_FALSE
	| TK_LIT_TRUE;

// DECLARACOES
dec:
	  dec_not_vet ';'
	| dec_vet ';';
dec_not_vet:
	  type list_ident;
dec_vet:
	  dec_not_vet '[' TK_LIT_INT ']';

stat_const:
	  TK_PR_STATIC TK_PR_CONST
	| TK_PR_STATIC
	| TK_PR_CONST;

// FUNCOES
func:
	  TK_PR_STATIC type TK_IDENTIFICADOR list_param bloco_comandos
	| type TK_IDENTIFICADOR list_param bloco_comandos
param:
	  type TK_IDENTIFICADOR
	| TK_PR_CONST type TK_IDENTIFICADOR;
list_param:
	  '('list_param_rec')'
	| '(' ')';
list_param_rec:
	  list_param_rec ',' param
	| param;

// BLOCO DE COMANDOS
bloco_comandos:
	  '{' bloco_com_rec'}'
	| '{' '}';
bloco_com_rec:
	  bloco_com_rec comando
	| comando;
comando:
	  dec_var_loc ';' | dec_var_loc_at ';' | atrib ';'| cont_flux | cham_func ';' | ret_break_cont ';' | op_entr ';' | op_saida ';' | shift ';';
dec_var_loc:
	  stat_const type TK_IDENTIFICADOR
	| type TK_IDENTIFICADOR;

dec_var_loc_at:
	  type TK_IDENTIFICADOR TK_OC_LE lit_var
	| type TK_IDENTIFICADOR TK_OC_LE TK_IDENTIFICADOR
	| stat_const type TK_IDENTIFICADOR TK_OC_LE lit_var
	| stat_const type TK_IDENTIFICADOR TK_OC_LE TK_IDENTIFICADOR;

atrib:
	  TK_IDENTIFICADOR '=' expr
	| TK_IDENTIFICADOR '[' expr ']' '=' expr;

cham_func:
	  TK_IDENTIFICADOR args;
args:
	  '(' args_rec ')'
	| '(' ')';
args_rec:
	  args_rec ',' expr
	| expr;

ret_break_cont:
	  TK_PR_RETURN expr
	| TK_PR_BREAK
	| TK_PR_CONTINUE;

op_entr:	
	  TK_PR_INPUT TK_IDENTIFICADOR;
op_saida:
	  TK_PR_OUTPUT TK_IDENTIFICADOR
	| TK_PR_OUTPUT lit_var;

shift:
	  TK_IDENTIFICADOR shift_OC TK_LIT_INT;
	| TK_IDENTIFICADOR '[' expr ']' shift_OC TK_LIT_INT;
shift_OC:
	  TK_OC_SR
	| TK_OC_SL;

cont_flux:
	  if_else_opt | for | while;

if_else_opt:
	  if
	| if else;
if:
	  TK_PR_IF '(' expr ')' bloco_comandos;
else:
	  TK_PR_ELSE '(' expr ')' bloco_comandos;

for:
	  TK_PR_FOR '(' atrib ':' expr ':' atrib ')' bloco_comandos;

while:
	  TK_PR_WHILE '(' expr ')' bloco_comandos;


// EXPRESSOES - NAO TERMINADO!!!!
expr:
	  expr op_bin exprs
	| exprs
	| op_un exprs;
exprs:
	  TK_IDENTIFICADOR
	| TK_IDENTIFICADOR '[' expr ']'
	| expr_arit
	| expr_log;
expr_arit:
	  lit_arit
	| cham_func;
expr_log:
	  lit_log;

op_bin:
	  '+' | '-' | '*' | '/' | '%' | '|' | '&' | '^' | TK_OC_LE | TK_OC_GE | TK_OC_EQ | TK_OC_NE | TK_OC_AND | TK_OC_OR
	| TK_OC_SL | TK_OC_SR;

op_un:
	  '+' | '-' | '!' | '&' | '*' | '?' | '#';

%%



void yyerror (char const *s){
	printf("Erro: ~%s~ de sintaxe na linha %d.", s, get_line_number());
}













