module Glob (Pattern, globImpl) where
import Prelude

import Data.Function.Uncurried (Fn4)
import Effect (Effect)
import Foreign (Foreign, ForeignError)

type Pattern = String

foreign import globImpl
    :: Fn4 Pattern
           Foreign
           (ForeignError -> Effect Unit)
           (Array String -> Effect Unit)
           (Effect Unit)

glob :: forall eff. Pattern -> Options GlobOptions