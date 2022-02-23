-- DIKASTIS -- Estatísticas da fatura do cartão

import Data.Char

main = do
    a <- getLine
    let result = minMaxCartao a
    print result

toDouble :: [String] -> [Double]
toDouble (a:as) = [read x :: Double | x <- (a:as)]

store :: String -> String
store (a:as) | a /= ';'  = (a:store as)
             | otherwise = ""

filtro :: String -> Int -> [String]
filtro [] x = []
filtro (a:as) x | a == ';'  = filtro as (x+1)
                | x == 3    = (store str : filtro as 0)
                | otherwise = filtro as x
    where 
        str = (a:as)

addPV :: String -> String
addPV str = ";" ++ str

maiorEmenor :: [Double] -> (Double, Double)
maiorEmenor [] = (0,0)
maiorEmenor [x] = (x,x)
maiorEmenor (x:xs) = (min x (fst (maiorEmenor xs)), max x (snd (maiorEmenor xs)))

minMaxCartao :: String -> (Double, Double)
minMaxCartao [] = (0,0)
minMaxCartao str = maiorEmenor newStr
    where 
        addPV = ";" ++ str
        newStr = toDouble (filtro addPV 0)