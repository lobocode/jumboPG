{-# LANGUAGE OverloadedStrings #-}

module Main where

import Web.Scotty
import Data.Text.Lazy.Encoding (encodeUtf8)
import Data.Text.Lazy (fromStrict)
import qualified Data.Text as T
import qualified Data.ByteString.Char8 as BS

import qualified PostgresConf as PC

main :: IO ()
main = scotty 3000 $ do
  get "/" $ file "index.html"
  post "/generate-conf" $ do
    params <- paramsToList <$> params
    let dbVersion = getParam "db-version" params
        osType = getParam "os-type" params
        dbType = getParam "db-type" params
        totalMemoryRam = getParamAsInt "total-memory-ram" params
        numberOfCPUs = getParamAsInt "number-of-cpus" params
        numberOfConnections = getParamAsInt "number-of-connections" params
        dataStorage = getParam "data-storage" params
        conf = PC.generateConf dbVersion osType dbType totalMemoryRam numberOfCPUs numberOfConnections dataStorage
    setHeader "Content-Type" "text/plain"
    raw $ encodeUtf8 $ fromStrict conf

getParam :: T.Text -> [(T.Text, T.Text)] -> T.Text
getParam paramName params =
  case lookup paramName params of
    Just paramValue -> paramValue
    Nothing -> ""

getParamAsInt :: T.Text -> [(T.Text, T.Text)] -> Int
getParamAsInt paramName params =
  case lookup paramName params of
    Just paramValue -> read $ T.unpack paramValue
    Nothing -> 0

paramsToList :: [(a, Maybe b)] -> [(a, b)]
paramsToList = foldr addParam []
  where
    addParam (_, Nothing) acc = acc
    addParam (paramName, Just paramValue) acc = (paramName, paramValue) : acc
