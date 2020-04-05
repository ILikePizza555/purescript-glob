# purescript-glob

This is a purescript binding for the `glob` npm package.

This package uses [purescript-options](https://github.com/purescript-contrib/purescript-options) to handle options and [purescript-aff](https://github.com/purescript-contrib/purescript-aff) for monadic asynchronous handling.

# Usage

Usage is pretty simple, currently only one function is exported:

```
glob :: Pattern -> Options GlobOptions -> Aff (Array String)
```

The following is a simple example of using glob with the default options:

```
import Glob (glob)
import Glob.Options (noop)
import Effect.Class.Console (log)

main :: Effect Unit
main = launchAff do
    result <- glob "your pattern" noop
    log <<< show $ result
```

To pass in options, just construct an options monad:

```
import Data.Options ((:=))
import Glob (glob)
import Glob.Options (cwd, dot)
import Effect.Class.Console (log)

main :: Effect Unit
main = launchAff do
    result <- glob "your pattern" $
        cwd := "~" <> -- Change the working directory to "~"
        dot := true -- Show dotfiles in result
    log <<< show $ result
```

The full list of options can be found in src/GlobOptions.purs

# Roadmap

- Export side function of the glob package