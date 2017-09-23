class Musico {

	var habilidad
	var albumes
	var grupo = ""

	constructor(unGrupo, unaHabilidad, unosAlbumes){
		grupo = unGrupo
		habilidad = unaHabilidad
		albumes = unosAlbumes
	}

	method estaEnGrupo() {
		return grupo != ""
	}
	
	method esMinimalista() {
		albumes.all({album => album.esAlbumMinimalista()})
	}
	
	method cancionesQueNombran(palabra) {
		return albumes.flatMap({album => album.cancionesQueDicen(palabra)})
	}
	
	method duracionDeObra() {
		return albumes.fold(0, {
			total, album => return total + album.duracion()
		})
	}
	
	method laPego() {
		albumes.all({album => album.tieneBuenaVenta()})
	}
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
	
	method interpretaBien(cancion) {
		return cancion.dice(palabra)
	}
	
}