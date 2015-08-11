module Test.Utils

fancyLine : Nat -> Char -> String
fancyLine l c = pack $ replicate l c

infoLine : String
infoLine = fancyLine 40 '-'

succLine : String
succLine = fancyLine 40 '='

errLine : String
errLine = fancyLine 40 '+'

heading : String -> String
heading n = unlines [infoLine, n, infoLine]

runTests : List (IO ()) -> IO ()
runTests Nil     = do putStrLn "All Tests have passed"; putStrLn succLine
runTests (t::ts) = do t; runTests ts
