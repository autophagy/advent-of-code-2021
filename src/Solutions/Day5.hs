module Solutions.Day5 (partOne, partTwo) where

import Common ((...), splitOn)
import Data.List (group, sort)
import Solution

data Coordinate = Coordinate Int Int deriving (Eq, Show, Ord)

type Line = [Coordinate]

-- | Create a horizontal or vertical line between 2 coordinates, returning an
-- empty list otherwise.
createLine :: Coordinate -> Coordinate -> Line
createLine (Coordinate x1 y1) (Coordinate x2 y2)
  | x1 == x2 = map (Coordinate x1) $ y1...y2
  | y1 == y2 = map (`Coordinate` y1) $ x1...x2
  | otherwise = []

-- | As above, but also take into account diagonal lines.
createLineDiag :: Coordinate -> Coordinate -> Line
createLineDiag (Coordinate x1 y1) (Coordinate x2 y2)
  | x1 == x2 = map (Coordinate x1) $ y1...y2
  | y1 == y2 = map (`Coordinate` y1) $ x1...x2
  | abs (x1 - x2) == abs (y1 - y2) = zipWith Coordinate (x1...x2) (y1...y2)
  | otherwise = []

parseInput :: [String] -> [(Coordinate, Coordinate)]
parseInput l = coords
  where
    splitLines = map words l
    coords = map (\a -> (parseCoordinate $ head a, parseCoordinate $ last a)) splitLines

parseCoordinate :: String -> Coordinate
parseCoordinate s = Coordinate x y
  where
    splitS = splitOn ',' s
    x = read $ head splitS
    y = read $ last splitS

partOne :: Solution
partOne = length . filter (>= 2) . map length . group . sort . concatMap (uncurry createLine) . parseInput

partTwo :: Solution
partTwo = length . filter (>= 2) . map length . group . sort . concatMap (uncurry createLineDiag) . parseInput
