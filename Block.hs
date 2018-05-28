module Block(
    Block(..),
    getTransaction,
    getHash,
    makeHash,
    makeBlock
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