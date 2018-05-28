module Chain(
    Chain(..),
    insert
) where
    
    import Transaction
    import Block

    type Chain = [Block]

    insert :: Block -> [Block] -> [Block]
    insert b l = b:l

    createAndInsert :: Transaction -> [Block] -> [Block]
    createAndInsert trans [] = insert (makeBlock trans 0) [] 
    createAndInsert trans l = insert (makeBlock trans (getHash (head l))) l