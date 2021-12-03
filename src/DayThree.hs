module DayThree (partOne, partTwo) where

import Solution
import Data.Char (digitToInt)
import Data.Bool (bool)

import Data.Foldable (foldl')


binaryToDecimal :: [Bool] -> Int
binaryToDecimal = foldl (\a -> (+) (2*a) . bool 0 1) 0

diagnostic :: [[Int]] -> (Int -> Int -> Bool) -> [Bool]
diagnostic binary op = map (op l) occured
    where
        l = div (length binary) 2
        occured = foldl' (zipWith (+)) [0,0..] binary


lifeSupportRating :: [[Int]] -> (Int -> Int -> Bool) -> [Bool] -> [Bool]
lifeSupportRating [ a ] _ soFar = soFar ++ map (==1) a
lifeSupportRating binary op soFar = lifeSupportRating binary' op soFar'
    where
        i = sum $ map head binary
        k = op (length binary - i) i
        soFar' = soFar ++ [k]
        binary' = map tail $ filter ((==) (fromEnum k) . head) binary


partOne :: Solution
partOne lines = gamma * epsilon
    where
        binary = map (map digitToInt) lines
        gamma = binaryToDecimal $ diagnostic binary (>=)
        epsilon = binaryToDecimal $ diagnostic binary (<)


partTwo :: Solution
partTwo lines = o2 * co2
    where
        bin = map (map digitToInt) lines
        o2 = binaryToDecimal $ lifeSupportRating bin (<=) []
        co2 = binaryToDecimal $ lifeSupportRating bin (>) []
