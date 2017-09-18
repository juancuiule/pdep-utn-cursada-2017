class EnfermedadAutoinmune {

  var celulasAmenazadas
  var diasEnElCuerpo = 0

  constructor (cantidadDeCelulasAmenazadas) {
    celulasAmenazadas = cantidadDeCelulasAmenazadas
  }

  method efectoSobrePersona(persona) {
  	diasEnElCuerpo++
    persona.destruirCelulas(celulasAmenazadas)
  }

  method esAgresiva(persona) {
    return diasEnElCuerpo > 30
  }

  method atenuarse(celulas) {
    celulasAmenazadas = 0.max(celulasAmenazadas - celulas)
  }

  method celulasAmenazadas() {
    return celulasAmenazadas
  }

}
