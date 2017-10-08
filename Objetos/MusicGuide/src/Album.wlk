import cancion.*
class Album {
	var fechaDeLanzamiento
	var unidadesEnVenta
	var unidadesVendidas
	var canciones
	
	constructor (unaFecha, unasUnidadesEnVenta, unasUnidadesVendidas, unasCanciones) {
		fechaDeLanzamiento = unaFecha
		unidadesEnVenta = unasUnidadesEnVenta
		unidadesVendidas = unasUnidadesVendidas
		canciones = unasCanciones
	}
	
	method unidadesEnVenta(){
		return unidadesEnVenta
	}
	
	method unidadesVendidas () {
		return unidadesVendidas
	}
	
	method esAlbumMinimalista () {
		return canciones.all({cancion => cancion.esCorta()})
	}
	
	method cancionesQueDicen(palabra){
		return canciones.filter({cancion => cancion.dice(palabra)})
	}
	
	method cancionMasLarga() {
		return canciones.max({cancion => cancion.duracion()})
	}
	
	method duracion () {
		return canciones.sum({cancion => cancion.duracion()})
	}
		
	method tieneBuenaVenta(){
		return (unidadesEnVenta * 0.75) < unidadesVendidas
	}
	method estaEnElAlbumLaCancion(cancion){
		return canciones.contains(cancion)
	}
	method compararCancionPorDuracion(unaCancion,otraCancion){
		return unaCancion.duracion() > otraCancion.duracion()
	}//Retorna BOOL, deberia ir en un fold, el enunciado pide comparar 2 canciones por estos criterios

	method compararCancionPorLetra(unaCancion,otraCancion){
		return unaCancion.cantidadDeLetras() > otraCancion.cantidadDeLetras()
		
	}//Retorna BOOL, deberia ir en un fold, el enunciado pide comparar 2 canciones por estos criterios
	method compararCancionPorTitulo(unaCancion,otraCancion){
		return unaCancion.cantidadDeLetrasTitulo() > otraCancion.cantidadDeLetrasTitulo()
		
	}//Retorna BOOL, deberia ir en un fold, el enunciado pide comparar 2 canciones por estos criterios
	
	method mayorCancionAlbumPorDuracion(){
		return canciones.fold(canciones.head(),{unaCancion,otraCancion => self.compararCancionPorDuracion(unaCancion,otraCancion)})
	} // NO FUNCIONA, NO TOMA EL "canciones.head()" que seria el inicio del fold.
	method compararCancionesPor(unaCancion,otraCancion,criterio){
		//Deberia ser asi, creo yo, dejo un modelo abajo seguramente esta mal
	}

}

//object duracion{
	
//	method compararCancionPorDuracion(unaCancion,otraCancion){
//		return unaCancion.duracion() > otraCancion.duracion()
//	}
//}
//object titulo{
	
//	method compararCancionPorTitulo(unaCancion,otraCancion){
//		return unaCancion.cantidadDeLetrasTitulo() > otraCancion.cantidadDeLetrasTitulo()
//		
//	}
//}
//object letra{
	
//	method compararCancionPorLetra(unaCancion,otraCancion){
//		return unaCancion.cantidadDeLetras() > otraCancion.cantidadDeLetras()
//		
//	}


