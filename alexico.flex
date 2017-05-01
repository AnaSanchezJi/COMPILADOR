/*Seccion de codigo de usuario*/
package analizadorlex;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;

//clase de los token devueltos
class Yytoken {
    Yytoken (int numToken,String token, String tipo, int linea, int columna){
        //Contador para el número de tokens reconocidos
        this.numToken = numToken;
        //String del token reconocido
        this.token = new String(token);
        //Tipo de componente léxico encontrado
        this.tipo = tipo;
        //Número de linea
        this.linea = linea;
        //Columna donde empieza el primer carácter del token
        this.columna = columna;
    }
    //Métodos de los atributos de la clase
    public int numToken;
    public String token;
    public String tipo;
    public int linea;
    public int columna;
    //Metodo que devuelve los datos necesarios que escribiremos en un archive de salida
    public String toString() {
        return "Token#"+numToken+": "+token+"|"+"  Componente Lexico:  "+"|"+tipo+" ["+"Linea: "+(linea)+ "]";
    }
}

/* Seccion de opciones y declaraciones de JFlex */
%% //inicio de opciones
//Cambiamos el nombre la funcion para el siguiente token por nextToken
%function nextToken
//Clase publica
%public
//Cambiamos el nombre de la clase del analizador
%class AnalizadorLexico
//Agregamos soporte a unicode
%unicode
//Codigo java
%{
	
    private int contador;
    private ArrayList<Yytoken> tokens;

	private void writeOutputFile() throws IOException{
			String filename = "file.out";
			BufferedWriter out = new BufferedWriter(
				new FileWriter(filename));
            System.out.println("\n*** Tokens guardados en archivo ***\n");
			for(Yytoken t: this.tokens){
				System.out.println(t);
				out.write(t + "\n");
			}
			out.close();
	}
%}
//Creamos un contador para los tokens
%init{
    contador = 0;
	tokens = new ArrayList<Yytoken>();
%init}
//Cuando se alcanza el fin del archivo de entrada
%eof{
	try{
		this.writeOutputFile();
        //System.exit(0);
	}catch(IOException ioe){
		ioe.printStackTrace();
	}
%eof}
//Activar el contador de lineas, variable yyline
%line
//Activar el contador de columna, variable yycolumn
%column
//Fin de opciones

//Expresiones regulares
//Declaraciones
EXP_ALPHA=[A-Za-z]
EXP_DIGITO=[0-9]
EXP_COMENTARIO=[#]
EXP_ALPHANUMERIC={EXP_ALPHA}|{EXP_DIGITO}
NUMERO=({EXP_DIGITO})+
IDENTIFICADOR={EXP_ALPHA}({EXP_ALPHANUMERIC})*
ESPACIO=" "
TABULADOR=\t
SALTO=\n|\r|\r\n
COMENTARIO={EXP_COMENTARIO}({IDENTIFICADOR}|{NUMERO}|{ESPACIO}|{TABULADOR})*{EXP_COMENTARIO}


//fin declaraciones

/* Seccion de reglas lexicas */
%% 
//Regla     {Acciones}

{NUMERO}    {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"num",yyline,yycolumn);
    tokens.add(t);
    return t;
}

"create"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"CREATE",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"CREATE"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"CREATE",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"behaviour"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"BEHAVIOUR",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"BEHAVIOUR"   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"BEHAVIOUR",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"destroy"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"DESTROY",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"DESTROY"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"DESTROY",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"decimal"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"DECIMAL",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"DECIMAL"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"DECIMAL",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"table"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"TABLE",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"TABLE"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"TABLE",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"switch"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"SWITCH",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"SWITCH"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"SWITCH",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"set"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"SET",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"SET"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"SET",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"building"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"BUILDING",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"BUILDING"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"BUILDING",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"text"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"TEXT",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"TEXT"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"TEXT",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"exit"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"EXIT",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"EXIT"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"EXIT",yyline,yycolumn);
    tokens.add(t);
    return t;
}

"REFERENCE"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"REFERENCE",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"reference"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"REFERENCE",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"case"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"CASE",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"CASE"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"CASE",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"if"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"IF",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"IF"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"IF",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"virus"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"VIRUS",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"VIRUS"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"VIRUS",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"time"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"TIME",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"TIME"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"TIME",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"sleep"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"SLEEP",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"SLEEP"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"SLEEP",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"program"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"PROGRAM",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"PROGRAM"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"PROGRAM",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"else"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"ELSE",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"ELSE"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"ELSE",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"cicle"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"CICLE",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"CICLE"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"CICLE",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"define"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"DEFINE",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"DEFINE"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"DEFINE",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"end"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"END",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"END"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"END",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"segment"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"SEGMENT",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"SEGMENT"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"SEGMENT",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"init"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"INIT",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"INIT"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"INIT",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"bigint"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"BIGINT",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"BIGINT"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"BIGINT",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"population"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"POPULATION",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"POPULATION"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"POPULATION",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"route"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"ROUTE",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"ROUTE"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"ROUTE",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"growth"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"GROWTH",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"GROWTH"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"GROWTH",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"start"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"START",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"START"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"START",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"call"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"CALL",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"CALL"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"CALL",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"smallint"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"SMALLINT",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"SMALLINT"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"SMALLINT",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"tinyint"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"TINYINT",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"TINYINT"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"TINYINT",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"resource"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"RESOURCE",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"RESOURCE"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"RESOURCE",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"economy"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"ECONOMY",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"ECONOMY"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"ECONOMY",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"ret"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"RET",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"RET"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"RET",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"simulation"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"SIMULATION",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"SIMULATION"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"SIMULATION",yyline,yycolumn);
    tokens.add(t);
    return t;
}
{IDENTIFICADOR}   {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"id",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"="  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"asignacion",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"++"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"incremento",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"--"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"decremento",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"*="  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"Multiplicacion_sobre_asignacion_previa",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"+="  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"Suma_sobre_asignación_previa",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"-="  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"Resta_sobre_asignacion_previa",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"/="  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"Division_sobre_asignacion_previa",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"+"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"suma",yyline,yycolumn);
    tokens.add(t);
    return t;
}

