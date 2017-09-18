class Medico {

  var temperatura
  var celulasDelCuerpo
  var enfermedadesContraidas = #{}

  constructor (unaTemperatura, cantidadDeCelulas, enfermedades) {
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
  
  method disminuirTemperatura(grados) {
  	temperatura = 0.max(temperatura - grados)
  }

  method contraerEnfermedad(unaEnfermedad) {
    enfermedadesContraidas.add(unaEnfermedad)
    // self.atenderA(self)
  }
  
  method tomarMedicamento(dosis) {
  	enfermedadesContraidas.forEach({enfermedad => enfermedad.atenuarse(dosis * 15)})
  }
  
  method atenderA(persona, dosis) {
  	persona.tomarMedicamento(dosis)
  }

  method temperatura() {
    return temperatura
  }

  method celulasDelCuerpo() {
    return celulasDelCuerpo
  }
}