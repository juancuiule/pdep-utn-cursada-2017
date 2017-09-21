
class Musico {

	var habilidad
	
	constructor(unaHabilidad){
		habilidad = unaHabilidad
	}

}

class MusicoDeGrupo inherits Musico{
		
	var aumento
	
	constructor(unaHabilidad,unAumento) = super(unaHabilidad){
        aumento = unAumento
    }
	
}

class VocalistaPopular inherits Musico{
		
	var palabra
	
	constructor(unaHabilidad,unaPalabra) = super(unaHabilidad){
        palabra = unaPalabra
    }
	
}