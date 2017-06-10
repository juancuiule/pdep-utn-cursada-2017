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