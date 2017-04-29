import Test.Hspec
import Boliche

main = hspec $ do
	describe "toma grogXD" $ do
		it "ana toma grogXD" $ do
			resistencia (tomarBebida grogXD ana) `shouldBe` 0