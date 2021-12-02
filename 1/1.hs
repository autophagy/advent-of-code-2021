import System.IO

readInput :: String -> IO [Integer]
readInput fileName = do
  handle <- openFile fileName ReadMode
  contents <- hGetContents handle
  pure $ map read (lines contents)

numOfIncreases :: [Integer] -> Int
numOfIncreases a = length . filter (\(a, b) -> b > a) $ zip a (drop 1 a)

rollingWindowSum :: [Integer] -> [Integer]
rollingWindowSum a = zipWith3 (\a b c -> a + b + c) a (drop 1 a) (drop 2 a)

main :: IO ()
main = do
  nums <- readInput "input.txt"
  let a = numOfIncreases nums
  putStrLn $ "Part One answer: " ++ show a
  let b = numOfIncreases $ rollingWindowSum nums
  putStrLn $ "Part Two answer: " ++ show b
