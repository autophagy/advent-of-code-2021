import Test.Hspec

import qualified DayOne
import qualified DayTwo
import qualified DayThree

main :: IO ()
main = hspec $ do
    describe "Day one" $ do
        let lines = ["199", "200", "208", "210", "200", "207", "240", "269", "260", "263"]

        it "returns the correct result for the part 1's example" $ do
            DayOne.partOne lines `shouldBe` 7

        it "returns the correct result for part 2's example" $ do
            DayOne.partTwo lines `shouldBe` 5

    describe "Day two" $ do
        let lines = [ "forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2" ]

        it "returns the correct result for the part 1's example" $ do
            DayTwo.partOne lines `shouldBe` 150

        it "returns the correct result for part 2's example" $ do
            DayTwo.partTwo lines `shouldBe` 900

    describe "Day three" $ do
        let lines = ["00100", "11110", "10110", "10111", "10101", "01111", "00111", "11100", "10000", "11001", "00010", "01010"]

        it "returns the correct result for the part 1's example" $ do
            DayThree.partOne lines `shouldBe` 198

        it "returns the correct result for part 2's example" $ do
            DayThree.partTwo lines `shouldBe` 230
