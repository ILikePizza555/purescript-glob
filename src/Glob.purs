module Glob (Pattern, glob, globCont) where

import Prelude

import Control.Monad.Cont.Trans (ContT(..))
import Data.Either (Either(..))
import Data.Function.Uncurried (Fn4, runFn4)
import Data.Options (Options, options)
import Effect (Effect)
import Foreign (Foreign, ForeignError)
import Glob.Options (GlobOptions)

type Pattern = String

type CallbackSignature = Either ForeignError (Array String)

foreign import globImpl
    :: Fn4 Pattern
           Foreign
           (ForeignError -> Effect Unit)
           (Array String -> Effect Unit)
           (Effect Unit)

-- Normal glob function. Takes a glob patters, an options object, and a callback.
glob :: Pattern 
     -> Options GlobOptions 
     -> (CallbackSignature -> Effect Unit) 
     -> Effect Unit
glob pattern opts k =
    runFn4 globImpl pattern (options opts) (k <<< Left) (k <<< Right)

-- Glob function wrapped in the ContT monad transformer
globCont :: Pattern
         -> Options GlobOptions
         -> ContT Unit Effect CallbackSignature
globCont pattern opts = ContT $ glob pattern opts