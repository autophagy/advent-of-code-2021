module Solutions.Day1 (partOne, partTwo) where

import Common (slidingWindow)
import Solution

numOfIncreases :: [Integer] -> Int
numOfIncreases a = length . filter (\(a, b) -> b > a) $ zip a (drop 1 a)

partOne :: Solution
partOne = numOfIncreases . map read

partTwo :: Solution
partTwo = numOfIncreases . map sum . slidingWindow 3 . map read
