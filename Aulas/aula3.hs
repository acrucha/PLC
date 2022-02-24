-- * ANOTAÇÕES AULA 3 - PLC

-- * Exercícios

-- Escreva uma função para devolver, em forma de tabela,
-- todas as vendas da semana 0 até a semana n, incluindo
-- o total e a média de vendas no período. Use as funções
-- definidas previamente e defina novas funções que
-- achar necessário.

vendas :: Int -> Int
vendas 1 = 10
vendas 2 = 10
vendas n = n * 4 

totalVendas :: Int -> Int
totalVendas n   | n == 0    = vendas 0
                | n > 0     = totalVendas (n-1) + vendas n
                | otherwise = 0

addEspacos :: Int -> String
addEspacos n | n == 0 = ""
             | otherwise = " " ++ addEspacos (n-1)

imprimeSemanas :: Int -> String
imprimeSemanas n | n > 0 = imprimeSemanas (n-1) ++ addEspacos 2 ++ show n ++ addEspacos 7 ++ show (vendas n) ++ "\n"
                 | n == 0 = addEspacos 2 ++ show n ++ addEspacos 7 ++ show (vendas n) ++ "\n"

mediaVendas :: Int -> Float
mediaVendas n = fromIntegral (totalVendas n) / fromIntegral n

imprimeTabela :: Int -> String
imprimeTabela n = cabecalho
                  ++ imprimeSemanas n
                  ++ imprimeTotal n
                  ++ imprimeMedia n
    where cabecalho = "Semana  Vendas\n"
          imprimeTotal :: Int -> String
          imprimeTotal n = "Total  " ++ show (totalVendas n) ++ "\n"

          imprimeMedia :: Int -> String
          imprimeMedia n = "Media  " ++ show (mediaVendas n) ++ "\n"

-- * LISTAS -> construtor de listas encadeadas (:)
-- (:) é polimófico -> funciona pra qualquer tipo de elemento 
-- toda lista tem apenas um tipo de elemento
-- tem 2 parâmetros -> o primeiro é o head da lista e o segundo é o tail, o resto da lista (que é uma lista do mesmo tipo do head)
-- a função head retorna o primeiro elemento da lista e a função tail retorna o resto da lista:
-- exemplo
{-
    head ['abc'] == 'a'
    tail ['abc'] == "bc"
-}
-- podemos ter listas de listas
-- não importa o tipo da lista [] sempre representa uma lista vazia
-- [5] == 5:[]
-- [1,2,3,4] == 1:2:3:4:[]
-- ? [7,5..1] == [7,5,3,1] -> ele pega a diferença entre 7 e 5 para encontrar os outros elementos
-- exemplo: 
--       elem.   lista
-- (:) :: Int -> [Int] -> [Int] 
-- (:) :: t   -> [t]   -> [t] 
-- ? parâmetro (..) -> cria uma lista padronizada de acordo com os 2 primeiros elementos. exemplos:
-- ! [2,4..9] == [2,4,6,8] -> o número 9 (o último da lista) é o número limite que cada elemento da lista pode atingir
-- [2,7..4] == [2]
-- [10,9..1] == [10,9,8,7,6,5,4,3,2,1]
-- ['a'..'c'] == ["abc"]
-- [10..1] == [] -> se não tem segundo elemento então ele não tem um padrão a ser seguido
-- ! [2,8,9..10] -> está errado! não podemos colocar mais de 2 elementos quando estamos usando o parâmetro (..)

-- ? Comprimento -> é uma função padrão de haskell que retorna o tamanho de uma lista:
-- length :: [t] -> Int
-- length [] = 0
-- length (a:as) = 1 + 'length' as -- os parêntesis em (a::as) são obrigatórios pois a::as é um elemento único.
-- ? (a::as) -> se refere à lista inteira
-- a é o head da lista (o primeiro elemento) e as é o resto da lista (tail), quando passamos a lista na recursão,
-- o novo head será o primeiro elemento de as e o resto de as será o novo as.
-- EXEMPLO: (a:as) = [1,2,3] -> a = 1; as = [2,3]

-- ? A concatenação em listas utiliza o mesmo operador (++) usado em strings.

