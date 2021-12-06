module Solutions.Day3 (partOne, partTwo) where

import Common (binaryToDecimal)
import Data.Char (digitToInt)
import Data.Foldable (foldl')
import Solution

diagnostic :: [[Int]] -> (Int -> Int -> Bool) -> [Bool]
diagnostic binary op = map (op l) occured
  where
    l = div (length binary) 2
    occured = foldl' (zipWith (+)) [0, 0 ..] binary

lifeSupportRating :: [[Int]] -> (Int -> Int -> Bool) -> [Bool] -> [Bool]
lifeSupportRating [a] _ soFar = soFar ++ map (== 1) a
lifeSupportRating binary op soFar = lifeSupportRating binary' op soFar'
  where
    i = sum $ map head binary
    k = op (length binary - i) i
    soFar' = soFar ++ [k]
    binary' = map tail $ filter ((==) (fromEnum k) . head) binary

partOne :: Solution
partOne l = gamma * epsilon
  where
    binary = map (map digitToInt) l
    gamma = binaryToDecimal $ diagnostic binary (>=)
    epsilon = binaryToDecimal $ diagnostic binary (<)

partTwo :: Solution
partTwo l = o2 * co2
  where
    bin = map (map digitToInt) l
    o2 = binaryToDecimal $ lifeSupportRating bin (<=) []
    co2 = binaryToDecimal $ lifeSupportRating bin (>) []
