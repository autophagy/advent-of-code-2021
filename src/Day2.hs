module Day2 (partOne, partTwo) where

import Data.Maybe (mapMaybe)
import Solution

data Movement = Forward Int | Down Int | Up Int

data Position = Position Int Int Int

parseMovement :: [String] -> Maybe Movement
parseMovement ("forward" : n : _) = Just . Forward $ read n
parseMovement ("down" : n : _) = Just . Down $ read n
parseMovement ("up" : n : _) = Just . Up $ read n
parseMovement _ = Nothing

adjustPositionA :: Position -> Movement -> Position
adjustPositionA (Position horizontal depth aim) movement =
  case movement of
    Forward n -> Position (horizontal + n) depth aim
    Down n -> Position horizontal (depth + n) aim
    Up n -> Position horizontal (depth - n) aim

adjustPositionB :: Position -> Movement -> Position
adjustPositionB (Position horizontal depth aim) movement =
  case movement of
    Forward n -> Position (horizontal + n) (depth + (aim * n)) aim
    Down n -> Position horizontal depth (aim + n)
    Up n -> Position horizontal depth (aim - n)

finalDepth :: Position -> Int
finalDepth (Position h d _) = h * d

partOne :: Solution
partOne = finalDepth . foldl adjustPositionA (Position 0 0 0) . mapMaybe (parseMovement . words)

partTwo :: Solution
partTwo = finalDepth . foldl adjustPositionB (Position 0 0 0) . mapMaybe (parseMovement . words)
