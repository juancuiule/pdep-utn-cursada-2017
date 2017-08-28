object mainRoom {
	var patovaDeTurno
	var personas = #{}

	method nombre() {
		return "mainRoom"
	}
	
	method bailar(persona) {
		persona.modificarEnergia(-40)
		persona.modificarDiversion(30)
	}

	method entrar(persona) {
		if (patovaDeTurno.dejaPasar(persona)) {
			personas.add(persona)	
		}
	}

	method cuantosBailan() {
		return personas.size()
	}

	method personas() {
		return personas
	}

	method patovaDeTurno(nuevoPatova) {
		patovaDeTurno = nuevoPatova
	}
}

object panoramaBar {
	var patovaDeTurno
	var dj
	var personas = #{}

	method nombre() {
		return "panoramaBar"
	}

	method bailar(persona) {
		dj.hacerBailar(persona)
	}

	method entrar(persona) {
		if (patovaDeTurno.dejaPasar(persona)) {
			personas.add(persona)	
		}
	}

	method cuantosBailan() {
		return personas.size()
	}

	method personas() {
		return personas
	}

	method patovaDeTurno(nuevoPatova) {
		patovaDeTurno = nuevoPatova
	}
	
	method dj(nuevoDj) {
		dj = nuevoDj
	}
}

object darkRoom {
	var patovaDeTurno
	var personas = #{}

	method nombre() {
		return "darkRoom"
	}

	method entrar(persona) {
		if (patovaDeTurno.dejaPasar(persona)) {
			personas.add(persona)	
		}
	}

	method cuantosBailan() {
		return personas.size()
	}

	method personas() {
		return personas
	}

	method patovaDeTurno(nuevoPatova) {
		patovaDeTurno = nuevoPatova
	}
}