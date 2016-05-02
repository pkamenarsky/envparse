{-# LANGUAGE CPP #-}
#if __GLASGOW_HASKELL__ < 710
module Main (main) where

main :: IO ()
main =
  return ()
#else
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeOperators #-}
module Main (main) where

import Env
import Env.Generic


data Hello = Hello
  { name  :: String ? "Whom shoud I greet?"
  , count :: Int    ? "How many times to greet them?"
  , quiet :: Bool   ? "Should I be quiet instead?"
  } deriving (Show, Eq, Generic)

instance Record Error Hello

main :: IO ()
main = do
  hello <- Env.parse (header "envparse example") record
  print (hello :: Hello)
#endif
