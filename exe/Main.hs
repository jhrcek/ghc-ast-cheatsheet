module Main where

import Language.Haskell.GHC.ExactPrint.Utils (showAst)
import Language.Haskell.GHC.ExactPrint (parseModule)
import GHC.Paths (libdir)
import GHC.Utils.Outputable

main :: IO ()
main = do
  res <- parseModule libdir "src/Language/Haskell/Syntax/Pat/Example.hs"
  case res of
    Left err -> putStrLn $ showSDocUnsafe $ ppr err
    Right parsedSource ->
      putStrLn $ showAst parsedSource

