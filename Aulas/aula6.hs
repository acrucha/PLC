-- * ANOTAÇÕES AULA 6 - PLC

-- Funções monomórficas -> os tipos dos parâmetros e do resultado são predefinidos, não podendo ser alterados durante o uso da função
-- ? Funções polimórficas -> os parâmetros da função recebem tipos diferentes dependendo do contexto (é capaz de lidar com vários tipos de dados)
-- Por exemplo, o operador "==" pode comparar tanto strings/char como números => "ab" == "cd" = False; 5 == 6 = False.

-- * Polimorfismo paramétrico
-- colocar esses t e u significa que o tipo da lista pode ser qualquer um, não importa qual seja
zip1 :: [t] -> [u] -> [(t,u)]
zip1 [] x = []
zip1 x [] = []
zip1 (a:as) (b:bs) = (a,b):(zip1 as bs)

-- zip2 :: [u] -> [u] -> [(u,u)] -- por u ser igual a u, é necessário que os elementos das listas sejam do mesmo tipo

reverseList :: [t] -> [t]
reverseList [] = []
reverseList (a:as) = reverseList as ++ [a]

-- * Polimorfismo de sobrecarga (overloading)
-- definições distintas para cada tipo
-- ! Classes em Haskell são coleções de tipos sobre os quais funções estão definidas
-- Ou seja, classes são usadas para permitir overloading 
-- ? Instâncias são TIPOS que são membros de uma Classe. 
-- Por exemplo, Int é uma instância da classe Eq porque as operações da classe Eq estão definidas para o tipo Int 
{-
--> no terminal => :i Num (classe)
class Num a where
  (+) :: a -> a -> a
  (-) :: a -> a -> a
  (*) :: a -> a -> a
  negate :: a -> a
  abs :: a -> a
  signum :: a -> a
  fromInteger :: Integer -> a
  {-# MINIMAL (+), (*), abs, signum, fromInteger, (negate | (-)) #-}
        -- Defined in ‘GHC.Num’
instance Num Word -- Defined in ‘GHC.Num’
instance Num Integer -- Defined in ‘GHC.Num’
instance Num Int -- Defined in ‘GHC.Num’
instance Num Float -- Defined in ‘GHC.Float’
instance Num Double -- Defined in ‘GHC.Float’

-}

-- * EXERCÍCIO
{-
Crie uma função agrupar que recebe uma lista de listas de valores
de um tipo t que podem ser comparados para saber se são iguais e
devolve uma lista de pares (t, Int) onde o primeiro elemento é um
valor do tipo t que existe em pelo menos uma das sub-listas da
entrada e o segundo é o número de ocorrências desse valor nas sub
listas:
-}

agrupar :: Eq t => [[t]] -> [(t, Int)]
agrupar l = group (concat l)

group :: Eq t => [t] -> [(t, Int)]
group [] = []
group (a:as) = count:group (resto)
  where
    count = (a, length [1 | x <- (a:as), a == x])
    resto = [x | x <- (a:as), a /= x]


-- * Funções de Alta Ordem (map, fold, filter)
-- é uma função/operador que recebe outra função como parâmetro ou gera uma função como resultado

applyBinOper :: (t -> t -> t) -> t -> t -> t -- (t -> t -> t) => nessa parte é indicado os parâmetros e o resultado da lista de entrada
applyBinOper f x y = f x y

-- ? podemos usar funções de alta ordem para generalizar funções com o mesmo escopo mas que tem funções diferentes
-- Então, a função map demonstra uma ação que vai ser realizada em todos os elementos da lista
-- ! MAP
-- Definição:
-- * map :: (t -> u) -> [t] -> [u]
-- * map f [] = []
-- * map f (a:as) = f a : map f as
-- ? Outra definição de map => map f l = [f a | a <- l]

-- funções de transformação:
times2 :: Int -> Int
times2 n = 2 * n

pow :: Int -> Int
pow n = n * n

{-- * Benefícios das funções de alta ordem:

- Facilitam entendimento das funções
- Facilitam modificações -> porque só há mudança na função de transformação
- Aumentam reuso de definições/código
  Ou seja, podemos usar a função map para transformar os elementos 
  de uma lista de diferentes formas, como por exemplo:
-- ? map length ["abc", "defe", "edfrgrt"] = [3,4,7]
-- ? map fst [(7,1), (9,4), (5,3), (1,2)] = [7,9,5,1]
-- ? map snd [(7,1), (9,4), (5,3), (1,2)] = [1,4,3,2]
-- ? map times2 [1..10] = [2,4,6,8,10,12,14,16,18,20]
-- ? map pow [1..10] = [1,4,9,16,25,36,49,64,81,100]

-- ! usando operadores:
-- ? map (^2) [1,2,3] = [1,4,9]
-- ? map (/2) [1,2,3] = [0.5,1.0,1.5]
-- ? map (*2) [1,2,3] = [2,4,6]
-- ? map (+5) [1,2,3] = [6,7,8]
-}

-- dado uma função qual é o máximo dela
maxFun :: (Int -> Int) -> Int -> Int
maxFun f 0 = f 0
maxFun f n = max (maxFun f (n-1)) (f n)

vendas :: Int -> Int
vendas 1 = 15
vendas 2 = 10
vendas n = mod n 13

-- ! FOLDING (redução/dobramento)
-- * pega uma lista e vai combinando 2 a dois para gerar 1 resultado único

fold :: (t -> t -> t) -> [t] -> t
fold f [a] = a
fold f (a:as) = f a (fold f as)

-- soma todos os elementos da lista 2 a 2:
sumList l = fold (+) l

fatorial 0 = 1
fatorial x = fold (*) [1..x]

-- exemplo que já tem em haskell:
-- and :: [Bool] -> Bool
-- and l = fold (&&) l