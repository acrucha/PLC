-- DIKASTIS -- Detecção de Réplica

main = do
    a <- getLine
    b <- getLine
    c <- getChar
    let result = isReplica a (read b) c
    print result

isReplica :: String -> Int -> Char -> Bool
isReplica [] 0 c = True
isReplica "" b c = False
isReplica (a:as) b c | a /= c || b <= 0 = False
                     | a == c && b > 0  = isReplica as (b-1) c 