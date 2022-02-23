-- DIKASTIS -- Binário para inteiro

main = do
    s <- getLine
    let result = btoi s
    print result

btoi :: String -> Int
btoi [] = 0
btoi (a:as) | a == '0'  = btoi as
            | otherwise = 2^(l) + btoi as
    where l = length as