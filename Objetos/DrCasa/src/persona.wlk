import enfermedadAutoinmune.*
import enfermedadInfecciosa.*

class Persona {

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

  method temperatura() {
    return temperatura
  }

  method celulasDelCuerpo() {
    return celulasDelCuerpo
  }

  method contraerEnfermedad(unaEnfermedad) {
    enfermedadesContraidas.add(unaEnfermedad)
  }

  method pasarDia() {
    enfermedadesContraidas.forEach({enfermedad => enfermedad.efectoSobrePersona(self)})
  }
  
  method enfermedadesAgresivas() {
  	return enfermedadesContraidas.filter({enfermedad => enfermedad.esAgresiva(self)})
  }
  
  method celulasAfectadasPorEnfermedadesAgresivas() {
  	return self.enfermedadesAgresivas().sum({enfermedad => enfermedad.celulasAmenazadas()})
  }

  method enfermedadMasDura() {
    return enfermedadesContraidas.max({enfermedad => enfermedad.celulasAmenazadas()})
  }
  
  method tomarMedicamento(dosis) {
  	enfermedadesContraidas.forEach({enfermedad => enfermedad.atenuarse(dosis * 15)})
  }
  
  method enfermedadesContraidas() {
  	return enfermedadesContraidas
  }

}