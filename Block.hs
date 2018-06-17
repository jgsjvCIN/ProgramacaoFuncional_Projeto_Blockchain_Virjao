module Block(
    Block(..),
    Hash(..),
    getTransaction,
    getHash,
    makeHash,
    makeBlock,
    getBlockPayer,
    getBlockReceiver,
    isIn,
    getAll
) where

    import Transaction
    import Data.Hashable
    
    type Hash = Int
    type Block = (Transaction, Hash)

    getTransaction :: Block -> Transaction
    getTransaction ( t , _ ) = t

    getHash :: Block -> Hash
    getHash ( _ , h ) = h 

    makeHash :: Transaction -> Hash -> Hash
    makeHash (p, r, v) h = hash (p ++ r ++ (show v) ++ (show h))

    makeBlock :: Transaction -> Hash -> Block
    makeBlock trans 0 = (trans, (makeHash trans 0) )
    makeBlock trans hash = (trans, (makeHash trans hash))

    getBlockPayer :: Block -> String
    getBlockPayer (trans,hash) = getPayer trans

    getBlockReceiver :: Block -> String
    getBlockReceiver (trans,hash) = getReceiver trans
    
    isIn :: Block -> String -> Bool
    isIn block name = if ((getBlockPayer block) == name || (getBlockReceiver block) == name)
        then
            True
        else
            False

    getAll :: String -> [Block] -> [Block]
    getAll _ [] = []
    getAll name list = [y | y <- [(head list)], isIn (head list) name] ++ getAll name (tail list)