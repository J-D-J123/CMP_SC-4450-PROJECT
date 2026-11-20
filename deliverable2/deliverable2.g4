// define grammar 
grammar deliverable2; 

// start rule
program : (statement? NEWLINE)* statement? EOF ; 

// a assignment is an assignment or an if block 
statement : assignment 
| ifStatement ; 

// assignmnet 
assignment : ID operator = ( ASSIGN 
| ASSIGN_PLUS
| ASSIGN_MINUS
| ASSIGN_MULT
| ASSIGN_DIV
| ASSIGN_MOD) expression ; 

// if statment, elif statment, and else statment 
ifStatement : IF expression COLON block ( NEWLINE ELIF expression COLON block)* (
NEWLINE ELSE COLON block)? ; 

// indented block python represnets it via tabs for spacing
block : ( NEWLINE TAB assignment)+ ; 

expression : operator = ( PLUS 
| MINUS ) expression 
| expression operator = ( MULT
| DIV
| MOD ) expression 
| expression operator = ( PLUS
| MINUS ) expression
| expression operator = ( LESS
| LESS_EQUAL
| GREATER
| GREATER_EQUAL
| EQUAL
| NOT_EQUAL ) expression 
| operator = NOT expression 
| expression operator = AND expression 
| expression operator = OR expression 
| OPENBRACKET ( expression ( COMMA expression )* COMMA? )? CLOSEBRACKET
| OPENPAR expression CLOSEPAR
| ID
| INT
| FLOAT
| STRING 
| ( TRUE
| FALSE ) ; 

// lexer deffintions 

// keywords 
TRUE : 'True' ;
FALSE : 'False' ;
IF : 'if' ;
ELIF : 'elif' ;
ELSE : 'else' ;
AND : 'and' ;
OR : 'or' ;
NOT : 'not' ;

// comparison operations 
EQUAL : '==' ;
NOT_EQUAL : '!=' ;
LESS_EQUAL : '<=' ;
GREATER_EQUAL : '>=' ;
LESS : '<' ;
GREATER : '>' ;

// assignment operations 
ASSIGN_PLUS : '+=' ;
ASSIGN_MINUS : '-=' ;
ASSIGN_MULT : '*=' ;
ASSIGN_DIV : '/=' ;
ASSIGN_MOD : '%=' ;
ASSIGN : '=' ;

// arithmetic operations 
PLUS : '+' ;
MINUS : '-' ;
MULT : '*' ;
DIV : '/' ;
MOD : '%' ;

// punctuation characters 
COLON : ':' ;
OPENPAR : '(' ;
CLOSEPAR : ')' ;
OPENBRACKET : '[' ;
CLOSEBRACKET : ']' ;
COMMA : ',' ;

// valid varaible names 
ID : [a-zA-Z_] [a-zA-Z_0-9]* ;

FLOAT : DIGIT+ '.' DIGIT* | '.' DIGIT+ ;
INT : DIGIT+ ;
STRING : '"' ( ~["\\\r\n] | '\\' . )* '"' | '\'' ( ~["\\\r\n] | '\\' . )* '\'' ;
fragment DIGIT : [0-9] ;

NEWLINE : '\r'? '\n' ;

// tabs are kept via functions in python but remove spaces... 
TAB : '\t' ;

WHITESPACE : ' '+ -> skip ;
