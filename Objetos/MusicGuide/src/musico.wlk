class Musico {

	var habilidad
	var albumes
	var grupo = ""
	var tipoDeInterprete
	var tipoDeCobrador

	constructor(unGrupo, unaHabilidad, unosAlbumes){
		grupo = unGrupo
		habilidad = unaHabilidad
		albumes = unosAlbumes
	}

	method estaEnGrupo() {
		return grupo != ""
	}
	
	method actuaSolo(presentacion) {
		return presentacion.actuaUnoSolo() &&
			presentacion.actua(self)
	}
	
	method esMinimalista() {
		return albumes.all({album => album.esAlbumMinimalista()})
	}
	
	method cancionesQueNombran(palabra) {
		return albumes.flatMap({album => album.cancionesQueDicen(palabra)})
	}

	method duracionDeObra() {
		return albumes.sum({album => album.duracion()})
	}

	method dejarGrupo() {
		grupo = ""
	}

	method laPego() {
		albumes.all({album => album.tieneBuenaVenta()})
	}

	method compone(unAlbum){
		albumes.add(unAlbum)
	}

	method interpretaBasico(cancion) {
		return habilidad > 60 or albumes.any({album => album.estaEnElAlbumLaCancion(cancion)})
	}

	method interpretaBien(cancion){
		return self.interpretaBasico(cancion) and tipoDeInterprete.interpretaBien(cancion)
	}

	method cobra(presentacion) {
		return tipoDeCobrador.cobra(presentacion, self)
	}

	method cualesTocaBien(unasCanciones){
		return unasCanciones.filter({cancion=> self.interpretaBien(cancion)})
	}
	method noTieneCanciones(){
		return albumes.isEmpty()
	}
	method discosHechos(){
	return albumes
	}
}

class Palabrero inherits Interprete {

	var palabra

	constructor(unaPalabra) {
		palabra = unaPalabra
	}

	override method interpretaBien(cancion) {
		return cancion.dice(palabra)
	}
}

class Larguero inherits Interprete {

	var segundos

	constructor(unosSegundos) {
		segundos = unosSegundos
	}

	override method interpretaBien(cancion) {
		return cancion.duracion() > segundos
	}
}

object imparero inherits Interprete {
	override method interpretaBien(cancion) {
		return cancion.duracion().odd()
	}
}

class Interprete {
	method interpretaBien(cancion)
}

class CobraPorCompanieros inherits Cobrador {

	var precioBase

	constructor(unPrecioBase) {
		precioBase = unPrecioBase
	}

	override method cobra(presentacion, cantante) {
		if(cantante.actuaSolo(presentacion)) {
			return precioBase
		} else {
			return precioBase / 2
		}
	}
}

class CobraPorCapacidad inherits Cobrador {
	var precioBase
	var capacidad

	constructor(unPrecioBase, unaCapacidad) {
		precioBase = unPrecioBase
		capacidad = unaCapacidad
	}

	override method cobra(presentacion, cantante) {
		if(presentacion.capacidad() > capacidad) {
			return precioBase
		} else {
			return precioBase - 100
		}
	}
}

class CobraPorInflacion inherits Cobrador {
	var precioBase
	var fecha
	var porcentajeAdicional

	constructor(unPrecioBase, unaFecha, unPorcentajeAdicional) {
		precioBase = unPrecioBase
		fecha = unaFecha
		porcentajeAdicional = unPorcentajeAdicional
	}

	override method cobra(presentacion, cantante) {
		if(!presentacion.sePasaDe(fecha)) {
			return precioBase
		} else {
			return precioBase + precioBase * porcentajeAdicional
		}
	}
}

class Cobrador {
	method cobra(presentacion, cantante)
}


class MusicoDeGrupo inherits Musico {

	var aumento

	constructor(unGrupo, unaHabilidad, unosAlbumes, unAumento) =
		super(unGrupo, unaHabilidad, unosAlbumes) {
        aumento = unAumento
    }

	method habilidad() {
		if(self.estaEnGrupo()) {
	    	return habilidad + aumento
	    } else { 
	    	return habilidad
	  	}
  	}

}

class VocalistaPopular inherits Musico {

	var palabra

	constructor(unGrupo, unaHabilidad, unosAlbumes, unaPalabra) =
		super(unGrupo, unaHabilidad, unosAlbumes) {
			palabra = unaPalabra
		}

	method habilidad() {
	    if(self.estaEnGrupo()) {
	    	return habilidad - 20
	    } else { 
	    	return habilidad
	  	}
	}
}
