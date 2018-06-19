{-# LANGUAGE OverloadedStrings #-}
import Control.Applicative ((<$>))
import Control.Monad
import Network.Wai
import Network.Wai.Handler.Warp
import Network.HTTP.Types
import Network.HTTP.Types.Header (hContentType)
import Data.ByteString (ByteString)
import Data.Text
import Data.Text.Encoding
import Data.Maybe
import Chain

getParam :: Request -> ByteString -> (Maybe ByteString)
getParam req param = join (lookup param (queryString req))

-- Talvez seja bom substituir o fromJust
getQueryText :: Request -> ByteString -> Text
getQueryText req param = decodeUtf8 (fromJust (getParam req param))

main :: IO()
main = do
    let port = 3000
    putStrLn $ "Listening on port " ++ show port
    run port app

app :: Application
app req func = do
    let nameP = unpack (getQueryText req "name")
        listP = unpack (getQueryText req "list")
        in responseBuilder
        status200
        [(hContentType, "text/plain")]
        $ fromString $ "Query parameter: "