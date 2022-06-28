/*Conversiones de tipo de dato*/
	/*Conversión de numérico a caracter*/
	CARATER = PUT(VAR_NUMERICA,3.);
	/*Conversión de caracter a numérico*/
	NUMERICO = INPUT(VAR_CARACTER,3.);
/*Declaración de arreglos*/
ARRAY CODIGO_[10] $100 CODIGO_1 - CODIGO_10; /*alfanumérico*/
ARRAY LONGITUD_[10] LONGITUD_1 - LONGITUD_10;/*numérico*/
/*Resolver macro asignada a valores numéricos*/
%LET SERIAL = 5;
%SYSFUNC(COMPRESS(&SERIAL.));
/*Resolver valores como texto macro alojados con un select into*/
	/*Método 1*/
	%LET T_AUX = %SYSFUNC(STRIP(%SYSFUNC(CATX(,&,%SYSFUNC(COMPRESS(&C.)),%SYSFUNC(COMPRESS(&T.)),.))));
	CODIGO = "&T_AUX.";
	/*Método 2*/
	CODIGO = "%SYSFUNC(STRIP(%SYSFUNC(CATX(,&,%SYSFUNC(COMPRESS(&C.)),%SYSFUNC(COMPRESS(&T.)),.))))";
/*Concatenar variables de una lista*/
COD_A = CATX('||',AB_1-AB_10);
/*Obtención de fecha al día formateada a 8 posiciones*/
%LET FECHA_HOY = %SYSFUNC(TODAY(),YYMMDDN8.);
/*Mensajes de error en el log sin parar el proceso en curso*/
put 'ERR' 'OR: aquí va tu mensaje dentro de un paso data, puede ser un data _null_ o un output normal';
--Se aconseja manejar mensajes de error en rutinas macro para manejo de excepciones en programas que consumen insumos de otros procesos o tienen dependencia sobre pasos anteriores del proceso que enviará el mensaje.
/*Proc Export a excel estandar*/
PROC EXPORT DATA=Libreria.Tabla_entrada (Opciones)
	OUTFILE="Ruta/Archivo.xls" DBMS=XLS REPLACE;
	SHEET=Hoja_del_libro;
QUIT;