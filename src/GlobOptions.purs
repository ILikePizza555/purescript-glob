module Glob.Options where

import Data.Options (Option, Options(..), opt)

data GlobOptions

--| No options
noop :: Options GlobOptions
noop = Options []

--  The current working directory in which to search. Defaults to process.cwd().
cwd :: Option GlobOptions String
cwd = opt "cwd"

-- The place where patterns starting with / will be mounted onto. Defaults to path.resolve(options.cwd, "/") (/ on Unix systems, and C:\ or some such on Windows.)
root :: Option GlobOptions String
root = opt "root"

-- Include .dot files in normal matches and globstar matches. Note that an explicit dot in a portion of the pattern will always match dot files.
dot :: Option GlobOptions Boolean
dot = opt "dot"

-- By default, a pattern starting with a forward-slash will be "mounted" onto the root setting, so that a valid filesystem path is returned. Set this flag to disable that behavior.
nomount :: Option GlobOptions Boolean
nomount = opt "nomount"

-- Add a / character to directory matches. Note that this requires additional stat calls.
mark :: Option GlobOptions Boolean
mark = opt "mark"

-- Don't sort the results.
nosort :: Option GlobOptions Boolean
nosort = opt "nosort"

-- Set to true to stat all results. This reduces performance somewhat, and is completely unnecessary, unless readdir is presumed to be an untrustworthy indicator of file existence.
stat :: Option GlobOptions Boolean
stat = opt "stat"

-- When an unusual error is encountered when attempting to read a directory, a warning will be printed to stderr. Set the silent option to true to suppress these warnings.
silent :: Option GlobOptions Boolean
silent = opt "silent"

-- When an unusual error is encountered when attempting to read a directory, the process will just continue on in search of other matches. Set the strict option to raise an error in these cases.
strict :: Option GlobOptions Boolean
strict = opt "strict"

-- In some cases, brace-expanded patterns can result in the same file showing up multiple times in the result set. By default, this implementation prevents duplicates in the result set. Set this flag to disable that behavior.
nounique :: Option GlobOptions Boolean
nounique = opt "nounique"

-- Set to never return an empty set, instead returning a set containing the pattern itself. This is the default in glob(3).
nonull :: Option GlobOptions Boolean
nonull = opt "nonull"

-- Set to enable debug logging in minimatch and glob.
debug :: Option GlobOptions Boolean
debug = opt "debug"

-- Do not expand {a,b} and {1..3} brace sets.
nobrace :: Option GlobOptions Boolean
nobrace = opt "nobrace"

-- Do not match ** against multiple filenames. (Ie, treat it as a normal * instead.)
noglobstar :: Option GlobOptions Boolean
noglobstar = opt "noglobstar"

-- Do not match +(a|b) "extglob" patterns.
noext :: Option GlobOptions Boolean
noext = opt "noext"

-- Perform a case-insensitive match. Note: on case-insensitive filesystems, non-magic patterns will match by default, since stat and readdir will not raise errors.
nocase :: Option GlobOptions Boolean
nocase = opt "nocase"

-- Perform a basename-only match if the pattern does not contain any slash characters. That is, *.js would be treated as equivalent to **/*.js, matching all js files in all directories.
matchBase :: Option GlobOptions Boolean
matchBase = opt "matchBase"

-- Do not match directories, only files. (Note: to match only directories, simply put a / at the end of the pattern.)
nodir :: Option GlobOptions Boolean
nodir = opt "nodir"

-- Add a pattern or an array of glob patterns to exclude matches. Note: ignore patterns are always in dot:true mode, regardless of any other settings.
ignore :: Option GlobOptions (Array String)
ignore = opt "ignore"

-- Follow symlinked directories when expanding ** patterns. Note that this can result in a lot of duplicate references in the presence of cyclic links.
follow :: Option GlobOptions Boolean
follow = opt "follow"

-- Set to true to call fs.realpath on all of the results. In the case of a symlink that cannot be resolved, the full absolute path to the matched entry is returned (though it will usually be a broken symlink)
realpath :: Option GlobOptions Boolean
realpath = opt "realpath"

-- Set to true to always receive absolute paths for matched files. Unlike realpath, this also affects the values returned in the match event.
absolute :: Option GlobOptions Boolean
absolute = opt "absolute"