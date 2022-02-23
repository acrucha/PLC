-- DIKASTIS -- Decifre o Enigma

main = do
    a <- getLine
    b <- getLine
    let result = decEnigma a (read b)
    print result
   
dec2 :: String -> [(Char, Char)] -> [(Char, Char)] -> String
dec2 [] (b:bs) enig = []
dec2 (a:as) (b:bs) enig | a == fst b = (snd b: dec2 as enig enig)
                        | otherwise  = dec2 str bs enig
    where 
        str = (a:as)

decEnigma :: String -> [(Char, Char)] -> String
decEnigma [] [] = []
decEnigma str enig = dec2 str enig enig