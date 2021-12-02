module Main where

import System.IO (IOMode (..), hGetContents, openFile, stderr, hPutStrLn)
import System.Environment (getArgs)
import System.Exit (exitFailure)

import qualified DayOne
import qualified DayTwo
import Solution

getSolution :: String -> Maybe (Solution, Solution, FilePath)
getSolution "1" = Just (DayOne.partOne, DayOne.partTwo, "data/day1.txt")
getSolution "2" = Just (DayTwo.partOne, DayTwo.partTwo, "data/day2.txt")
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
      [ day ] ->
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
