{-# LANGUAGE OverloadedStrings #-}
import Network.Wai
import Network.HTTP.Types
import Network.Wai.Handler.Warp (run)

app :: Application
app :: Application
app req respond = if ((requestMethod req) = "POST") then
    createAndInsert somehow
    else if ((requestMethod req) = "GET")
        IhaveNoIdea

main :: IO ()
main = do
    putStrLn $ "http://localhost:8080/"
    run 8080 app