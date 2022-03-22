main = do
       a <- getLine
       b <- getLine
       let result = insertList (read a::Tree Int) (read b)
       print result

data Tree t = Nilt |
              Node t (Tree t) (Tree t)
              deriving (Read, Show)       

addToTree :: Ord t => t -> Tree t -> Tree t
addToTree v Nilt = (Node v (Nilt) (Nilt))
addToTree v (Node v1 subTree1 subTree2) | v > v1 = (Node v1 subTree1 (addToTree v subTree2))
                                        | otherwise = (Node v1 (addToTree v subTree1) subTree2)

insertList :: Ord t => Tree t -> [t] -> Tree t
insertList tree [] = tree
insertList tree (a:as) = insertList (addToTree a tree) as  
