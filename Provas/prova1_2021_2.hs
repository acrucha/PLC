-- Maria Clara Alves Acruchi (mcaa) 

-- ! PROVA 1 - PLC - 2021.2  

{- Questão 1-}

cursor :: Ord t => Int -> t -> [t] -> Int
cursor n t [] = 0
cursor n t (a:as) | t /= a    = cursor (n+1) t as 
                  | otherwise = n

findVal :: Ord t => t -> [t] -> Int
findVal t []   = 0
findVal t list = cursor 1 t (list)

{-Questão 2-}

procura :: String -> String -> Bool
procura str [] = False
procura str1 (a:as) | str1 == (take (length str1) str2) = True
                    | otherwise                         = procura str1 as
    where str2 = (a:as)

substr :: String -> String -> Bool
substr [] str = True
substr str [] = False
substr str1 str2 | (length str2) > (length str1) = (procura str1 str2)
                 | otherwise                     = False 

{-Questão 3-}

data Result = NotInWord 
            | WrongPos
            | OK
        deriving Show

{- 
-- ! RESOLUÇÃO DA Q3 QUE MANDEI NA PROVA :(

testaLetra :: Char -> String -> String -> [Result]
testaLetra c str [] = [NotInWord]
testaLetra c str (a:as) | c == a && (pos == pos1) = [OK]
                        | c == a                  = [WrongPos]
                        | otherwise               = testaLetra c str as
    where 
        pos  = posLetra c str
        pos1 = dif + (posLetra c (a:as))
        dif  = length str - length (a:as)

posLetras :: Char -> String -> [Int]
posLetras c [] = []
posLetras c (a:as) = [x] ++ [x + (posLetras c as)]
    where x = posLetra c (a:as)

posLetra :: Int -> Char -> String -> Int
posLetra x c [] = -1
posLetra x c (a:as) | c == a    = 1 + x
                    | otherwise = 1 + posLetra c as

tryWord :: String -> String -> [Result]
tryWord "" str = []
tryWord (a:as) str2 = (testaLetra a (a:as) str2) ++ (tryWord as str2)
(b:bs) == (map (==c) str)
 -}

-- ! RESOLUÇÃO DA Q3 FEITA EM CASA (FUNCIONA EM TESE)

geraPosicoes :: [Bool] -> Int -> [Int]
geraPosicoes [] n = []
geraPosicoes (b:bs) n | b == True = [n] ++ geraPosicoes bs (n+1)
                      | otherwise = geraPosicoes bs (n+1)

criaListaPosicoes :: String -> String -> [(Char, [Int])]
criaListaPosicoes [] str = []
criaListaPosicoes (a:as) str = (a, geraPosicoes (posicoesIguaisA) 1) : criaListaPosicoes as str
    where posicoesIguaisA = map (==a) str
  
posicaoOK :: Int -> [Int] -> Bool
posicaoOK x [] = False
posicaoOK x (y:ys) | x == y    = True
                | otherwise = posicaoOK x ys

checagem :: Int -> [(Char, [Int])] -> [(Char, [Int])] -> [Result]
checagem cur [] [] = []
checagem cur g1 g2 | p1 == []         = [NotInWord] ++ checagem (cur+1) ls ls1 
                   | posicaoOK cur p1 = [OK]        ++ checagem (cur+1) ls ls1
                   | otherwise        = [WrongPos]  ++ checagem (cur+1) ls ls1
    where 
        ((l, p):ls)    = g1
        ((l1, p1):ls1) = g2

tryWord :: String -> String -> [Result]
tryWord str1 str2 = checagem 1 (criaListaPosicoes str1 str1) (criaListaPosicoes str1 str2)


{-Questão 4-}

data Tree t = Node t (Tree t) (Tree t)
            | Leaf t
    deriving (Read, Show)

busca :: String -> Tree String -> Bool
busca str (Leaf str1) | str == str1 = True 
                      | otherwise   = False
busca str (Node str1 subtree1 subtree2) | str == str1 = True 
                                        | str > str1  = busca str subtree2
                                        | otherwise   = busca str subtree1
                                                      
arv1, arv2 :: Tree String
arv1 = Node "CASA" (Node "ARVORE" (Leaf "AMARELO") (Leaf "AZUL")) 
                   (Node "LIVRO" (Leaf "JANELA") arv2) 
arv2 = Node "PORTA" (Leaf "MESA") (Leaf "TELHADO")