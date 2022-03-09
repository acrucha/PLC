-- * ANOTAÇÕES AULA 8 - PLC

-- ! APLICAÇÃO PARCIAL DE FUNÇÕES
-- aqui aplicamos a função map parcialmente, ou seja ainda precisamos passar o último parâmetro quando chamarmos doubleList
doubleList = map (*2) 

-- * função elem -> dado um elemento e uma coleção de elementos checa se o elemento faz parte da coleção
-- Ex: elem 'd' "feiufdhev" = True; elem 'd' "feiufhevhbk" = False
-- * filtrar todas as strings em que a letra 'd' aparece
-- Ex: filter (elem 'd') ["verfvsd","frgrhbh","fef","ddas","frg","dfe"] = ["verfvsd","ddas","dfe"]

-- * filtrar todos o números pares
-- Ex: filter (\x -> x `mod` 2 == 0) [1,13,121,36,24,12,5,4,8,96,6,3,1] = [36,24,12,4,8,96,6]

-- * concatena \n
-- ? Ex: map (++"\n") ["asd","erg","tyj","ghtgh","daa","deda"] = ["asd\n","erg\n","tyj\n","ghtgh\n","daa\n","deda\n"]
-- ? Pra printar todas com o \n: putStr $ concat (map (++"\n") ["asd","erg","tyj","ghtgh","daa","deda"])

-- ? Toda função em haskell tem apenas um parâmetro, e esse parâmetro é uma outra função.
-- * ex: t -> u -> v = t -> (u -> v)

-- ! ITER 

iter :: Int -> (t -> t) -> (t -> t)
iter 0 f = id
iter n f = (iter (n-1) f).f

-- ? recebe como parâmetro 2 números e uma função. 
-- ? ela aplica a função dada um número x de vezes e depois multiplica o resultado por um outro número
-- exemplo:
-- * iter 10 (*2) 3 = 3072 => multiplica 2 por ele mesmo 10 vezes e depois multiplica o resultado por 3
-- * iter 10 (/2) 2000 = 1.953125 => divide 10 vezes o 2000 por 2 ou seja divide o 2 por ele mesmo 10 vezes e depois multiplica por 2000

-- ! TIPOS ALGÉBRICOS

-- data Bool = True | False
data Temperatura = Frio | Quente
    deriving Show

-- Dados enumerados

data Mes = Janeiro | Fevereiro | Março | Abril | Maio

type Nome = String
type Idade = Int
data Pessoas = Pessoa Nome Idade
    deriving Show

mostrarPessoa :: Pessoas -> String
mostrarPessoa (Pessoa n i) = "Nome: " ++ show n ++ "\nIdade: " ++ show i ++ "\n"

baseExemplo :: [Pessoas]
baseExemplo = [(Pessoa "Sergio" 20), 
               (Pessoa "Andre" 13), 
               (Pessoa "Fernando" 43), 
               (Pessoa "Clara" 23)]

listarPessoas :: [Pessoas] -> String
listarPessoas bd = concat [mostrarPessoa p | p <- bd]
-- para mostrar formatado: putStr $ listarPessoas baseExemplo

-- ? Tipos alternativos

data Shape = Circle Float | Rectangle Float Float | Square Float | Triangle Float Float

isRound :: Shape -> Bool
isRound (Circle _) = True
isRound sh = False

area :: Shape -> Float
area (Circle r) = pi*r^2
area (Square s) = s^2
area (Rectangle w h) = w*h  
area (Triangle w h) = (w*h)/2  

data Tree t = NilT |
              Node t (Tree t) (Tree t)
              deriving (Eq, Show)

-- O deriving Eq significa que é possível utilizar operações de equivalência (==) com árvores
-- O show é para conseguirmos representar uma árvore em forma de string (geralmente se usa sempre)
