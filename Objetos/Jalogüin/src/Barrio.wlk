class Barrio {

	var habitantes
	
	constructor(unosHabitantes) {
		habitantes = unosHabitantes
	}

	method niniosConMasCaramelos() {
		habitantes.sort({habitante => habitante.caramelos()})
	}
	
	method niniosConMasDeDiez() {
		return habitantes.filter({habitante => habitante.tieneMasDe(10)})
	}
	
	method elementosUsados() {
		return self.niniosConMasDeDiez().flatMap({ninio => ninio.elementos()}).asSet()
	}
	
}