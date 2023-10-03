let vimfiles=$HOME . "/.vim"

if has("win32") || has("win64")
  let windows=1
  let sep=";"
else
  let windows=0
  let sep=":"
endif

let classpath = join(
\[".",
\ "src", "src/main/clojure", "src/main/resources",
\ "test", "src/test/clojure", "src/test/resources",
\ "classes", "target/classes",
\ "lib/*", "lib/dev/*",
\ "bin",
\ vimfiles."/lib/*"
\], sep)

