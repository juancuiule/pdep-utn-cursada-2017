
class Presentacion {
	var lugar
	var fecha
	var capacidad
	constructor (unLugar,unaFecha) {
		lugar = unLugar
		fecha = unaFecha
		
		if(self.esLunaPark()){
			capacidad = 9290
		}else{ if(self.esSabado(unaFecha)){
			capacidad = 700
		}else {capacidad = 400}
			
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