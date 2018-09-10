object vonLukaz {

	var property energia = 150
	var property diversion = 70
	var remera = "blanca"
	var jean = "blanco"
	var edad = 17

	method aumentarEnergia(cantidad) {
		energia += cantidad
	}

	method disminuirEnergia(cantidad) {
		energia -= cantidad
	}

	method aumentarDiversion(cantidad) {
		diversion += cantidad
	}

	method disminuirDiversion(cantidad) {
		diversion -= cantidad
	}

	method tieneRemeraDeColor(color) {
		return remera == color
	}
	
	method tieneJeanDeColor(color) {
		return jean == color
	}

	method esMayorDe(unaEdad) {
		return edad > unaEdad
	}

}

object bianker {

	var property energia = 140
	var property diversion = 80
	var remera = "negra"
	var jean = "negro"
	var edad = 22

	method aumentarEnergia(cantidad) {
		energia += cantidad
	}

	method disminuirEnergia(cantidad) {
		energia -= cantidad
	}

	method aumentarDiversion(cantidad) {
		diversion += cantidad
	}

	method disminuirDiversion(cantidad) {
		diversion -= cantidad
	}

	method tieneRemeraDeColor(color) {
		return remera == color
	}
	
	method tieneJeanDeColor(color) {
		return jean == color
	}

	method esMayorDe(unaEdad) {
		return edad > unaEdad
	}

}

object gonzen {

	var property energia = 90
	var property diversion = 15
	var remera = "negra"
	var jean = "azul"
	var edad = 33

	method aumentarEnergia(cantidad) {
		energia += cantidad
	}

	method disminuirEnergia(cantidad) {
		energia -= cantidad
	}

	method aumentarDiversion(cantidad) {
		diversion += cantidad
	}

	method disminuirDiversion(cantidad) {
		diversion -= cantidad
	}

	method tieneRemeraDeColor(color) {
		return remera == color
	}
	
	method tieneJeanDeColor(color) {
		return jean == color
	}

	method esMayorDe(unaEdad) {
		return edad > unaEdad
	}

}

