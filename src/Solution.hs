{-# LANGUAGE GADTs #-}

module Solution (Solution (..), WrappedSolution (..), runWrappedSolution) where

data Solution a = MkSol
  { mkParse :: [String] -> a,
    mkPartOne :: a -> Int,
    mkPartTwo :: a -> Int
  }

data WrappedSolution where
  MkWrappedSolution :: Solution a -> WrappedSolution

runWrappedSolution :: WrappedSolution -> [String] -> (Int, Int)
runWrappedSolution (MkWrappedSolution c) = runSolution c

runSolution :: Solution a -> [String] -> (Int, Int)
runSolution sol input = (mkPartOne sol parsed, mkPartTwo sol parsed)
  where
    parsed = mkParse sol input
