main = do
    s <- getLine
    let result = evalTree (read s)
    print result

    
data Ops = SUM | MUL | SUB
           deriving (Read)
    
data IntTree = Nilt Int |
               Node Ops IntTree IntTree
               deriving (Read)
        
testTree = (Node SUM (Node MUL (Nilt 5) (Nilt 3)) (Node SUB (Nilt 10) (Nilt 5)))

evalTree :: IntTree -> Int
evalTree (Nilt value) = value
evalTree (Node SUM v1 v2) = evalTree v1 + evalTree v2
evalTree (Node MUL v1 v2) = evalTree v1 * evalTree v2
evalTree (Node SUB v1 v2) = evalTree v1 - evalTree v2