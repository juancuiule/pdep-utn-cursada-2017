
object luisAlberto {
	var guitarra
	var habilidadBase
	var grupo = ""
	
	method tocaConGuitarra(unaGuitarra){
		guitarra = unaGuitarra
	}
	method trataMalAGuitarra(){
		guitarra.estaRota(true)
	}
	method habilidad() {
    	habilidadBase = 100.min(8*guitarra.valor())
  	}
  	method interpretaBien(cancion) {
   		return true
  	}
  
 	method cobra(lugar, dia,mes,anio) {
   		if(self.sePasaDeSeptiembre(dia,mes,anio)){
   			return 1200
   		}else{
   			return 1000
   		}
  }
	method sePasaDeSeptiembre(dia,mes,anio){
 		return mes <= 09 and anio <= 2017
		}
	method grupo(nuevoGrupo) {
  		grupo = nuevoGrupo
  }
}

object fender{
	var estaRota = false
	
	method valor(){
		return 10
	}
	method estaRota(){
		return estaRota
	}
	method estaRota(trueOfalse){
		estaRota = trueOfalse

	}
}

object gibson{
	var estaRota = false
	
	method valor(){
		if(self.estaRota()){
			return 5
		}else{
			return 15
		}
	}
	method estaRota(){
		return estaRota
	}
	method estaRota(trueOfalse){
		estaRota = trueOfalse
	}
}
