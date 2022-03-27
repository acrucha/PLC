-- Primeira Prova de Paradigmas de Linguagens Computacionais -
-- 1/2018 - 03/05/2018

-- Nome: 

-- 1) Na copa do mundo de futebol, os grupos contém 4 times, e avançam para a fase seguinte os que tem maior número de pontos, sendo 3 pontos por uma vitória, 
-- 1 por um empate, e zero por uma derrota.
-- Vamos representar os times e jogos com os tipos de dados e sinonimos de tipos abaixo:

-- data Time = Egito | Russia | Arabia | Uruguai 
--           | Ira | Marrocos | Portugal | Espanha de

-- type Jogo = (Time, Int, Int, Time) 
-- Por exemplo: Egito 3 x 1 Russia será representado por (Egito, 3, 1, Russia)

-- a) (2.0) Defina uma função que, dado um time e uma lista de jogos, informe quantos gols aquele time fez.
-- gols :: Time -> [Jogo] -> Int

data Time = Egito | Russia | Arabia | Uruguai | Ira | Marrocos | Portugal | Espanha 
    deriving (Eq, Show, Read)

type Jogo = (Time, Int, Int, Time)

jogos1 :: [Jogo]
jogos1 = [(Egito, 1, 3, Russia), (Arabia, 0, 3, Uruguai), 
          (Egito, 0, 0, Arabia),(Russia, 0, 2, Uruguai), 
          (Russia, 2, 0, Arabia), (Egito, 0, 2, Uruguai), 
          (Ira, 1, 1, Marrocos), (Portugal, 2, 2, Espanha), 
          (Ira, 1, 2, Portugal), (Ira, 0, 1, Espanha), 
          (Marrocos, 0, 3, Portugal), (Marrocos, 1, 1, Espanha)]

gols :: Time -> [Jogo] -> Int
gols t [] = 0
gols t ((t1, gols1, gols2, t2):as) | t == t1   = gols1 + (gols t as)
                                   | t == t2   = gols2 + (gols t as)
                                   | otherwise = (gols t as)


-- b) (2.0) Defina uma função que, dado um time e uma lista de jogos, qual o seu saldo de gols naquele conjunto 
-- de jogos (gols feitos - gols tomados).
-- saldo :: Time -> [Jogo] -> Int

golsTomados :: Time -> [Jogo] -> Int
golsTomados t [] = 0
golsTomados t ((t1, gols1, gols2, t2):as) | t == t1   = gols2 + (golsTomados t as)
                                          | t == t2   = gols1 + (golsTomados t as)
                                          | otherwise = (golsTomados t as)

saldo :: Time -> [Jogo] -> Int
saldo t jogos = (gols t jogos) - (golsTomados t jogos) 

-- c) (2.0) Defina uma função que, dado um time e uma lista de jogos, informe quantos pontos ele obteve naquele 
-- conjunto de jogos.
-- pontos :: Time -> [Jogo] -> Int

checagem :: Int -> Int -> Int
checagem gols1 gols2 | gols1 > gols2 = 3
                     | gols2 > gols1 = 0
                     | otherwise     = 1 

pontos :: Time -> [Jogo] -> Int
pontos t [] = 0
pontos t ((t1, gols1, gols2, t2):as) | t == t1   = (checagem gols1 gols2) + (pontos t as)
                                     | t == t2   = (checagem gols2 gols1) + (pontos t as)
                                     | otherwise = (pontos t as)

-- d) (1.0) Defina um tipo de dados para caracterizar um Grupo, que contém o nome do grupo 
-- (os grupos vão da letra 'A' à Letra 'H') e 4 times.

type Grupo = (Char, Time, Time, Time, Time)

-- e) (3.0)  Feito isso, defina uma função que, dado um Grupo e uma lista de jogos, retorne o par de times que estão 
-- classificados.
--    Os classificados são: os dois com maior número de pontos; em caso de empate, usa-se o saldo de gols; em caso de 
-- continuar empate usa-se o número de gols feitos (há regras adicionais, mas vamos implementar apenas essas 3).
-- exemplos de grupos são: Grupo A: Egito, Russia, Arabia e Uruguai; 
--                         Grupo B: Ira, Marrocos, Portugal e Espanha;
-- classificados :: Grupo -> [Jogo] -> (Time, Time)

grupoA :: Grupo
grupoA = ('A', Egito, Russia, Arabia, Uruguai)

grupoB :: Grupo
grupoB = ('B', Ira, Marrocos, Portugal, Espanha)

greaterThan :: (Time, Int) -> [(Time, Int)] -> [(Time, Int)]
greaterThan (t, p) [] = []
greaterThan (t, p) ((t1,p1):as) | p <= p1   = (t1,p1):(greaterThan (t,p) as)
                                | otherwise = greaterThan (t,p) as

lessThan :: (Time, Int) -> [(Time, Int)] -> [(Time, Int)]
lessThan (t, p) [] = []
lessThan (t, p) ((t1,p1):as) | p > p1    = (t1,p1):(lessThan (t,p) as)
                             | otherwise = lessThan (t,p) as

quickSort :: [(Time, Int)] -> [(Time, Int)]
quickSort [] = []
quickSort (a:as) = quickSort (greaterThan a as) ++ [a] ++ quickSort (lessThan a as)

classificados :: Grupo -> [Jogo] -> (Time, Time)
classificados (g, t1, t2, t3, t4) jogos = (fst f, fst s)
    where 
        (f:s:as) = quickSort ([(t1, pontos t1 jogos)] ++ [(t2, pontos t2 jogos)] ++ [(t3, pontos t3 jogos)] ++ [(t4, pontos t4 jogos)])
             
-- você deve definir e testar vários conjuntos de jogos para validar sua implementação.
-- jogos1 :: [Jogo]
-- jogos1 = [(Egito, 1, 3, Russia), (Arabia, 0, 3, Uruguai), 
--           (Egito, 0, 0, Arabia),(Russia, 0, 2, Uruguai), 
--           (Russia, 2, 0, Arabia), (Egito, 0, 2, Uruguai), 
--           (Ira, 1, 1, Marrocos), (Portugal, 2, 2, Espanha), 
--           (Ira, 1, 2, Portugal), (Ira, 0, 1, Espanha), 
--           (Marrocos, 0, 3, Portugal), (Marrocos, 1, 1, Espanha)]
