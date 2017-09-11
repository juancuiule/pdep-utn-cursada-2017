import joaquin.*
import lucia.*
import luisAlberto.*

object fixturePresentaciones {
  method agregarTodos(presentacion) {
    presentacion.agregarArtista(joaquin)
    presentacion.agregarArtista(lucia)
    presentacion.agregarArtista(luisAlberto)
  }
}