{-# LANGUAGE DeriveGeneric #-}

module Chain(
    Chain(..),
    insert,
    createAndInsert,
    createInfoObj,
    listInfo,
    getInfo
) where
    
    import Transaction
    import Block
    import Data.Aeson
    import GHC.Generics
    import qualified Data.ByteString.Lazy.Char8 as B

    type Chain = [Block]
    
    data Info = Info {
        payer :: String,
        receiver :: String,
        value :: Double
    } deriving (Generic, Show)

    instance FromJSON Info
    instance ToJSON Info

    insert :: Block -> [Block] -> [Block]
    insert b l = b:l

    createAndInsert :: Transaction -> [Block] -> [Block]
    createAndInsert trans [] = insert (makeBlock trans 0) [] 
    createAndInsert trans l = insert (makeBlock trans (getHash (head l))) l

    createInfoObj:: Block -> Info
    createInfoObj ((p , r, v), hash) = Info p r v

    listInfo :: String -> [Block] -> [Info]
    listInfo name list = map createInfoObj (getAll name list)

    getInfo :: String -> [Block] -> IO ()
    getInfo name list= B.putStrLn $ encode (listInfo name list)

    -- [(("San","Al",4.0),-2416514153299201292),(("Al","Bet",3.0),-6711607388473116096),(("Al","San",2.0),8173646634568268900)]