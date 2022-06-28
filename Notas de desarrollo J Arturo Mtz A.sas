/*Conversiones de tipo de dato*/
	/*Conversi�n de num�rico a caracter*/
	CARATER = PUT(VAR_NUMERICA,3.);
	/*Conversi�n de caracter a num�rico*/
	NUMERICO = INPUT(VAR_CARACTER,3.);
/*Declaraci�n de arreglos*/
ARRAY CODIGO_[10] $100 CODIGO_1 - CODIGO_10; /*alfanum�rico*/
ARRAY LONGITUD_[10] LONGITUD_1 - LONGITUD_10;/*num�rico*/
/*Resolver macro asignada a valores num�ricos*/
%LET SERIAL = 5;
%SYSFUNC(COMPRESS(&SERIAL.));
/*Resolver valores como texto macro alojados con un select into*/
	/*M�todo 1*/
	%LET T_AUX = %SYSFUNC(STRIP(%SYSFUNC(CATX(,&,%SYSFUNC(COMPRESS(&C.)),%SYSFUNC(COMPRESS(&T.)),.))));
	CODIGO = "&T_AUX.";
	/*M�todo 2*/
	CODIGO = "%SYSFUNC(STRIP(%SYSFUNC(CATX(,&,%SYSFUNC(COMPRESS(&C.)),%SYSFUNC(COMPRESS(&T.)),.))))";
/*Concatenar variables de una lista*/
COD_A = CATX('||',AB_1-AB_10);
/*Obtenci�n de fecha al d�a formateada a 8 posiciones*/
%LET FECHA_HOY = %SYSFUNC(TODAY(),YYMMDDN8.);
/*Mensajes de error en el log sin parar el proceso en curso*/
put 'ERR' 'OR: aqu� va tu mensaje dentro de un paso data, puede ser un data _null_ o un output normal';
--Se aconseja manejar mensajes de error en rutinas macro para manejo de excepciones en programas que consumen insumos de otros procesos o tienen dependencia sobre pasos anteriores del proceso que enviar� el mensaje.
/*Proc Export a excel estandar*/
PROC EXPORT DATA=Libreria.Tabla_entrada (Opciones)
	OUTFILE="Ruta/Archivo.xls" DBMS=XLS REPLACE;
	SHEET=Hoja_del_libro;
QUIT;