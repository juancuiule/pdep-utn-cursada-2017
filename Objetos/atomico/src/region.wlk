import ciudades.*

object region {

	var ciudades = #{springfield, albuquerque}
	
	method centralesMasProductoras() {
		return ciudades.map({ ciudad => ciudad.centralMasProductora() })
	}

}