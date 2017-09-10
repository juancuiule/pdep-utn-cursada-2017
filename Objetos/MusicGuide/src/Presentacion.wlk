import luisAlberto.*
import joaquin.*
import lucia.*
class Presentacion {
	var lugar
	var fecha
	var capacidad
	var gentePresente
	constructor (unLugar,unaFecha) {
		lugar = unLugar
		fecha = unaFecha
		
		if(self.esLunaPark()){
			capacidad = 9290
			gentePresente = #{luisAlberto,joaquin,lucia}
		}else{ if(self.esSabado(unaFecha)){
			capacidad = 700
			gentePresente = #{luisAlberto,joaquin,lucia}
		}else {	capacidad = 400
				gentePresente = #{luisAlberto,joaquin,lucia}	
		}
			
		}
	}
	method fecha(){
		return fecha
	}
	method sePasaDeSeptiembre(){
 		return fecha > new Date(1,9,2017)
	}
	method esConcurrida(){
		return capacidad > 5000
	}
	method esLunaPark(){
		return lugar == "Luna Park"
	}
	method esSabado(unaFecha){
		return unaFecha.dayOfWeek() == 6
	}
}