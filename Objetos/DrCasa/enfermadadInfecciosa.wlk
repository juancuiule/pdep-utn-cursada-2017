class EnfermadadInfecciosa {

  var nombre
  var celulasAmenazadas

  constructor (unNombre, cantidadDeCelulasAmenazadas) {
    nombre = unNombre
    celulasAmenazadas = cantidadDeCelulasAmenazadas
  }

  method efectoSobrePersona(persona) {
    persona.aumentarTemperatura(celulasAmenazadas / 1000)
  }

  method reproducirse() {
    celulasAmenazadas *= 2
  }

  method esAgresiva(persona) {
    return celulasAmenazadas > persona.celulasDelCuerpo() * 0.1
  }

  method celulasAmenazadas() {
    return celulasAmenazadas
  }

}
