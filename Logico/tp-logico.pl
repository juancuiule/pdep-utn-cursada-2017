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