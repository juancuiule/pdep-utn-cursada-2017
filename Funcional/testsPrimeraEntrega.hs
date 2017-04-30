import Test.Hspec
import Boliche

main = hspec $ do

	describe "Estados de los clientes" $ do

		it "Cristian debe estar 'duro'" $ do
			comoEsta cristian `shouldBe` "duro"

		it "Rodri debe estar 'fresco'" $ do
			comoEsta rodri `shouldBe` "fresco"

		it "Marcos debe estar 'duro'" $ do
			comoEsta marcos `shouldBe` "duro"

		it "Si Marcos se hace amigo de Ana y Rodri, está 'piola'" $ do
			(comoEsta.agregarAmigo ana.agregarAmigo rodri) marcos `shouldBe` "piola"
	
	describe "Los clientes toman" $ do

		describe "Bebida grogXD" $ do

			it "Ana toma grogXD, queda con resistencia 0" $ do
				(resistencia.grogXD) ana `shouldBe` 0

		describe "Bebida Jarra Loca" $ do

			describe "Ana toma jarraLoca" $ do

				it "Ana queda con resistencia 110" $ do
					(resistencia.jarraLoca) ana `shouldBe` 110

				it "Marcos quda con 30" $ do 
					(resistencia.last.amigos.jarraLoca) ana `shouldBe` 30

				it "Rodri con 45" $ do
					(resistencia.head.amigos.jarraLoca) ana `shouldBe` 45

		describe "Bebida Klusener" $ do

			it "Ana toma un Klusener de huevo, queda con resistencia 115" $ do
				(resistencia.klusener "huevo") ana `shouldBe` 115

			it "Ana toma un Klusener de chocolate, queda con resistencia 111" $ do
				(resistencia.klusener "chocolate") ana `shouldBe` 111

		describe "Bebida Tintico" $ do

			it "Cristian toma un tintico, queda con resistencia 2" $ do
				(resistencia.tintico) cristian `shouldBe` 2

			it "Ana toma un tintico, pasa de 120 a 130 de resistencia" $ do
				(resistencia.tintico) ana `shouldBe` 130

		describe "Bebida Soda" $ do

			it "Rodri toma una soda de fuerza 2, queda con nombre 'errpRodri'" $ do
				(nombre.soda 2) rodri `shouldBe` "errpRodri"

			it "Ana toma una soda de fuerza 10, queda con nombre 'errrrrrrrrrpAna'" $ do
				(nombre.soda 10) ana `shouldBe` "errrrrrrrrrpAna"

			it "Ana toma una soda de fuerza 0, queda con nombre 'epAna'" $ do
				(nombre.soda 0) ana `shouldBe` "epAna"

	describe "Los clientes se rescatan" $ do

		it "Rodri se rescata 5hr, queda con 255 de resistencia" $ do
			(resistencia.rescatarse 5) rodri `shouldBe` 255

		it "Rodri se rescata 1hr, queda con 155 de resistencia" $ do
			(resistencia.rescatarse 1) rodri `shouldBe` 155

	describe "Itinerario de Ana" $ do

		it "Ana queda con resistencia 196" $ do
			resistencia itinerarioDeAna `shouldBe` 196

		it "Marcos quda con 30" $ do 
			(resistencia.last.amigos) itinerarioDeAna `shouldBe` 30

		it "Rodri con 45" $ do
			(resistencia.head.amigos) itinerarioDeAna `shouldBe` 45
