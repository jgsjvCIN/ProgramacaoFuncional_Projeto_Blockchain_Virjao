{-# LANGUAGE OverloadedStrings #-}
import Network.Wai
import Network.HTTP.Types
import Network.Wai.Handler.Warp (run)
import Chain

app :: Application
app :: Application
app req respond = if ((requestMethod req) == "POST") then
    createAndInsert trans list
    else if ((requestMethod req) == "GET")
        (respond $ responseLBS status200 [] "Hello World")

main :: IO ()
main = do
    putStrLn $ "http://localhost:8080/"
    run 8080 app