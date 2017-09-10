object lucia {
  var grupo = ""
  var habilidadBase = 70

  method estaEnGrupo() {
    return grupo != ""
  }

  method habilidad() {
    if(self.estaEnGrupo()) {
    	return habilidadBase - 20
    } else { 
    	return habilidadBase
  	}
  }

  method interpretaBien(cancion) {
    return cancion.dice("familia")
  }

  method cobra(presentacion) {
    if(presentacion.lugar().esConcurrida(presentacion.fecha())) {
    	return 500	
    } else {
    	return 400
    }
  }
  
  method grupo(nuevoGrupo) {
  	grupo = nuevoGrupo
  }

  method dejarGrupo() {
	grupo = ""
  }
}
