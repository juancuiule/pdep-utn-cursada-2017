alumno(varon(artiom, [10, 6, 9])).
alumno(mujer(paula, 27, 6)).
alumno(mujer(dalila, 25, 7)).
alumno(varon(manuel, [4, 2, 2, 2])).
alumno(varon(pedro, [6, 8, 9])).

nombre(Alumno, Nombre) :-
  alumno(Alumno),
  nombreDe(Alumno, Nombre).

nombreDe(varon(Nombre,_), Nombre).
nombreDe(mujer(Nombre, _, _), Nombre).

seSaco(Nombre, Nota) :-
  nombre(varon(Nombre, Notas), Nombre),
  member(Nota, Notas).

esSacrificado(Alumno) :-
  alumno(Alumno), seSacrifica(Alumno).

seSacrifica(varon(_, Notas)) :-
  promedio(Notas, Promedio),
  Promedio > 7.

seSacrifica(mujer(_, Edad, _)) :- Edad > 40.
seSacrifica(mujer(_, , _, Cuadras)) :- Cuadras > 25.

promedio(Notas, Promedio) :-
  sum_list(Notas, SumatoriaNotas),
  length(Notas, CantidadNotas),
  Promedio is SumatoriaNotas / CantidadNotas.

juega(marcos, futbol).
juega(ximena, futbol).
juega(carola, futbol).
juega(carola, tenis).
campeon(marcos, futbol).
campeon(carola, futbol).
campeon(carola, tenis).

crack(Persona):- 
  juega(Persona, _),
  forall(juega(Persona, Deporte), campeon(Persona, Deporte)).

crack2(Persona):- 
  not((juega(Persona, Deporte), not(campeon(Persona, Deporte)))).
