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

programa:	TK_EOF
		| list_def_glob;

list_def_glob:	list_def_glob def_glob
		| def_glob;
def_glob:	TK_PR_STATIC dec
		| dec
		| func;

list_ident:	list_ident ',' TK_IDENTIFICADOR
		| TK_IDENTIFICADOR;

// DECLARACOES
dec:		dec_not_vet ';'
		| dec_vet ';';	
dec_not_vet:	dec_int
		| dec_float
		| dec_bool
		| dec_char
		| dec_string;
dec_int:	TK_PR_INT list_ident;
dec_float:	TK_PR_FLOAT list_ident;
dec_bool:	TK_PR_BOOL list_ident;
dec_char:	TK_PR_CHAR list_ident;
dec_string:	TK_PR_STRING list_ident;
dec_vet:	dec_not_vet '[' TK_LIT_INT ']';

// FUNCOES
func:		TK_PR_STATIC dec_not_vet '(' list_param ')' '{''}'
		| dec_not_vet '(' list_param ')' '{''}'
		| TK_PR_STATIC dec_not_vet '(' ')' '{''}'
		| dec_not_vet '(' ')' '{''}'
		| TK_PR_STATIC dec_not_vet '(' list_param ')' '{'bloco_comandos'}'
		| dec_not_vet '(' list_param ')' '{'bloco_comandos'}'
		| TK_PR_STATIC dec_not_vet '(' ')' '{'bloco_comandos'}'
		| dec_not_vet '(' ')' '{'bloco_comandos'}';
type:		TK_PR_INT
		| TK_PR_FLOAT
		| TK_PR_BOOL
		| TK_PR_CHAR
		| TK_PR_STRING;
param:		type TK_IDENTIFICADOR
		| TK_PR_CONST type TK_IDENTIFICADOR;
list_param:	list_param ',' param
		| param;

// BLOCO DE COMANDOS
bloco_comandos:	bloco_comandos comando ';'
		| comando ';' ;
comando:	dec_var_loc;// | dec_var_loc_at;// | atrib | cons_flux_cont | op_entr | op_saida | op_ret | cham_func;
dec_var_loc:	TK_PR_STATIC TK_PR_CONST type TK_IDENTIFICADOR
		| TK_PR_STATIC type TK_IDENTIFICADOR
		| TK_PR_CONST type TK_IDENTIFICADOR
		| type TK_IDENTIFICADOR;

/*dec_var_loc_at:	TK_PR_STATIC TK_PR_CONST dec_atr
		| TK_PR_STATIC dec_atr
		| TK_PR_CONST dec_atr
		| dec_atr;

dec_atr:	TK_PR_INT TK_IDENTIFICADOR TK_OC_LE TK_LIT_INT
		| TK_PR_INT TK_IDENTIFICADOR TK_OC_LE TK_IDENTIFICADOR
		| TK_PR_FLOAT TK_IDENTIFICADOR TK_OC_LE TK_LIT_FLOAT
		| TK_PR_FLOAT TK_IDENTIFICADOR TK_OC_LE TK_IDENTIFICADOR
		| TK_PR_BOOL TK_IDENTIFICADOR TK_OC_LE TK_LIT_FALSE
		| TK_PR_BOOL TK_IDENTIFICADOR TK_OC_LE TK_LIT_TRUE
		| TK_PR_BOOL TK_IDENTIFICADOR TK_OC_LE TK_IDENTIFICADOR
		| TK_PR_CHAR TK_IDENTIFICADOR TK_OC_LE TK_LIT_CHAR
		| TK_PR_CHAR TK_IDENTIFICADOR TK_OC_LE TK_IDENTIFICADOR
		| TK_PR_STRING TK_IDENTIFICADOR TK_OC_LE TK_LIT_STRING
		| TK_PR_STRING TK_IDENTIFICADOR TK_OC_LE TK_IDENTIFICADOR;*/

%%



void yyerror (char const *s){
	printf("Erro: ~%s~ de sintaxe na linha %d.", s, get_line_number());
}













