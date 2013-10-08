module Bob (responseFor) where

import Data.Char

isSilence = all isSpace
isYelling s = any isUpper s && (all isUpper $ filter isLetter s)
isQuestion = (== '?') . last
isIndifferent _ = True

responseFor s
  | isSilence s     = "Fine. Be that way!"
  | isYelling s     = "Woah, chill out!"
  | isQuestion s    = "Sure."
  | isIndifferent s = "Whatever."
