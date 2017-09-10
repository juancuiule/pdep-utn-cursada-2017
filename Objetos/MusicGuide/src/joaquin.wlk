object joaquin {
  var grupo = ""
  var habilidadBase = 20

  method estaEnGrupo() {
    return grupo != ""
  }

  method habilidad() {
    if(self.estaEnGrupo()) {
    	return habilidadBase + 5
    } else { 
    	return habilidadBase
  	}
  }

  method interpretaBien(cancion) {
    return cancion.duracion() > 300
  }

  method cobra(presentacion) {
    if(self.estaEnGrupo()) {
      return 50
    } else { 
      return 100
    }
  }
  
  method grupo(nuevoGrupo) {
  	grupo = nuevoGrupo
  }

  method dejarGrupo() {
	grupo = ""
  }
}