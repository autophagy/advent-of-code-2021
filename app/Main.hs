module Main where

import Solution
import qualified Solutions.Day1 as Day1
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
import qualified Solutions.Day2 as Day2
import qualified Solutions.Day20 as Day20
import qualified Solutions.Day21 as Day21
import qualified Solutions.Day22 as Day22
import qualified Solutions.Day23 as Day23
import qualified Solutions.Day24 as Day24
import qualified Solutions.Day25 as Day25
import qualified Solutions.Day3 as Day3
import qualified Solutions.Day4 as Day4
import qualified Solutions.Day5 as Day5
import qualified Solutions.Day6 as Day6
import qualified Solutions.Day7 as Day7
import qualified Solutions.Day8 as Day8
import qualified Solutions.Day9 as Day9
import System.Environment (getArgs)
import System.Exit (exitFailure)
import System.IO (IOMode (..), hGetContents, hPutStrLn, openFile, stderr)

getSolution :: String -> Maybe (Solution, Solution, FilePath)
getSolution "1" = Just (Day1.partOne, Day1.partTwo, "data/day1.txt")
getSolution "2" = Just (Day2.partOne, Day2.partTwo, "data/day2.txt")
getSolution "3" = Just (Day3.partOne, Day3.partTwo, "data/day3.txt")
getSolution "4" = Just (Day4.partOne, Day4.partTwo, "data/day4.txt")
getSolution "5" = Just (Day5.partOne, Day5.partTwo, "data/day5.txt")
getSolution "6" = Just (Day6.partOne, Day6.partTwo, "data/day6.txt")
getSolution "7" = Just (Day7.partOne, Day7.partTwo, "data/day7.txt")
getSolution "8" = Just (Day8.partOne, Day8.partTwo, "data/day8.txt")
getSolution "9" = Just (Day9.partOne, Day9.partTwo, "data/day9.txt")
getSolution "10" = Just (Day10.partOne, Day10.partTwo, "data/day10.txt")
getSolution "11" = Just (Day11.partOne, Day11.partTwo, "data/day11.txt")
getSolution "12" = Just (Day12.partOne, Day12.partTwo, "data/day12.txt")
getSolution "13" = Just (Day13.partOne, Day13.partTwo, "data/day13.txt")
getSolution "14" = Just (Day14.partOne, Day14.partTwo, "data/day14.txt")
getSolution "15" = Just (Day15.partOne, Day15.partTwo, "data/day15.txt")
getSolution "16" = Just (Day16.partOne, Day16.partTwo, "data/day16.txt")
getSolution "17" = Just (Day17.partOne, Day17.partTwo, "data/day17.txt")
getSolution "18" = Just (Day18.partOne, Day18.partTwo, "data/day18.txt")
getSolution "19" = Just (Day19.partOne, Day19.partTwo, "data/day19.txt")
getSolution "20" = Just (Day20.partOne, Day20.partTwo, "data/day20.txt")
getSolution "21" = Just (Day21.partOne, Day21.partTwo, "data/day21.txt")
getSolution "22" = Just (Day22.partOne, Day22.partTwo, "data/day22.txt")
getSolution "23" = Just (Day23.partOne, Day23.partTwo, "data/day23.txt")
getSolution "24" = Just (Day24.partOne, Day24.partTwo, "data/day24.txt")
getSolution "25" = Just (Day25.partOne, Day25.partTwo, "data/day25.txt")
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
        Just (partOne, partTwo, fp) -> do
          input <- readInput fp
          putStrLn $ "Day " ++ day ++ " solution:"
          putStrLn $ "Puzzle 1: " ++ show (partOne input)
          putStrLn $ "Puzzle 2: " ++ show (partTwo input)
        Nothing -> hPutStrLn stderr $ "No solution found for day " ++ day
    _ -> do
      hPutStrLn stderr "usage: <integer>"
      exitFailure
