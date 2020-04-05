{-
Welcome to a Spago project!
You can edit this file as you like.
-}
{ name = "purescript-glob"
, dependencies =
  [ "aff"
  , "arrays"
  , "console"
  , "effect"
  , "foreign"
  , "functions"
  , "options"
  , "psci-support"
  , "spec"
  ]
, packages = ./packages.dhall
, sources = [ "src/**/*.purs", "test/**/*.purs" ]
, license = "Apache 2.0"
, repository = "https://github.com/ILikePizza555/purescript-glob"
}
