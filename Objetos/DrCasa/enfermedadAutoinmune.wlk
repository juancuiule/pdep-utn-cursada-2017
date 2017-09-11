class EnfermedadAutoinmune {

  var nombre
  var celulasAmenazadas

  constructor (unNombre, cantidadDeCelulasAmenazadas) {
    nombre = unNombre
    celulasAmenazadas = cantidadDeCelulasAmenazadas
  }

  method efectoSobrePersona(persona) {
    persona.destruirCelulas(celulasAmenazadas)
  }

  method esAgresiva(persona) {
    return persona.efectosDeLaEnfermedad() > 30
  }

  method celulasAmenazadas() {
    return celulasAmenazadas
  }

}
