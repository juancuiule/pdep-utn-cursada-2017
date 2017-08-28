habilidad(superman, barderdo([correForestCorre, soyGrosoYQue, rayitosVisuales, alientoAquafresh, vuelaVuela, miraCorpinios])).
habilidad(flash, velocista(300)).
habilidad(batman, porArtefacto([artefacto(batarang,20), artefacto(batarangExplosivo, 50)])).
habilidad(laMujerMaravilla, barderdo([superFueza, ligerona, brazaletesAntiBalas, lazoDeVerdad])).
habilidad(linternaVerde, porArtefacto([artefacto(anillo, 600)])).
habilidad(ironMan, porArtefacto([artefacto(casco, 50), artefacto(armadura, 400)])).
habilidad(spiderman, bichoDeLaboratorio).
habilidad(hulk, bichoDeLaboratorio).
habilidad(capitanAmerica, bichoDeLaboratorio).
habilidad(punisher, barderdo([seLaBanca])).

equipo(superman, ligaJusticia).
equipo(batman, ligaJusticia).
equipo(flash, ligaJusticia).
equipo(linternaVerde, ligaJusticia).
equipo(laMujerMaravilla, ligaJusticia).
equipo(ironMan, losVengadores).
equipo(spiderman, losVengadores).
equipo(hulk, losVengadores).
equipo(capitanAmerica, losVengadores).

potencia(Nombre, Potencia) :-
	habilidad(Nombre, Habilidad),
	potenciaHabilidad(Habilidad, Potencia).

potenciaHabilidad(velocista(VelocidadMaxima), VelocidadMaxima).

potenciaHabilidad(bichoDeLaboratorio, 200).

potenciaHabilidad(barderdo(Poderes), Potencia) :-
	length(Poderes, CantidadDePoderes),
	Potencia is CantidadDePoderes * 20.

potenciaHabilidad(porArtefacto(Artefactos), Potencia) :-
	findall(Valor, member(artefacto(_, Valor), Artefactos), Valores),
	sum_list(Valores, Potencia).

% trabajaSolo/1
trabajaSolo(spiderman).

trabajaSolo(Heroe) :-
	habilidad(Heroe, _),
	not(equipo(Heroe, _)).

%% Existencial
%% ?- trabajaSolo(H).
%% H = spiderman ;
%% H = punisher.

%% Individual
%% ?- trabajaSolo(batman).
%% false.

% potenciaMedia/2
potenciaMedia(Equipo, Promedio) :-
	equipo(_, Equipo),
	findall(Potencia, (equipo(Nombre, Equipo),	potencia(Nombre, Potencia)), ListaDePotencias),
	sum_list(ListaDePotencias, SumaDePotencias),
	length(ListaDePotencias, CantidadDePotencias),
	Promedio is SumaDePotencias / CantidadDePotencias.

% estaOrdenado/1

% integranteMasPoderoso/2
integranteMasPoderoso(Equipo, Integrante) :-
	equipo(Integrante, Equipo),
	forall(equipo(Nombre, Equipo), leGanaA(Integrante, Nombre)).

leGanaA(Local, Visitante) :-
	potencia(Local, PotenciaDelLocal),
	potencia(Visitante, PotenciaDelVisitante),
	PotenciaDelLocal >= PotenciaDelVisitante.

% enfrentamientoComplicado/2
enfrentamientoComplicado(EquipoLocal, EquipoVisitante) :-
	integranteMasPoderoso(EquipoLocal, IntegranteLocal),
	equipo(IntegranteVisitante, EquipoVisitante),
	leGanaA(IntegranteLocal, IntegranteVisitante),
	not(leGanaAMasDeUno(IntegranteLocal, EquipoVisitante)).

leGanaAMasDeUno(Retador, Equipo) :-
	equipo(Retador, OtroEquipo),
	findall(Integrante, (equipo(Integrante, Equipo), leGanaA(Retador, Integrante)), Derrotados),
	length(Derrotados, ACuantosLesGana),
	ACuantosLesGana > 1.
	