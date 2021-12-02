import System.IO

readInput :: String -> IO [Integer]
readInput fileName = do
  handle <- openFile fileName ReadMode
  contents <- hGetContents handle
  pure $ map read (lines contents)

numOfIncreases :: [Integer] -> Int
numOfIncreases a = length . filter (\(a, b) -> b > a) $ zip a (drop 1 a)

slidingWindow :: Int -> [a] -> [[a]]
slidingWindow i xs
  | length xs < i = []
  | otherwise     = take i xs : slidingWindow i (tail xs)

main :: IO ()
main = do
  nums <- readInput "input.txt"
  let a = numOfIncreases nums
  putStrLn $ "Part One answer: " ++ show a
  let b = numOfIncreases . map sum $ slidingWindow 3 nums
  putStrLn $ "Part Two answer: " ++ show b
