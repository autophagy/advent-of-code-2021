module Common
  ( slidingWindow,
    binaryToDecimal,
    splitOn,
    appendToLast,
    splitListBy,
    contains,
    (...),
    nthTriangle,
    fullRange,
    absDifference,
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

-- | Create a range from a to b and automatically deduce direction.
-- Similar to [a..b], except it works if a > b.
(...) :: Eq a => Num a => Enum a => a -> a -> [a]
a ... b
  | a == b = [a]
  | otherwise = [a, a + signum (b - a) .. b]

-- | Calculate the triangular number for n. 1 + 2 + 3 + ... + (n-1) + n
nthTriangle :: Int -> Int
nthTriangle n = div (n * n + n) 2

-- | Given a list of elements, return the full list between its upper and lower bounds
fullRange :: (Enum a, Ord a) => [a] -> [a]
fullRange a = [minimum a .. maximum a]

-- | Calculate the absolute difference between 2 numbers
absDifference :: Num a => a -> a -> a
absDifference a b = abs (a - b)
