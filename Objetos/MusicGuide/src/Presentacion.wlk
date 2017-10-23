class Presentacion {
	var lugar
	var fecha
	var artistas = #{}
	var bandas = #{}

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
	
	method agregarBanda(unaBanda) {
		bandas.add(unaBanda)
	}

	method lugar() {
		return lugar
	}

	method artistas() {
		return artistas + bandas.flatMap({banda => banda.integrantes()})
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
		return self.artistas().contains(unArtista)
	}

	method actuaUnoSolo() {
		return self.artistas().size() == 1
	}

	method costo() {
		return artistas.sum{integrante => integrante.cobra(self)} + bandas.sum{banda => banda.cuantoCobran(self)}
	}

	method artistas(unosArtistas) {
		artistas = unosArtistas
	}
	method magia(){
		return artistas.sum{integrante => integrante.habilidad()} + bandas.sum{banda => banda.habilidad()}
	}

}
