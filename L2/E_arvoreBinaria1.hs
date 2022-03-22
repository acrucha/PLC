main = do
       s <- getLine
       let result = isBST (read s::Tree Int)
       print result

data Tree t = Nilt
            | Node t (Tree t) (Tree t)
              deriving (Read)

turnIntoList :: Tree t -> [t]
turnIntoList Nilt = []
turnIntoList (Node v st1 st2) = v : (turnIntoList st1 ++ turnIntoList st2)

-- allGT ==> all greater than
allGT :: Ord t => t -> Tree t -> Bool
allGT v Nilt = True
allGT v tree | minimum (turnIntoList tree) > v = True
             | otherwise = False

-- allLT ==> all less than
allLT :: Ord t => t -> Tree t -> Bool
allLT v Nilt = True
allLT v tree | maximum (turnIntoList tree) < v = True
             | otherwise = False

isBST :: Ord t => Tree t -> Bool
isBST Nilt = True
isBST (Node v st1 st2) | allLT v st1 && allGT v st2 = isBST st1 && isBST st2
                       | otherwise = False
