module Bob (responseFor) where

import Data.Char

isSilence = all isSpace
isYelling s = (any isUpper s) && (not $ any isLower s)
isQuestion = (== '?') . last

responseFor s
  | isSilence s  = "Fine. Be that way!"
  | isYelling s  = "Woah, chill out!"
  | isQuestion s = "Sure."
  | otherwise    = "Whatever."
