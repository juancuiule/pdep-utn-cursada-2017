
object luisAlberto {
	var guitarra = fender
	var habilidadBase
	
	method tocaConGuitarra(unaGuitarra){
		guitarra = unaGuitarra
	}
	method trataMalAGuitarra(){
		guitarra.estaRota(true)
	}
	method habilidad() {
    	habilidadBase = 8* guitarra.valor()
  	}//FALTA QUE SEA MENOR QUE 100
  	method interpretaBien(cancion) {
   		return true
  	}
  
 	method cobra(lugar, fecha) {
   		if(self.sePasaDeSeptiembre(fecha)){
   			return 1200
   		}else{
   			return 1000
   		}
  }
//FALTA METHOD sePasaDeSeptiembre(fecha)

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