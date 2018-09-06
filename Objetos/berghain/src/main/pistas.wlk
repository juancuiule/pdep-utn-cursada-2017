object mainRoom {

	var property patovaDeTurno
	var property personas = #{}

	method nombre() {
		return "mainRoom"
	}

	method bailar(persona) {
		persona.disminuirEnergia(40)
		persona.aumentarDiversion(30)
	}

	method entrar(persona) {
		if (patovaDeTurno.dejaPasar(persona)) {
			personas.add(persona)
		}
	}

	method cuantosBailan() {
		return personas.size()
	}
	
	method estaEnPista(alguien) {
		return personas.contains(alguien)
	}

}

object panoramaBar {

	var property patovaDeTurno
	var property dj
	var property personas = #{}

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
	
	method estaEnPista(alguien) {
		return personas.contains(alguien)
	}

}

object darkRoom {

	var property patovaDeTurno
	var property personas = #{}

	method nombre() {
		return "darkRoom"
	}

	method bailar() {}

	method entrar(persona) {
		if (patovaDeTurno.dejaPasar(persona)) {
			personas.add(persona)
		}
	}

	method cuantosBailan() {
		return personas.size()
	}
	
	method estaEnPista(alguien) {
		return personas.contains(alguien)
	}

}

