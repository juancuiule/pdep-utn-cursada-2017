object lucia {
  var grupo = "Pimpinela"
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
    return cancion.letra().contains("familia")
  }

  method cobra(lugar, fecha) {
    if(lugar.esConcurrido()) {
    	return 500	
    } else {
    	return 400
    }
  }
  
  method grupo(nuevoGrupo) {
  	grupo = nuevoGrupo
  }
}
