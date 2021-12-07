module Solutions.Day07 (solution) where

import Common (absDifference, fullRange, nthTriangle, splitOn)
import Solution

parseInput :: String -> [Int]
parseInput = map read . splitOn ','

-- | Calculate fuel costs for every possible position assuming 1 move = 1 fuel.
fuelCosts :: [Int] -> [Int]
fuelCosts l = map (\i -> sum $ map (absDifference i) l) $ fullRange l

-- | Calculate fuel costs for every possible position assuming fuel costs increase
-- over distance
expensiveFuelCosts :: [Int] -> [Int]
expensiveFuelCosts l = map (\i -> sum $ map (nthTriangle . absDifference i) l) $ fullRange l

solution :: Solution [Int]
solution =
  MkSol
    { mkParse = parseInput . head,
      mkPartOne = minimum . fuelCosts,
      mkPartTwo = minimum . expensiveFuelCosts
    }
