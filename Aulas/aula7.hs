-- ! FOLDR/FOLDL (biblioteca de haskell)
-- habilita a escolha do caso base!!
-- Definição:
-- * foldr::(t -> u -> u) -> u -> [t] -> u 
-- * foldr f s [] = s
-- * foldr f s (a:as) = f a (foldr f s as)
-- ? o u após a definição da função de entrada no parâmetro é o caso base da função!
{-
então por exemplo se eu tenho um a lista vazia e tento somar os elementos com a função fold que fizemos
fica impossível, pois ela não habilita caso base. Já com o foldr, é possível escolher o caso base para 
essa função, que seria 0, porque a soma dos elementos de uma lista vazia é zero. 
--? => foldr (+) 0 [] = 0
--? => foldr (+) 0 [1,2,35] = 38 => lembrando que a presença do zero ali é para indicar o resultado do caso base
-}

-- * poderíamos definir a função fatorial dessa vez apenas utilizando foldr:
fatorial2 x = foldr (*) 1 [1..x]
-- Nesse caso => fatorial 0 = foldr (*) 1 [] = 1 (caso base) **Lembrando que [1..0] = []

-- ! FILTER
-- * faz uma filtragem de acordo com um predicado (uma condição).
-- * ou seja, só sobram na lista os elementos que satisfazem a essa condição
{-
Definição:
-- * filter :: (t -> Bool) -> [t] -> [t]
-- * filter p [] = []
-- * filter p (a:as)
-- *   | p a = a : filter p as
-- *   | otherwise = filter p as
=> outra definição => filter p l = [a | a <- l, p a]
-}

-- ! COMPOSIÇÃO DE FUNÇÕES
-- o operador de composição (.) é definido como: (f . g) x = f (g x) 
-- aplica-se g em x e depois f é aplicada nesse resultado
-- é muito inspirado na composição de funções da matemática
-- Definição do operador (.):
-- * (.) :: (u -> v) -> (t -> u) -> (t -> v)
-- * (.) f g x = f (g x)
-- ou seja, o tipo do resultado é dado por t -> u -> v = t -> v (é transitivo)
-- pode ser definido também utilizando notação lambda:
-- * (.) f g = \x = f (g x) => significa que (.) vai receber um x qualquer e aplicará a composição nele

-- ? NOTAÇÃO LAMBDA

-- dado um número e outro número qualquer, retorna a soma => m é do mesmo tipo que n
addNum n = (\m -> n + m)

comp2 :: (t -> u) -> (u -> u -> v) -> (t -> t -> v)
comp2 f g = (\x y -> g (f x) (f y))