"-"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"resta",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"*"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"multiplicacion",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"/"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"division",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"&"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"and",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"\|"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"or",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"!"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"not",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"(+)"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"xor",yyline,yycolumn);
    tokens.add(t);
    return t;
}
">"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"Mayor_que",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"<"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"Menor_que",yyline,yycolumn);
    tokens.add(t);
    return t;
}
">="  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"Mayor_igual_que",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"<="  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"Menor_igual_que",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"!="  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"distinto",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"=="  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"igual que",yyline,yycolumn);
    tokens.add(t);
    return t;
}
";"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"terminador_sentencia",yyline,yycolumn);
    tokens.add(t);
    return t;
}
","  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"separador",yyline,yycolumn);
    tokens.add(t);
    return t;
}
":"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"puntos_de_rutina",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"\u0022"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"comillas",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"\u007B"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"llave_apertura",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"\u007D"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"llave_cierre",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"\u0028"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"parentesis_apertura",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"\u0029"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"parentesis_cierre",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"\u005B"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"corchete_apertura",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"\u005D"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"corchete_cierre",yyline,yycolumn);
    tokens.add(t);
    return t;
}

Elementos no validos

"\u0024"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"signo_pesos",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"\u002E"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"punto",yyline,yycolumn);
    tokens.add(t);
    return t;
}

"\u005F"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"guion_bajo",yyline,yycolumn);
    tokens.add(t);
    return t;
}

"\u0023"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"gato",yyline,yycolumn);
    tokens.add(t);
    return t;
}
"\u0025"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"Porciento",yyline,yycolumn);
    tokens.add(t);
    return t;
}

"\u00BF"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"Apertura_interrogacion",yyline,yycolumn);
    tokens.add(t);
    return t;
}

"\u003F"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"Cierre_interrogacion",yyline,yycolumn);
    tokens.add(t);
    return t;
}

"\u0027"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"Apostrofe",yyline,yycolumn);
    tokens.add(t);
    return t;
}


"\u005E"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"Acento circunflejo",yyline,yycolumn);
    tokens.add(t);
    return t;
}

"\u0040"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"Arroba",yyline,yycolumn);
    tokens.add(t);
    return t;
}

"\u0060"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"Acento grave",yyline,yycolumn);
    tokens.add(t);
    return t;
}


"\u007E"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"Virgulilla",yyline,yycolumn);
    tokens.add(t);
    return t;
}
{ESPACIO} {
 	//ignorar
}
{SALTO} {
        //ignorar
}
{TABULADOR} {
        //ignorar
}
{COMENTARIO} {
        //ignorar
}

//Errores
"\u005D"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"corchete_cierre",yyline,yycolumn);
    tokens.add(t);
    //almacenarerror()
    return t;
}
"\u0024"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"signo_pesos",yyline,yycolumn);
    tokens.add(t);
    //almacenarerror()
    return t;
}
"\u005b"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"Apertura_corchete",yyline,yycolumn);
    tokens.add(t);
    //almacenarerror()
    return t;
}
"\u005c"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"diagonal_inversa",yyline,yycolumn);
    tokens.add(t);
    //almacenarerror()
    return t;
}
"\u007e"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"virgulilla",yyline,yycolumn);
    tokens.add(t);
    //almacenarerror()
    return t;
}
"\u00a1"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"apertura_exclamacion",yyline,yycolumn);
    tokens.add(t);
    //almacenarerror()
    return t;
}
"\u00a8"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"dieresis",yyline,yycolumn);
    tokens.add(t);
    //almacenarerror()
    return t;
}
"\u00ac"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"signo_negacion",yyline,yycolumn);
    tokens.add(t);
    //almacenarerror()
    return t;
}
"\u00B0"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"signo_grado",yyline,yycolumn);
    tokens.add(t);
    //almacenarerror()
    return t;
}
"\u00b4"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"acento_agudo",yyline,yycolumn);
    tokens.add(t);
    //almacenarerror()
    return t;
}
"\u00bf"  {
    contador++;
    Yytoken t = new Yytoken(contador,yytext(),"apertura_interrogacion",yyline,yycolumn);
    tokens.add(t);
    //almacenarerror()
    return t;
}
