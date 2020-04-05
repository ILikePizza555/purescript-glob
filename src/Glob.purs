module Glob (Pattern, glob) where

import Prelude

import Data.Function.Uncurried (Fn2, runFn2)
import Data.Options (Options, options)
import Effect.Aff (Aff)
import Effect.Aff.Compat (EffectFnAff, fromEffectFnAff)
import Foreign (Foreign) 
import Glob.Options (GlobOptions)

type Pattern = String

foreign import globImpl
    :: Fn2 Pattern Foreign (EffectFnAff (Array String))

glob :: Pattern -> Options GlobOptions -> Aff (Array String)
glob pattern opts = fromEffectFnAff $ runFn2 globImpl pattern (options opts)