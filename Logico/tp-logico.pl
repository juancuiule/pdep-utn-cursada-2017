% pareja(Persona, Persona)
pareja(marsellus, mia).
pareja(pumkin, honeyBunny).
pareja(bernardo, bianca).
pareja(bernardo, charo).

% trabajaPara(Empleador, Empleado).
trabajaPara(marsellus, vincent).
trabajaPara(marsellus, jules).
trabajaPara(marsellus, winston).
trabajaPara(Empleador, bernardo) :-
	trabajaPara(marsellus, Empleador),
	Empleador \= jules.
trabajaPara(Empleador, george) :-
	saleCon(Empleador, bernardo).

% saleCon/2
% Relaciona dos personas que están saliendo porque son pareja
saleCon(Quien, Cual) :- pareja(Quien, Cual).
saleCon(Quien, Cual) :- pareja(Cual, Quien).
% No es recursiva

%esFiel/1
saleConMasDeUno(Persona) :-
	saleCon(Persona, Alguien),
	saleCon(Persona, Otro),
	Alguien \= Otro.

esFiel(Persona) :-
	saleCon(Persona, _),
 	not(saleConMasDeUno(Persona)).

% acataOrden/2
% Si es recursiva

% Caso base
acataOrden(Empleador, Empleado) :- 
	trabajaPara(Empleador, Empleado).

% Caso recursivo
acataOrden(Empleador, Empleado) :-
	trabajaPara(Empleador, Otro),
	acataOrden(Otro, Empleado).

% personaje(Nombre, Ocupacion)
personaje(pumkin,     ladron([estacionesDeServicio, licorerias])).
personaje(honeyBunny, ladron([licorerias, estacionesDeServicio])).
personaje(vincent,    mafioso(maton)).
personaje(jules,      mafioso(maton)).
personaje(marsellus,  mafioso(capo)).
personaje(winston,    mafioso(resuelveProblemas)).
personaje(mia,        actriz([foxForceFive])).
personaje(butch,      boxeador).
personaje(bernardo,   mafioso(cerebro)).
personaje(bianca,     actriz([elPadrino1])).
personaje(elVendedor, vender([humo, iphone])).
personaje(jimmie,     vender([auto])).

% encargo(Solicitante, Encargado, Tarea). 
% las tareas pueden ser cuidar(Protegido), ayudar(Ayudado), buscar(Buscado, Lugar)
encargo(marsellus, vincent,   cuidar(mia)).
encargo(vincent,  elVendedor, cuidar(mia)).
encargo(marsellus, winston, ayudar(jules)).
encargo(marsellus, winston, ayudar(vincent)).
encargo(marsellus, vincent, buscar(butch, losAngeles)).
encargo(bernardo, vincent, buscar(jules, fuerteApache)).
encargo(bernardo, winston, buscar(jules, sanMartin)).
encargo(bernardo, winston, buscar(jules, lugano)).

amigo(vincent, jules).
amigo(jules, jimmie).
amigo(vincent, elVendedor).

%esPeligroso/1
esPeligroso(Persona):-
	personaje(Persona,mafioso(maton)).

esPeligroso(Persona):-
	personaje(Persona,ladron([_,licorerias])).
esPeligroso(Persona):-
	personaje(Persona,ladron([licorerias,_])).

esPeligroso(Persona):-
	trabajaPara(Jefe,Persona),
	esPeligroso(Jefe).

%sanCayetano/1

sanCayetano(Persona):-
	tieneAAlguienCerca(Persona,_),
	forall(tieneAAlguienCerca(Persona,Alguien),leDaEncargo(Persona,Alguien)).

sonAmigos(Persona1,Persona2):-
	amigo(Persona1,Persona2).

sonAmigos(Persona1,Persona2):-
	amigo(Persona2,Persona1).

tieneAAlguienCerca(Persona1,Persona2):-
	sonAmigos(Persona1,Persona2).

tieneAAlguienCerca(Persona1,Persona2):-
	trabajaPara(Persona2,Persona1).

leDaEncargo(Persona1,Persona2):-
	encargo(Persona1,Persona2,cuidar(_)).
leDaEncargo(Persona1,Persona2):-
	encargo(Persona1,Persona2,ayudar(_)).
leDaEncargo(Persona1,Persona2):-
	encargo(Persona1,Persona2,buscar(_,_)).	
