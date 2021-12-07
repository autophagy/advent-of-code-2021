module Solutions.Day01 (solution) where

import Common (slidingWindow)
import Solution

numOfIncreases :: [Integer] -> Int
numOfIncreases list = length . filter (\(a, b) -> b > a) $ zip list (drop 1 list)

solution :: Solution [Integer]
solution =
  MkSol
    { mkParse = map read,
      mkPartOne = numOfIncreases,
      mkPartTwo = numOfIncreases . map sum . slidingWindow 3
    }
