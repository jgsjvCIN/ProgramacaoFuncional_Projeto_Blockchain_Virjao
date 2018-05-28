module Transaction(
    Transaction(..),
    getPayer,
    getReceiver,
    getValue
) where
   
    type Transaction = (String, String, Double)

    getPayer :: Transaction -> String
    getPayer ( p , _ , _ ) = p

    getReceiver :: Transaction -> String
    getReceiver ( _ , r , _ ) = r

    getValue :: Transaction -> Double
    getValue ( _ , _ , v ) = v