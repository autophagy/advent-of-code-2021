import Data.Maybe (mapMaybe)
import System.IO (IOMode (..), hGetContents, openFile)

data Movement = Forward Int | Down Int | Up Int

data Position = Position Int Int Int

readInput :: String -> IO [Movement]
readInput fileName = do
  handle <- openFile fileName ReadMode
  contents <- hGetContents handle
  pure $ mapMaybe (parseMovement . words) (lines contents)

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

main :: IO ()
main = do
  movements <- readInput "input.txt"

  let (Position horizontal depth _) = foldl adjustPositionA (Position 0 0 0) movements
  putStrLn $ "Puzzle 1: " ++ show (horizontal * depth)

  let (Position horizontal depth _) = foldl adjustPositionB (Position 0 0 0) movements
  putStrLn $ "Puzzle 2: " ++ show (horizontal * depth)
