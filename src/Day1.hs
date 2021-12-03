module Day1 (partOne, partTwo) where

import Solution

numOfIncreases :: [Integer] -> Int
numOfIncreases a = length . filter (\(a, b) -> b > a) $ zip a (drop 1 a)

slidingWindow :: Int -> [a] -> [[a]]
slidingWindow i xs
  | length xs < i = []
  | otherwise = take i xs : slidingWindow i (tail xs)

partOne :: Solution
partOne = numOfIncreases . map read

partTwo :: Solution
partTwo = numOfIncreases . map sum . slidingWindow 3 . map read
