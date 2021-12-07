module Solutions.Day04 (solution) where

import Common (contains, splitListBy, splitOn)
import Data.List (transpose, (\\))
import Solution

type BingoBoard = [[Int]]

-- | Input parsing functions
readBoard :: [String] -> BingoBoard
readBoard = map (map read . words)

readInput :: [String] -> ([Int], [BingoBoard])
readInput s = (numbersToCall, boards)
  where
    s' = splitListBy "" s
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

partOne :: [Int] -> [BingoBoard] -> Int
partOne n b = calculateFirstWinner b n []

partTwo :: [Int] -> [BingoBoard] -> Int
partTwo n b = calculateLastWinner b n []

solution :: Solution ([Int], [BingoBoard])
solution =
  MkSol
    { mkParse = readInput,
      mkPartOne = uncurry partOne,
      mkPartTwo = uncurry partTwo
    }
