{-# LANGUAGE DataKinds #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE TypeOperators #-}

module Main where

import Servant
import Data.Text

main :: IO ()
main = putStrLn "hello world"

type AuthApi = "test" :> Get '[JSON] Text
          :<|> "auth" :> Get '[JSON] Text
          :<|> "barr" :> Get '[JSON] Text

authApi :: Proxy AuthApi
authApi = Proxy

server = noAuthentication :<|> authPoint :<|> forbidden

noAuthentication = return "Lol"

authPoint = return "auth but okay"

forbidden = return "forbidden!"

app = serve authApi server
