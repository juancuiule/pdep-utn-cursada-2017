class Jefe {

  var temperatura
  var celulasDelCuerpo
  var enfermedadesContraidas = #{}
  var subordinados = #{}

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
  }
  
  method tomarMedicamento(dosis) {
  	enfermedadesContraidas.forEach({enfermedad => enfermedad.atenuarse(dosis * 15)})
  }
  
  method atenderA(persona, dosis) {
  	subordinados.random().atenderA(persona, dosis)
  }

  method agregarSubordinado(unSubordinado) {
  	subordinados.add(unSubordinado)
  }

  method temperatura() {
    return temperatura
  }

  method celulasDelCuerpo() {
    return celulasDelCuerpo
  }
}