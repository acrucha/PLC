main = do
    a <- getLine
    b <- getLine
    let result = logMes a b
    print result

store :: String -> String
store (a:as) | a /= ';'  = (a:store as)
             | otherwise = ""

achaValor :: String -> Int -> Double
achaValor [] x = 0
achaValor (a:as) x | a == ';'  = achaValor as (x+1)
                   | x == 2    = read (store str) :: Double 
                   | otherwise = achaValor as x
    where 
        str = (a:as)

lista :: String -> String -> [Double]
lista "" "" = []
lista mes (a:b:c:as) | as == []       = []
                     | [a,b,c] == mes = (achaValor as 0 : lista mes as)
                     | otherwise      = lista mes (b:c:as)

logMes :: String -> String -> Double
logMes mes str = foldl (+) 0 (lista mes str)
