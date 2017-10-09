import cancion.*
import lunaPark.*
import Presentacion.*
import Condicion.*

object pdpalooza inherits Presentacion(lunaPark, new Date(15, 12, 2017)) {

	const alicia = new Cancion("Canción de Alicia en el país", 510, "Quién sabe Alicia, este país no estuvo hecho porque sí. Te vas a ir, vas a salir pero te quedas, ¿dónde más vas a ir? Y es que aquí, sabes el trabalenguas, trabalenguas, el asesino te asesina, y es mucho para ti. Se acabó ese juego que te hacía feliz.")
	var condiciones = [
		new Condicion({artista => artista.habilidad() >= 70}, "No se puede aceptar a este musico porque tiene menos de 70 de habilidad"),
		new Condicion({artista => not artista.noTieneCanciones()}, "No se puede aceptar a este musico porque no compuso canciones"),
		new Condicion({artista => artista.interpretaBien(alicia)}, "No se puede aceptar a este musico porque no interpreta bien 'alicia'")
	]
	
	method agregarCondicion(condicion) {
		condiciones.add(condicion)
	}
	
	method cumpleCondiciones(unArtista) {
		condiciones.forEach({condicion => 
			if(!condicion.evaluar(unArtista)) {
				throw new Exception(condicion.mensaje())
			}
		})
	}
	
	method agregarArtista(unArtista) {
		self.cumpleCondiciones(unArtista)
		artistas.add(unArtista)
	}
	
}