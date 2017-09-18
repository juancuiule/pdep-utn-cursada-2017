class EnfermedadInfecciosa {

  var celulasAmenazadas
  var diasEnElCuerpo = 0

  constructor (cantidadDeCelulasAmenazadas) {
    celulasAmenazadas = cantidadDeCelulasAmenazadas
  }

  method efectoSobrePersona(persona) {
  	diasEnElCuerpo++
    persona.aumentarTemperatura(celulasAmenazadas / 1000)
  }
  
  method reproducirse() {
    celulasAmenazadas *= 2
  }

  method esAgresiva(persona) {
    return celulasAmenazadas > persona.celulasDelCuerpo() * 0.1
  }
  
  method atenuarse(celulas) {
    celulasAmenazadas = 0.max(celulasAmenazadas - celulas)
  }

  method celulasAmenazadas() {
    return celulasAmenazadas
  }

}
