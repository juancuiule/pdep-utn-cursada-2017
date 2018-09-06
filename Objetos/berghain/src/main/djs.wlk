object dixon {

	method hacerBailar(persona) {
		persona.disminuirEnergia(60)
		persona.aumentarDiversion(120)
	}

}

object marcelDettmann {

	method hacerBailar(persona) {
		persona.energia(0)
		persona.aumentarDiversion(1000)
	}

}

object tommyMunioz {

	method hacerBailar(persona) {
		persona.disminuirEnergia(80)
		// definir si "no se divierte" quiere decir
		// que queda con diversion == 0 ó que la diversion
		// no cambia
		persona.diversion(0)
	}

}

