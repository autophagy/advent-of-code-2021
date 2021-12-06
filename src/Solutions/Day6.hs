module Solutions.Day6 (partOne, partTwo) where

import Common (splitOn)
import Control.Arrow ((&&&))
import Data.List
import qualified Data.Map as M
import Solution

parseInput :: String -> [Int]
parseInput = map read . splitOn ','

evolve :: M.Map Int Int -> M.Map Int Int
evolve = M.fromAscListWith (+) . sort . concatMap iterateFish . M.assocs

iterateFish :: (Int, Int) -> [(Int, Int)]
iterateFish (0, n) = [(6, n), (8, n)]
iterateFish (daysRemaining, n) = [(daysRemaining -1, n)]

groupFish :: [Int] -> M.Map Int Int
groupFish = M.fromList . map (head &&& length) . group . sort

runEvolution :: Int -> [String] -> Int
runEvolution days = sum . M.elems . last . take totalDays . iterate evolve . groupFish . parseInput . head
  where
    totalDays = days + 1

partOne :: Solution
partOne = runEvolution 80

partTwo :: Solution
partTwo = runEvolution 256
