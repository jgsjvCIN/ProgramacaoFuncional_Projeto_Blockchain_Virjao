{-# LANGUAGE DeriveGeneric #-}

module Chain(
    Chain(..),
    insert
) where
    
    import Transaction
    import Block
    import Data.Aeson
    import GHC.Generics
    import qualified Data.ByteString.Lazy.Char8 as B

    type Chain = [Block]
    
    data BlockD = BlockD {
        block :: Block
    } deriving (Generic, Show)

    instance FromJSON BlockD
    instance ToJSON BlockD

    insert :: Block -> [Block] -> [Block]
    insert b l = b:l

    createAndInsert :: Transaction -> [Block] -> [Block]
    createAndInsert trans [] = insert (makeBlock trans 0) [] 
    createAndInsert trans l = insert (makeBlock trans (getHash (head l))) l

    printBlocks :: String -> [Block] -> [BlockD]
    printBlocks name list = map BlockD (getAll name list)

    main :: String -> [Block] -> IO ()
    main name list= B.putStrLn $ encode (printBlocks name list)