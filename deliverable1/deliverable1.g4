//Define Grammar
grammar deliverable1;

//start rule - antlr lab uses program
program : (assignment? NEWLINE)* assignment? EOF ;

//assignment

assignment : ID operator =
( ASSIGN
| ASSIGN_PLUS
| ASSIGN_MINUS
| ASSIGN_MULT
| ASSIGN_DIV
| ASSIGN_MOD
) expression ;

expression : operator =
( PLUS
| MINUS
) expression
| expression operator =
( MULT
| DIV
| MOD
) expression
| expression operator =
( PLUS
| MINUS
) expression
| OPENBRACKET
( expression
( COMMA expression
)* COMMA?
)? CLOSEBRACKET
| OPENPAR expression CLOSEPAR
| ID
| INT
| FLOAT
| STRING
| ( TRUE
| FALSE
) ;

// Lexer
TRUE : 'True' ;
FALSE : 'False' ;

ASSIGN_PLUS : '+=' ;
ASSIGN_MINUS : '-=' ;
ASSIGN_MULT : '*=' ;
ASSIGN_DIV : '/=' ;
ASSIGN_MOD : '%=' ;
ASSIGN : '=' ;

PLUS : '+' ;
MINUS : '-' ;
MULT : '*' ;
DIV : '/' ;
MOD : '%' ;

OPENPAR : '(' ;
CLOSEPAR : ')' ;
OPENBRACKET : '[' ;
CLOSEBRACKET : ']' ;
COMMA : ',' ;

ID : [a-zA-Z_] [a-zA-Z_0-9]* ;

FLOAT : DIGIT+ '.' DIGIT* | '.' DIGIT+ ;
INT : DIGIT+ ;
STRING : '"' ( ~["\\\r\n] | '\\' . )* '"' | '\'' ( ~["\\\r\n] | '\\' . )* '\'' ;
fragment DIGIT : [0-9] ;

NEWLINE : '\r'? '\n' ;

WHITESPACE : [ \t]+ -> skip ;