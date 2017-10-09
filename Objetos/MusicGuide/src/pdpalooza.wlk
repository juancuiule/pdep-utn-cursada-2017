import cancion.*
import lunaPark.*
import Presentacion.*

class UserException inherits Exception { }

object pdpalooza inherits Presentacion(lunaPark, new Date(15, 12, 2017)) {

	const alicia = new Cancion("Canción de Alicia en el país", 510, "Quién sabe Alicia, este país no estuvo hecho porque sí. Te vas a ir, vas a salir pero te quedas, ¿dónde más vas a ir? Y es que aquí, sabes el trabalenguas, trabalenguas, el asesino te asesina, y es mucho para ti. Se acabó ese juego que te hacía feliz.")

	method agregarArtista(unArtista) {
		if(unArtista.habilidad() < 70) {
			throw new UserException("No se puede aceptar a este musico porque tiene menos de 70 de habilidad")
		}
		if(unArtista.noTieneCanciones()) {
			throw new UserException("No se puede aceptar a este musico porque no compuso canciones")
		}
		if(not(unArtista.interpretaBien(alicia))) {
			throw new UserException("No se puede aceptar a este musico porque no interpreta bien 'alicia'")
		}
		artistas.add(unArtista)
	}
	
}