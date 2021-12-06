import Test.Hspec

import qualified Solutions.Day1 as Day1
import qualified Solutions.Day2 as Day2
import qualified Solutions.Day3 as Day3
import qualified Solutions.Day4 as Day4
import qualified Solutions.Day5 as Day5
import qualified Solutions.Day6 as Day6


main :: IO ()
main = hspec $ do
    describe "Day one" $ do
        let input = ["199", "200", "208", "210", "200", "207", "240", "269", "260", "263"]

        it "returns the correct result for the part 1's example" $ do
            Day1.partOne input `shouldBe` 7

        it "returns the correct result for part 2's example" $ do
            Day1.partTwo input `shouldBe` 5

    describe "Day two" $ do
        let input = [ "forward 5", "down 5", "forward 8", "up 3", "down 8", "forward 2" ]

        it "returns the correct result for the part 1's example" $ do
            Day2.partOne input `shouldBe` 150

        it "returns the correct result for part 2's example" $ do
            Day2.partTwo input `shouldBe` 900

    describe "Day three" $ do
        let input = ["00100", "11110", "10110", "10111", "10101", "01111", "00111", "11100", "10000", "11001", "00010", "01010"]

        it "returns the correct result for the part 1's example" $ do
            Day3.partOne input `shouldBe` 198

        it "returns the correct result for part 2's example" $ do
            Day3.partTwo input `shouldBe` 230

    describe "Day four" $ do
        let input = [ "7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1"
                    , ""
                    , "22 13 17 11  0"
                    , " 8  2 23  4 24"
                    , "21  9 14 16  7"
                    , " 6 10  3 18  5"
                    , " 1 12 20 15 19"
                    , ""
                    , " 3 15  0  2 22"
                    , " 9 18 13 17  5"
                    , "19  8  7 25 23"
                    , "20 11 10 24  4"
                    , "14 21 16 12  6"
                    , ""
                    , "14 21 17 24  4"
                    , "10 16 15  9 19"
                    , "18  8 23 26 20"
                    , "22 11 13  6  5"
                    , " 2  0 12  3  7" ]


        it "returns the correct result for the part 1's example" $ do
            Day4.partOne input `shouldBe` 4512

        it "returns the correct result for part 2's example" $ do
            Day4.partTwo input `shouldBe` 1924

    describe "Day five" $ do
        let input = [ "0,9 -> 5,9"
                    , "8,0 -> 0,8"
                    , "9,4 -> 3,4"
                    , "2,2 -> 2,1"
                    , "7,0 -> 7,4"
                    , "6,4 -> 2,0"
                    , "0,9 -> 2,9"
                    , "3,4 -> 1,4"
                    , "0,0 -> 8,8"
                    , "5,5 -> 8,2" ]

        it "returns the correct result for part 1's example" $ do
            Day5.partOne input `shouldBe` 5

        it "returns the correct result for part 2's example" $ do
            Day5.partTwo input `shouldBe` 12

    describe "Day six" $ do
        let input = ["3,4,3,1,2"]

        it "returns the correct result for part 1's example" $ do
            Day6.partOne input `shouldBe` 5934

        it "returns the correct result for part 2's example" $ do
            Day6.partTwo input `shouldBe` 26984457539
