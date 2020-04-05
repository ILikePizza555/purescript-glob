module Test.Main where

import Glob
import Prelude

import Data.Function.Uncurried (runFn4)
import Effect (Effect)
import Effect.Class.Console (log)
import Foreign (unsafeToForeign)

main :: Effect Unit
main = do
  log "Testing impl"
  
  runFn4 globImpl "*" (unsafeToForeign unit) (log <<< show) (log <<< show)