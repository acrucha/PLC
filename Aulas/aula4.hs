-- * ANOTAÇÕES AULA 4 - PLC

-- CASAMENTO DE PADRÕES => permite utilizar padrões no lugar de variáveis na definição de funções (em ordem textual)
-- apenas construtores podem fazer casamentos de padrões
-- os padrões mais específicos devem ser postos primeiro, já que haskell leva em conta a ordem textual
-- todos os devem ter o mesmo tipo
-- por exemplo: 
sumList :: [Int] -> Int
sumList [] = 0 -- se a lista for vazia, retorne zero.
sumList (i:list) = i + sumList list -- se a lista tem head e tail (não é vazia), então faça a ação.

-- retorna o maior elemento da lista
maiorLista :: [Int] -> Int
maiorLista [] = minBound :: Int
maiorLista [x] = x -- ou poderia escrever: x:[] = x (tanto faz) -- head qualquer e cauda vazia
maiorLista (x:xs) | x > maiorLista xs = x
                  | otherwise         = maiorLista xs

-- dobrar todos os elementos da lista
double :: [Int] -> [Int]
double [] = []
double (a:as) = (a*2):double as

digits :: String -> String
digits [] = []
digits (ch:chs) | isDigit ch = ch : digits chs
                | otherwise  = digits chs
  where 
    isDigit ch' = ch' >= '0' && ch' <= '9'

-- somar os elementos de duas listas
sumPairs :: [Int]->[Int]->[Int]
-- sumPairs []  [] = []
sumPairs []  ys = []
sumPairs xs  [] = []
sumPairs (x:xs) (y:ys) = (x+y) : sumPairs xs ys

-- CASE -> tipo o switch -> usa casamento de padrões 
firstDigit :: String -> Char 
firstDigit st = case (digits st) of
                  []     -> '\0'
                  (a:as) -> a

--QUICK SORT SEM TUPLA
                  
greaterThan :: Int -> [Int] -> [Int]
greaterThan x [] = []
greaterThan x (a:as) | x <= a    = a : (greaterThan x as)
                     | otherwise = greaterThan x as

lessThan :: Int -> [Int] -> [Int]
lessThan x [] = []
lessThan x (a:as) | x > a     = a : (lessThan x as)
                  | otherwise = lessThan x as

quickSort :: [Int] -> [Int]
quickSort [] = []
quickSort (a:as) = quickSort (lessThan a as) ++ [a] ++ quickSort (greaterThan a as)


