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

  method actuaSolo(presentacion) {
	return presentacion.actuaUnoSolo() &&
		presentacion.actua(self)
  }

  method cobra(presentacion) {
    if(self.actuaSolo(presentacion)) {
      return 100
    } else {
      return 50
    }
  }
  
  method grupo(nuevoGrupo) {
  	grupo = nuevoGrupo
  }

  method dejarGrupo() {
	grupo = ""
  }
}
