class Presentacion {
	var lugar
	var fecha
	var artistas = #{}

	constructor (unLugar, unaFecha) {
		lugar = unLugar
		fecha = unaFecha
	}

	method capacidad(unaFecha) {
		return lugar.capacidad(unaFecha)
	}

	method fecha() {
		return fecha
	}
	
	method fecha(unaFecha){
		fecha = unaFecha
	}

	method lugar() {
		return lugar
	}

	method artistas() {
		return artistas
	}

	method sePasaDe(unaFecha) {
		return fecha >= unaFecha
	}

	method sePasaDeSeptiembre() {
		return self.sePasaDe(new Date(1,9,2017))
	}

	method esConcurrida() {
		return lugar.capacidad(fecha) > 5000
	}

	method capacidad() {
		return lugar.capacidad(fecha)
	}
	
	method actua(unArtista) {
		return artistas.contains(unArtista)
	}

	method actuaUnoSolo() {
		return artistas.size() == 1
	}

	method costo() {
		return artistas.sum{integrante => integrante.cobra(self)}
	}

	method artistas(unosArtistas) {
		artistas = unosArtistas
	}	
}
