-- * ANOTAÇÕES AULA 2 - PLC

import Data.Char

chr :: Int -> Char -- função para obter o caractere a partir do código dele (na tabela ASCII)
ord :: Char -> Int -- função para obter o código de um caractere a partir dele

upperCase :: Char -> Char
upperCase ch | ch >= 'a' && ch <= 'z' = chr (ord ch + offset)
             | otherwise = ch
    where offset = ord 'A' - ord 'a' -- diferença entre os códigos dos caracteres na tabela ASCII

upperCase1 :: Char -> Char
upperCase1 ch | ch >= 'a' && ch <= 'z' =
                   let offset = ord 'A' - ord 'a'
                   in chr (ord ch + offset)
              | otherwise = ch

ehDigito :: Char -> Bool
ehDigito ch = ('0' <= ch) && (ch <= '9')

-- Integer é o número inteiro de precisão ilimitada (quantos bits eu quiser), por outro lado Int tem precisão limitada (32 bits)
-- Strings são listas de caracteres
-- * Operador (++) -> concatenação
-- ! ' ', "" e " " são diferentes !
-- Formatação:
-- ! putStr => trata o \n como quebra de linha!!


vendas :: Int -> Int
vendas 1 = 10
vendas 2 = 10
vendas n = n * 4 

isEqual :: Int -> Int -> Int
isEqual s n | n >= 0 && (s == vendas n) = 1 + isEqual s (n-1)
            | n < 0 = 0
            | otherwise = isEqual s (n-1)

-- Checagem  de número Primo
primo :: Int -> Bool
primo 1 = True
primo n = testaPrimo (n-1) n

testaPrimo 1 n = True
testaPrimo x n  | mod n x == 0 = False
                | otherwise = testaPrimo (x-1) n


primosEntreSi :: Int -> Int -> Bool
primosEntreSi x y = saoDivisiveis x y (min x y)
 where
  saoDivisiveis a b 1 = True
  saoDivisiveis a b c | (a `mod` c == 0) && (b `mod` c == 0) = False
                      | otherwise = saoDivisiveis a b (c-1)

xor :: Bool -> Bool -> Bool
xor x y = (x || y) && not (x && y)
                

-- Multiplos de 3 e 5

mult :: Int -> Int -> Bool 
mult x y | mod x y == 0 = True
         | otherwise = False

somaMulti :: Int -> Int 
somaMulti x | x < 0 = 0
            | ((x-1) >= 0) && (mult (x-1) 3) || (mult (x-1) 5) = (x-1) + somaMulti (x-1)
            | otherwise = somaMulti (x-1)


-- Fatorial 
fat :: Int -> Int
fat 0 = 1
fat n = n * fat (n-1)