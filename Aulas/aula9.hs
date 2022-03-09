-- * ANOTAÇÕES AULA 9 - PLC

-- ! Árvore sem valor de folha

data Tree t = Leaf |
              Node t (Tree t) (Tree t)
              deriving (Eq, Show)

testTree = Node 5 (Node 6 Leaf (Node 3 Leaf Leaf))
                  (Node 2 (Node 7 Leaf Leaf) (Node 88 Leaf (Node 3 Leaf Leaf)))

depth :: Tree t -> Int
depth Leaf = 0 
depth (Node value subtree1 subtree2) = 1 + max (depth subtree1) (depth subtree2)

collapse :: Tree t -> [t]
collapse Leaf = []
collapse (Node value subtree1 subtree2) = value : (collapse subtree1 ++ collapse subtree2)

mapTree :: (t -> u) -> Tree t -> Tree u
mapTree f Leaf = Leaf
mapTree f (Node value subtree1 subtree2) = Node (f value) (mapTree f subtree1) (mapTree f subtree2)

-- ! Árvore com valor de folha

data Tree2 t = Leaf2 t 
             | Node2 (Tree2 t) (Tree2 t)
               deriving (Eq, Show)

testTree2 = Node2 (Node2 (Leaf2 3) (Leaf2 55))
                  (Node2 (Node2 (Leaf2 33) (Node2 (Leaf2 22) (Leaf2 21))) (Leaf2 4))

depth2 :: Tree2 t -> Int
depth2 (Leaf2 value) = 1
depth2 (Node2 subtree1 subtree2) = 1 + max (depth2 subtree1) (depth2 subtree2)

collapse2 :: Tree2 t -> [t]
collapse2 (Leaf2 value) = [value]
collapse2 (Node2 subtree1 subtree2) = collapse2 subtree1 ++ collapse2 subtree2

mapTree2 :: (t -> u) -> Tree2 t -> Tree2 u
mapTree2 f (Leaf2 value) = Leaf2 (f value)
mapTree2 f (Node2 subtree1 subtree2) = Node2 (mapTree2 f subtree1) (mapTree2 f subtree2)

-- sumOfTree :: Tree2 t -> Int
-- sumOfTree t1 = foldr (+) 0 (collapse2 t1)