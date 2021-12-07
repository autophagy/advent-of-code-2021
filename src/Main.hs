module Main where

import Solution
import qualified Solutions.Day01 as Day01
import qualified Solutions.Day02 as Day02
import qualified Solutions.Day03 as Day03
import qualified Solutions.Day04 as Day04
import qualified Solutions.Day05 as Day05
import qualified Solutions.Day06 as Day06
import qualified Solutions.Day07 as Day07
import qualified Solutions.Day08 as Day08
import qualified Solutions.Day09 as Day09
import qualified Solutions.Day10 as Day10
import qualified Solutions.Day11 as Day11
import qualified Solutions.Day12 as Day12
import qualified Solutions.Day13 as Day13
import qualified Solutions.Day14 as Day14
import qualified Solutions.Day15 as Day15
import qualified Solutions.Day16 as Day16
import qualified Solutions.Day17 as Day17
import qualified Solutions.Day18 as Day18
import qualified Solutions.Day19 as Day19
import qualified Solutions.Day20 as Day20
import qualified Solutions.Day21 as Day21
import qualified Solutions.Day22 as Day22
import qualified Solutions.Day23 as Day23
import qualified Solutions.Day24 as Day24
import qualified Solutions.Day25 as Day25
import System.Environment (getArgs)
import System.Exit (exitFailure)
import System.IO (IOMode (..), hGetContents, hPutStrLn, openFile, stderr)

getSolution :: String -> Maybe (WrappedSolution, FilePath)
getSolution "1" = Just (MkWrappedSolution Day01.solution, "data/day1.txt")
getSolution "2" = Just (MkWrappedSolution Day02.solution, "data/day2.txt")
getSolution "3" = Just (MkWrappedSolution Day03.solution, "data/day3.txt")
getSolution "4" = Just (MkWrappedSolution Day04.solution, "data/day4.txt")
getSolution "5" = Just (MkWrappedSolution Day05.solution, "data/day5.txt")
getSolution "6" = Just (MkWrappedSolution Day06.solution, "data/day6.txt")
getSolution "7" = Just (MkWrappedSolution Day07.solution, "data/day7.txt")
getSolution "8" = Just (MkWrappedSolution Day08.solution, "data/day7.txt")
getSolution "9" = Just (MkWrappedSolution Day09.solution, "data/day7.txt")
getSolution "10" = Just (MkWrappedSolution Day10.solution, "data/day10.txt")
getSolution "11" = Just (MkWrappedSolution Day11.solution, "data/day11.txt")
getSolution "12" = Just (MkWrappedSolution Day12.solution, "data/day12.txt")
getSolution "13" = Just (MkWrappedSolution Day13.solution, "data/day13.txt")
getSolution "14" = Just (MkWrappedSolution Day14.solution, "data/day14.txt")
getSolution "15" = Just (MkWrappedSolution Day15.solution, "data/day15.txt")
getSolution "16" = Just (MkWrappedSolution Day16.solution, "data/day16.txt")
getSolution "17" = Just (MkWrappedSolution Day17.solution, "data/day17.txt")
getSolution "18" = Just (MkWrappedSolution Day18.solution, "data/day18.txt")
getSolution "19" = Just (MkWrappedSolution Day19.solution, "data/day19.txt")
getSolution "20" = Just (MkWrappedSolution Day20.solution, "data/day20.txt")
getSolution "21" = Just (MkWrappedSolution Day21.solution, "data/day21.txt")
getSolution "22" = Just (MkWrappedSolution Day22.solution, "data/day22.txt")
getSolution "23" = Just (MkWrappedSolution Day23.solution, "data/day23.txt")
getSolution "24" = Just (MkWrappedSolution Day24.solution, "data/day24.txt")
getSolution "25" = Just (MkWrappedSolution Day25.solution, "data/day25.txt")
getSolution _ = Nothing

readInput :: FilePath -> IO [String]
readInput filename = do
  handle <- openFile filename ReadMode
  contents <- hGetContents handle
  pure $ lines contents

main :: IO ()
main = do
  args <- getArgs
  case args of
    [day] ->
      case getSolution day of
        Just (solution, fp) -> do
          input <- readInput fp
          let (partOne, partTwo) = runWrappedSolution solution input
          putStrLn $ "Day " ++ day ++ " solution:"
          putStrLn $ "Puzzle 1: " ++ show partOne
          putStrLn $ "Puzzle 2: " ++ show partTwo
        Nothing -> hPutStrLn stderr $ "No solution found for day " ++ day
    _ -> do
      hPutStrLn stderr "usage: <integer>"
      exitFailure
