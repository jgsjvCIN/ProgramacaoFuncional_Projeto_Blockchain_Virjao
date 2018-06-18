{-# LANGUAGE OverloadedStrings #-}
import Network.Wai
import Network.HTTP.Types
import Network.Wai.Handler.Warp (run)
import Chain

app :: Application
app req respond = if ((requestMethod req) == "POST") then
    let query = queryString req :: [(ByteString, Maybe ByteString)]
        payerParam = join $ lookup "payer" query :: Maybe ByteString
        receiverParam = join $ lookup "receiver" query :: Maybe ByteString
        valueParam = join $ lookup "value" query :: Maybe ByteString
        listParam = join $ lookup "list" query :: Maybe ByteString
        postReturn = createAndInsert (payerParam , receiverParam , valueParam) listParam
    in responseLBS status200 [(hContentType, "application/json")] postReturn
    else if ((requestMethod req) == "GET")
        let query = queryString req :: [(ByteString, Maybe ByteString)]
            nameParam = join $ lookup "name" query :: Maybe ByteString
            listParam = join $ lookup "list" query :: Maybe ByteString
            getReturn = getInfo nameParam listParam
        in responseLBS status200 [(hContentType, "application/json")] getReturn

main :: IO ()
main = do
    putStrLn $ "http://localhost:8080/"
    run 8080 app