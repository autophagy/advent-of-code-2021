module Solutions.Day1 (partOne, partTwo) where

import Common (slidingWindow)
import Solution

numOfIncreases :: [Integer] -> Int
numOfIncreases list = length . filter (\(a, b) -> b > a) $ zip list (drop 1 list)

partOne :: Solution
partOne = numOfIncreases . map read

partTwo :: Solution
partTwo = numOfIncreases . map sum . slidingWindow 3 . map read
