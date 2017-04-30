import Test.Hspec
import Boliche

main = hspec $ do

	describe "Punto 1b" $ do

		describe "Marcos toma una soda de nivel 3" $ do

				it "Marcos queda con 2 bebidas" $ do
					(length.bebidasTomadas.tomarBebida (soda 3)) marcos `shouldBe` 2

				it "Marcos queda con 40 de resistencia" $ do
					(resistencia.tomarBebida (soda 3)) marcos `shouldBe` 40

	describe "Punto 1c" $ do

		it "Rodri toma una Soda nivel 1, y una Soda nivel 2, queda con nombre 'errperpRodri'" $ do
			(nombre.tomarTragos rodri) [soda 1, soda 2] `shouldBe` "errperpRodri"

		describe "Marcos toma un Klusener de huevo, un Tintico, y una Jarra Loca" $ do

			it "Marcos queda con resistencia 30" $ do
				(resistencia.tomarTragos marcos) [klusener "huevo", tintico, jarraLoca] `shouldBe` 30

			it "Marcos queda con 4 bebidas en el historial" $ do
				(length.bebidasTomadas.tomarTragos marcos) [klusener "huevo", tintico, jarraLoca] `shouldBe` 4

	describe "Punto 1d" $ do

		--it "Ana pide 'dame otro' y debe dar error" $ do
			--dameOtro ana `shouldBe` 

		describe "Marcos pide 'dame otro'" $ do

			it "Marcos pide 'dame otro' y tiene 2 bebidas en el historial" $ do
				(length.bebidasTomadas.tomarBebida (dameOtro marcos)) marcos `shouldBe` 2

			it "Marcos pide 'dame otro' y lo deja con 34 de resistencia" $ do
				(resistencia.dameOtro marcos) marcos `shouldBe` 34

		describe "Rodri toma una soda nivel 1 y 'dameOtro'" $ do

			it "Rodri queda con 3 bebidas en su historial" $ do
				(length.bebidasTomadas.tomarTragos rodri) [soda 1, dameOtro rodri] `shouldBe` 3

			it "Rodri queda con nombre 'erperpRodri'" $ do
				(nombre.tomarTragos rodri) [soda 1, dameOtro rodri] `shouldBe` "erperpRodri"

	describe "Punto 2b" $ do

		it "Rodri puede tomar 2 bebids entre un grogXD, un tintico y un klusener de frutilla" $ do
			cuantasPuedeTomar rodri [grogXD, tintico, klusener "frutilla"] `shouldBe` 2

		it "Rodri puede tomar 1 sola bebida entre un grogXD, un tintico y un klusener de fruuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuutilla" $ do
			cuantasPuedeTomar rodri [grogXD, tintico, klusener "fruuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuutilla"] `shouldBe` 1

	describe "Punto 3b" $ do

		describe "Rodri hace una salida de amigos" $ do

			it "debe quedar con un amigo" $ do
				(length.amigos.hacerItinerario salidaDeAmigos) rodri `shouldBe` 1

			it "se debe llamar 'erpRodri'" $ do
				(nombre.hacerItinerario salidaDeAmigos) rodri `shouldBe` "erpRodri"

			it "debe quedar con 45 de resistencia" $ do
				(resistencia.hacerItinerario salidaDeAmigos) rodri `shouldBe` 45

			it "su primer y único amigo Roberto Carlos queda con 155 de resistencia" $ do
				(resistencia.head.amigos.hacerItinerario salidaDeAmigos) rodri `shouldBe` 155

			--it "debe quedar con 5 bebidas en su historial" $ do
			--	(length.bebidasTomadas.hacerItinerario salidaDeAmigos) rodri `shouldBe` 5

			it "debe quedar con 4 bebidas en su historial (tintico, soda 1, tintico, jarraLoca) corrección enunciado..." $ do
				(length.bebidasTomadas.hacerItinerario salidaDeAmigos) rodri `shouldBe` 4

	describe "Punto 4a" $ do

		it "La intensidad de la mezcla explosiva es 1.6" $ do
			intensidad mezclaExplosiva `shouldBe` 1.6

		it "La intensidad de la salidaDeAmigos es 4.0" $ do
			intensidad salidaDeAmigos `shouldBe` 4.0

		it "La intensidad de itinerario basico es 0.8" $ do
			intensidad itinerarioBasico `shouldBe` 0.8

	describe "Punto 4b" $ do

		it "Entre la salida de amigos, la mezcla explosiva y el itinerario básico, el itinerario más intenso es la salida de amigos" $ do
			(nombreItinerario.itinerarioMasIntenso) [salidaDeAmigos, mezclaExplosiva, itinerarioBasico] `shouldBe` "Salida de Amigos"

		describe "Rodri hace el itinerario más intenso entre una salida de amigos, la mezcla explosiva y el itinerario básico" $ do

			it "queda con el nombre 'erpRodri'" $ do
				(nombre.hacerItinerario (itinerarioMasIntenso [salidaDeAmigos, mezclaExplosiva, itinerarioBasico]) ) rodri `shouldBe` "erpRodri"

			it "queda con el con resistencia 45'" $ do
				(resistencia.hacerItinerario (itinerarioMasIntenso [salidaDeAmigos, mezclaExplosiva, itinerarioBasico]) ) rodri `shouldBe` 45

			it "queda con un amigo Roberto Carlos'" $ do
				(nombre.head.amigos.hacerItinerario (itinerarioMasIntenso [salidaDeAmigos, mezclaExplosiva, itinerarioBasico]) ) rodri `shouldBe` "Roberto Carlos"