-- ------------------------------------------------------------- [ Parsing.idr ]
-- Module    : Parsing.idr
-- Copyright : (c) Jan de Muijnck-Hughes
-- License   : see LICENSE
-- --------------------------------------------------------------------- [ EOH ]

module Test.Parsing

import public Lightyear
import public Lightyear.Strings

import public Test.Utils

%access public

||| Run an parse test that is expected to pass.
|||
||| @title Optional Test title
||| @p     The parser to be testing
||| @inStr The given string to parse
||| @exp   The expected result of parsing `inStr` using `p`
||| @tFunc The testing function to compare the results.
parseTestG : Show a => (title : Maybe String)
                   -> (p : Parser a)
                   -> (inStr : String)
                   -> (exp : a)
                   -> (tFunc : a -> a -> Bool)
                   -> IO ()
parseTestG title p inStr exp eq = do
  putStrLn $ unwords ["Test:", fromMaybe "Unnamed Test" title]
  case parse p inStr of
    Left err  => with List do
         putStrLn $ unlines [
               errLine
             , "Unexpected Parse Error:\n"
             , err
             , errLine
             ]
    Right res => do
      if eq res exp
        then pure ()
        else with List
           putStrLn $ unlines [
                 errLine
               , "Error:\n"
               , "Given:"
               , "\t" ++ show inStr
               , "Made"
               , "\t" ++ show res
               , "Expected:"
               , "\t" ++ show exp
               , errLine
               ]

||| Run an parse test that is expected to fail.
|||
||| @title Optional Test title
||| @p     The parser to be testing
||| @inStr The given string to parse
parseTestB : Show a => (title : Maybe String)
                   -> (p : Parser a)
                   -> (inStr : String)
                   -> IO ()
parseTestB title p inStr = do
  putStrLn $ unwords ["Begin Test:", fromMaybe "Unnamed Test" title]
  case parse p inStr of
    Left err  => pure ()
    Right res => with List
        putStrLn $ unlines [
                 errLine
               , "Error:\n"
               , "Given:"
               , "\t" ++ show inStr
               , "Was expected to fail"
               , errLine
               ]

|||
||| @title Optional Test title
||| @p     The parser to be testing
||| @inStr The given string to parse
canParse : Show a => (title : Maybe String)
                   -> (p : Parser a)
                   -> (inStr : String)
                   -> IO ()
canParse title p inStr = do
  putStrLn $ unwords ["Begin Test:", fromMaybe "Unnamed Test" title]
  case parse p inStr of
    Left err  => with List do
         putStrLn $ unlines [
               errLine
             , "Unexpected Parse Error:\n"
             , err
             , errLine
             ]
    Right res => pure ()
-- --------------------------------------------------------------------- [ EOF ]
