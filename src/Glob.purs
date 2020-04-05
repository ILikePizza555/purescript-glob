module Glob (GlobPatterns, GlobOptions, globImpl) where

import Prelude

import Data.Function.Uncurried (Fn4)
import Effect (Effect)
import Foreign (Foreign, ForeignError)

type GlobPatterns = Array String
type GlobOptions = Foreign

foreign import globImpl
    :: Fn4 GlobPatterns
           GlobOptions
           (ForeignError -> Effect Unit)
           (Array String -> Effect Unit)
           (Effect Unit)