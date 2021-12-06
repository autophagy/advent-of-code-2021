module Solutions.Day6 (partOne, partTwo) where

import Common (splitOn)
import Data.List
import qualified Data.Map as M
import Solution

type Lanternfish = Int

parseInput :: String -> [Lanternfish]
parseInput = map read . splitOn ','

evolve :: M.Map Lanternfish Int -> M.Map Lanternfish Int
evolve = M.fromAscListWith (+) . sort . concatMap iterateFish . M.assocs

iterateFish :: (Lanternfish, Int) -> [(Lanternfish, Int)]
iterateFish (0, n) = [(6, n), (8, n)]
iterateFish (f, n) = [(f -1, n)]

groupFish :: [Lanternfish] -> M.Map Lanternfish Int
groupFish = M.fromList . map (\x -> (head x, length x)) . group . sort

runEvolution :: Int -> [String] -> Int
runEvolution days = sum . M.elems . last . take totalDays . iterate evolve . groupFish . parseInput . head
  where
    totalDays = days + 1

partOne :: Solution
partOne = runEvolution 80

partTwo :: Solution
partTwo = runEvolution 256
