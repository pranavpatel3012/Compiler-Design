%{
#include <stdlib.h>
void yyerror(char *);
#include "y.tab.h"
extern int yylval;
extern char yyc;
%}
%%
[0-9]+       {
                yylval = atoi(yytext);
                return INTEGER;
           }
[A-Za-z]+     {
		yyc = yytext;
   		return CHAR;
	   }
[-+*/()=\n]       return *yytext;
[ \t]      ; /* skip whitespace */
.          yyerror("invalid character");
%%
int yywrap(void) {
    return 1;
}
