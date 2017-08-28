object dixon {
	method hacerBailar(persona) {
		persona.modificarEnergia(-60)
		persona.modificarDiversion(120)
	}
}

object marcelDettmann {
	method hacerBailar(persona) {
		persona.modificarEnergia(-persona.energia())
		persona.modificarDiversion(1000)
	}	
}

object tommyMunioz {
	method hacerBailar(persona) {
		persona.modificarEnergia(-80)
		//persona.modificarDiversion(-persona.diversion())
	}	
}