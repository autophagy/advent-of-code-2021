module Day4 (partOne, partTwo) where

import Data.List
import Solution

type BingoBoard = [[Int]]

-- | Split a string by a delimiter character, dropping the delimiter.
splitOn :: Char -> String -> [String]
splitOn c s = case dropWhile (== c) s of
  "" -> []
  s' -> w : splitOn c s''
    where
      (w, s'') = break (== c) s'

-- | Append an element to the last member of a list of lists.
appendToLast :: [[a]] -> a -> [[a]]
appendToLast xs x = init xs ++ [last xs ++ [x]]

-- | Group a set of strings by the empty string, dropping the empty string.
splitwhenEmpty :: [String] -> [[String]]
splitwhenEmpty s = splitwhenEmpty_ s [[]]

splitwhenEmpty_ :: [String] -> [[String]] -> [[String]]
splitwhenEmpty_ [] p = p
splitwhenEmpty_ ("" : xs) p = splitwhenEmpty_ xs (p ++ [[]])
splitwhenEmpty_ (x : xs) p = splitwhenEmpty_ xs (appendToLast p x)

contains :: Ord a => [a] -> [a] -> Bool
contains a b = intersect b a == b

-- | Input parsing functions
readBoard :: [String] -> BingoBoard
readBoard = map (map read . words)

readInput :: [String] -> ([Int], [BingoBoard])
readInput s = (numbersToCall, boards)
  where
    s' = splitwhenEmpty s
    numbersToCall = map read . splitOn ',' . head $ head s'
    boards = map readBoard (tail s')

-- | Bingo Board functions
hasBoardWon :: [Int] -> BingoBoard -> Bool
hasBoardWon numbersSoFar board = not (null winners)
  where
    winners = filter (contains numbersSoFar) (board ++ transpose board)

calculateScore :: BingoBoard -> [Int] -> Int
calculateScore board numbersSoFar = unmarkedSum * head numbersSoFar
  where
    unmarkedSum = sum . filter (`notElem` numbersSoFar) . concat $ board

calculateFirstWinner :: [BingoBoard] -> [Int] -> [Int] -> Int
calculateFirstWinner boards (x : xs) soFar =
  case filter (hasBoardWon soFar) boards of
    [] -> calculateFirstWinner boards xs (x : soFar)
    (a : _) -> calculateScore a soFar
calculateFirstWinner _ [] _ = -1

calculateLastWinner :: [BingoBoard] -> [Int] -> [Int] -> Int
calculateLastWinner [board] (x : xs) soFar
  | hasBoardWon soFar board = calculateScore board soFar
  | otherwise = calculateLastWinner [board] xs (x : soFar)
calculateLastWinner boards (x : xs) soFar =
  case filter (hasBoardWon soFar) boards of
    [] -> calculateLastWinner boards xs (x : soFar)
    a -> calculateLastWinner (boards \\ a) xs (x : soFar)
calculateLastWinner _ [] _ = -1

partOne :: Solution
partOne s = calculateFirstWinner b n []
  where
    (n, b) = readInput s

partTwo :: Solution
partTwo s = calculateLastWinner b n []
  where
    (n, b) = readInput s
