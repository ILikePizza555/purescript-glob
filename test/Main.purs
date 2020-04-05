module Test.Main where

import Prelude

import Data.Options ((:=))
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class.Console (log)
import Glob (glob)
import Glob.Options (dot, nodir, noop)
import Test.Spec (describe, it)
import Test.Spec.Assertions (shouldEqual)
import Test.Spec.Reporter (consoleReporter)
import Test.Spec.Runner (runSpec)

main :: Effect Unit
main = launchAff_ $ runSpec [consoleReporter] do
    describe "glob" do
        it "runs a wildcard with no options" do
            result <- glob "*" noop
            result `shouldEqual` ["node_modules","output","package-lock.json","packages.dhall","spago.dhall","src","test"]
        it "can pass options" do
            result <- glob "*.@(gitignore|json|dhall)" $ 
                dot := true <>
                nodir := true
            log <<< show $ result
            result `shouldEqual` [".gitignore", "package-lock.json", "packages.dhall", "spago.dhall"]
