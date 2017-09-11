class Persona {

  var nombre
  var temperatura
  var celulasDelCuerpo
  var enfermedadesContraidas = #{}

  constructor (unNombre, unaTemperatura, cantidadDeCelulas, enfermedades) {
    nombre = unNombre
    temperatura = unaTemperatura
    celulasDelCuerpo = cantidadDeCelulas
    enfermedadesContraidas = enfermedades
  }

  method destruirCelulas(cantidad) {
    celulasDelCuerpo -= cantidad
  } 

  method aumentarTemperatura(grados) {
    temperatura = 45.min(temperatura + grados)
  }

  method temperatura() {
    return temperatura
  }

  method celulasDelCuerpo() {
    return celulasDelCuerpo
  }

  method contraerEnrermedad(unaEnfermedad) {
    enfermedades.add(unaEnfermedad)
  }

  method pasarDia() {
    enfermedadesContraidas.forEach({enfermedad => enfermedad.efectoSobrePersona(self)})
  }

  method enfermedadMasDura() {
    enfermedadesContraidas.max({enfermedad => enfermedad.celulasAmenazadas()})
  }

}