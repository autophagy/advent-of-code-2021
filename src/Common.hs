module Common
  ( slidingWindow,
    binaryToDecimal,
    splitOn,
    appendToLast,
    splitListBy,
    contains,
    reversableRange,
  )
where

import Data.Bool (bool)
import Data.List (intersect)

-- | Create a sliding window over a list of a given length
slidingWindow :: Int -> [a] -> [[a]]
slidingWindow i xs
  | length xs < i = []
  | otherwise = take i xs : slidingWindow i (tail xs)

-- | Convert a binary number, as a list of booleans, to an integer value
binaryToDecimal :: [Bool] -> Int
binaryToDecimal = foldl (\a -> (+) (2 * a) . bool 0 1) 0

-- | Split a string by a delimiter character, dropping the delimiter.
splitOn :: Char -> String -> [String]
splitOn c s = case dropWhile (== c) s of
  "" -> []
  s' -> w : splitOn c s''
    where
      (w, s'') = break (== c) s'

-- | Append an element to the last member of a list of lists.
appendToLast :: [[a]] -> a -> [[a]]
appendToLast xs x = init xs ++ [last xs ++ [x]]

-- | Group a set of a by an element, dropping that element.
splitListBy :: Eq a => a -> [a] -> [[a]]
splitListBy a s = splitListBy_ a s [[]]

splitListBy_ :: Eq a => a -> [a] -> [[a]] -> [[a]]
splitListBy_ _ [] p = p
splitListBy_ a (x : xs) p
  | x == a = splitListBy_ a xs (p ++ [[]])
  | otherwise = splitListBy_ a xs (appendToLast p x)

-- | Determine whether b contains all elements of a
contains :: Ord a => [a] -> [a] -> Bool
contains a b = intersect b a == b

reversableRange :: Num a => Enum a => a -> a -> [a]
reversableRange a b = [a, a + signum (b - a)..b]
