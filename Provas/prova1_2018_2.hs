-- ! Prova 1 - 2018.2

import Data.Char

-- (- 1) (2.5) Um dos algoritmos mais simples de compressão de dados sem perda é run-length encoding (RLE),
-- em que sequências de dados com o mesmo valor são armazenados como um contador de repetições seguido do
-- dado. Escreva uma função encode_rle que, dada uma String, retorna uma lista de pares contendo um caractere
-- e o número de vezes que ele se repete de forma seguida na String.

-- exemplo: encode_rle "WWWWWWBWWWXYYZZZ" ---> "6W1B3W1X2Y3Z"

-- encode_rle :: String -> String

-- Pode ser usada uma estrutura de dados intermediaria / auxiliar a critério do aluno.
-- Dica: use a função show para converter um inteiro em String

seRepete :: Char -> String -> Int -> (String, String)
seRepete a [] n = (show n ++ [a], [])
seRepete a (b:bs) n | a == b    = seRepete b bs (n+1)
                    | otherwise = (show n ++ [a], b:bs)

encode_rle :: String -> String
encode_rle [] = []
encode_rle (a:as) = str ++ encode_rle resto
    where (str, resto) = seRepete a as 1


-- (- 2) (2.5) Escreva uma função decode_rle que descomprima uma String codificada com RLE. 

-- exemplo: decode_rle "6W1B3W1X2Y3Z" ---> "WWWWWWBWWWXYYZZZ"

-- Pode ser usada uma estrutura da dados intermediaria / auxiliar a critério do aluno.
-- Assuma que a repetição máxima é de 9 caracteres. 
-- Dica: use a função charToInt abaixo para converter um caractere numérico em um inteiro

-- charToInt :: Char -> Int
-- charToInt ch = fromEnum ch - fromEnum '0'

-- decode_rle :: String -> String

charToInt :: Char -> Int
charToInt ch = fromEnum ch - fromEnum '0'

descomprime :: Int -> Char -> String
descomprime 0 letra = []
descomprime n letra = [letra] ++ (descomprime (n-1) letra)

decode_rle :: String -> String
decode_rle [] = []
decode_rle (n:letra:as) = str ++ decode_rle as
    where str = descomprime (charToInt n) letra


-- (- 3) (2.5) Outros algoritmos de compressão utilizam um "dicionário que guarda pares de códigos (inteiro)
-- e Strings, de forma que sempre que a String é reutilizada, se usa apenas o código. Para descompactar, é
-- preciso ter o dicionário e a String compactada. Implemente uma função que recebe um dicionário e uma String
-- compactada e mostre a String descompactada, isto é, sempre que aparecer um número inteiro, ele deve ser
-- substituído pela palavra no dicionário. Para simplificar o problema, assuma que os códigos tem apenas um
-- dígito.

-- type Dicionario = [(Int, String)]

-- exemplo: 
-- meuDicionario :: Diccionario
-- meuDicionario = [(1, "casa"), (3, "cafe"), (4, "teria"), (6, "era"), (7, "uma")]
-- teste = "a 1 tinha 3 mas nao 6 7 34, a 1 6 7 sorve4"
-- decode meuDicionario teste ---> "a casa tinha cafe mas nao era uma cafeteria, a casa era uma sorveteria"
-- decode :: Dicionario -> String -> String


type Dicionario = [(Int, String)]

meuDicionario :: Dicionario
meuDicionario = [(1, "casa"), (3, "cafe"), (4, "teria"), (6, "era"), (7, "uma")]

teste = "a 1 tinha 3 mas nao 6 7 34, a 1 6 7 sorve4"

addString :: (Int, String) -> String -> String
addString (n, str1) [] = []
addString (n, str1) (a:as) | isDigit a && [a] == (show n) = str1 ++ (addString (n, str1) as)
                           | otherwise                    = [a] ++ (addString (n, str1) as)

decode :: Dicionario -> String -> String
decode [] str = str
decode dic [] = []
decode (d:ds) str = decode ds strAfterDecode
    where 
        strAfterDecode = addString d str

-- (- 4) (2.5) Ao invés de uma busca linear no dicionário representado como uma lista, ele pode ser representado
-- por uma árvore binária, acelerando a busca. Implemente a função codeTree abaixo que, ao invés de receber o
-- dicionário como uma lista, o recebe como uma árvore de busca binária.

-- type DicionarioT = Tree Int String
-- data Tree chave valor = Node chave valor (Tree chave valor) (Tree chave valor)
--                       | Leaf

-- meuDicionarioT :: DicionarioT
-- meuDicionarioT = Node 4 "teria" (Node 3 "cafe" (Node 1 "casa" Leaf Leaf) Leaf)
--                                 (Node 6 "era" Leaf (Node 7 "uma" Leaf Leaf))

-- decodeTree meu meuDicionarioT teste ---> "a casa tinha cafe mas nao era uma cafeteria, a casa era uma sorveteria"
-- decodeTree :: DicionarioT -> String -> String


type DicionarioT = Tree Int String
data Tree chave valor = Node chave valor (Tree chave valor) (Tree chave valor)
                      | Leaf

meuDicionarioT :: DicionarioT
meuDicionarioT = Node 4 "teria" (Node 3 "cafe" (Node 1 "casa" Leaf Leaf) Leaf)
                                (Node 6 "era" Leaf (Node 7 "uma" Leaf Leaf))


search :: DicionarioT -> Int -> String
search Leaf n = ""
search (Node chave valor subTree1 subTree2) n | n > chave  = search subTree2 n
                                              | n == chave = valor
                                              | otherwise  = search subTree1 n

decodeTree :: DicionarioT -> String -> String
decodeTree Leaf str = str
decodeTree dic [] = ""
decodeTree dic (a:as) | isDigit a = result ++ decodeTree dic as 
                      | otherwise = [a] ++ decodeTree dic as 
    where 
        result = search dic (charToInt a) 