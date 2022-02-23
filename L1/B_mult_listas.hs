-- DIKASTIS -- Multiplicação de listas

main = do
    sa <- getLine
    let a = read sa :: [Int]
    sb <- getLine
    let b = read sb :: [Int]
    let result = mul2 a b
    print result

listZero :: Int -> [Int]
listZero dif = [0 | x <- [1..dif]]

difLen :: [Int] -> [Int] -> Int
difLen l1 l2 = maxLen - minLen
    where
        minLen = min (length l1) (length l2)  
        maxLen = max (length l1) (length l2)  

multiLista :: [Int] -> [Int] -> [Int]
multiLista [] []     = []
multiLista (a:as) [] = []
multiLista [] (b:bs) = []
multiLista (a:as) (b:bs) = (a*b:multiLista as bs)


mul2 :: [Int] -> [Int] -> [Int]
mul2 l1 l2 | l /= 0    = multiLista l1 l2 ++ listZero l
           | otherwise = multiLista l1 l2
    where 
        l = difLen l1 l2

