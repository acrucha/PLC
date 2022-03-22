-- * ANOTAÇÕES AULA 11 - PLC
-- * Resolução da prova de 2017.1

-- ! Checar se uma lista está ordenada:

isSorted :: Ord t => [t] -> Bool
isSorted [] = True
isSorted [x] = True
isSorted (x:xs) | x <= head xs = isSorted xs
                | otherwise = False

-- ! Bubble-sort

bubble :: Ord t => [t] -> [t]
bubble [] = []
bubble [x] = [x]
bubble (x:next:xs) | x > next = next : bubble (x:xs)
                   | otherwise = x : bubble (next:xs)

bubbleSort :: Ord t => [t] -> [t]
bubbleSort list | isSorted list = list
                | otherwise = bubbleSort (bubble list)

-- ! Checar se a árvore está ordenada => se é uma árvore binária

data Tree t = Leaf t 
            | Node t (Tree t) (Tree t)
            deriving (Eq, Show)

sortedTree :: Tree Int
sortedTree = Node 10 (Node 5 (Leaf 3) (Leaf 6)) (Node 15 (Leaf 14) (Leaf 17))

unsortedTree :: Tree Int
unsortedTree = Node 10 (Node 5 (Leaf 3) (Leaf 6)) (Node 15 (Leaf 16) (Leaf 17))

turnIntoList :: Tree t -> [t]
turnIntoList (Leaf v) = [v]
turnIntoList (Node v st1 st2) = v : (turnIntoList st1 ++ turnIntoList st2)

-- allGT ==> all greater than
allGT :: Ord t => t -> Tree t -> Bool
allGT v (Leaf v1) = v1 > v
allGT v tree | minimum (turnIntoList tree) > v = True
             | otherwise = False

-- allLET ==> all less or equal than
allLET :: Ord t => t -> Tree t -> Bool
allLET v (Leaf v1) = v1 <= v
allLET v tree | maximum (turnIntoList tree) <= v = True
              | otherwise = False

isSortedTree :: Ord t => Tree t -> Bool
isSortedTree (Leaf v) = True
isSortedTree (Node v st1 st2) | allLET v st1 && allGT v st2 = isSortedTree st1 && isSortedTree st2
                              | otherwise = False
