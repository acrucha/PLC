main = do
       a <- getLine
       let result = alturaArvore (read a::Tree Int)
       print result

data Tree t = Node t (Tree t) (Tree t) 
              | Nilt
              deriving (Read)
              
alturaArvore :: Tree t -> Int
alturaArvore Nilt = 0 
alturaArvore (Node value subtree1 subtree2) = 1 + max (alturaArvore subtree1) (alturaArvore subtree2)