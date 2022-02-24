-- * ANOTAÇÕES AULA 5 - PLC

-- * TUPLAS
-- não precisam ter elementos do mesmo tipo
-- fst -> retorna o primeiro elemento da tupla 
-- snd -> retorna o segundo  elemento da tupla
-- exemplos:
-- ? (True, 'x') :: (Bool, Char)
-- ? (34, 22,'b') :: (Int, Int, Char)

shift :: ((Int,Int),Int) -> (Int,(Int,Int))
shift ((x,y),z) = (x,(y,z))

-- sinônimos de Tipos (tipo struct)

type Name = String
type Age = Int
type Phone = Int
type Person = (Name, Age, Phone)

getName :: Person -> Name
getName (n,a,p) = n

-- Exemplo: Equações do Segundo Grau
delta :: Float -> Float -> Float -> Float
delta a b c = b^2 - 4.0*a*c

-- 1 raiz real ou 2 raizes reais iguais
oneRoot :: Float -> Float -> Float -> Float
oneRoot a b c = -b/(2.0*a)

-- 2 raizes reais diferentes
twoRoots :: Float -> Float -> Float -> (Float, Float)
twoRoots a b c = (d-e, d+e)
    where d = -b/(2.0*a)
          e = sqrt(delta a b c)/(2.0*a) 

-- recebe 3 números e retorna uma tupla cujo:
-- primeiro elemento é o número de raizes reais, segundo e terceiro são as raizes 
roots :: Float -> Float -> Float -> (Int, Float, Float) 
roots a b c | delta a b c < 0  = (0,0,0)
            | delta a b c == 0 = (1, (oneRoot a b c), (oneRoot a b c)) 
            | otherwise  = (2, raiz1, raiz2)
              where (raiz1, raiz2) = twoRoots a b c

-- * COMPREENSÕES DE LISTAS
-- é uma experssão que produz como resultado uma lista
-- são usadas para definir listas em função de outras listas   

-- ! forma geral: [ e | variavel <- lista, cond]
-- ? e -> expressão qualquer que (geralmente) usa variável, onde essa variável é usada para guardar cada elemento de uma lista
-- ? cond -> condição tal que só avaliaremos a expressão para a variável se a condição for verdadeira

-- exemplo: queremos elevar ao quadrado todos os numeros de uma lista
-- ? [x^2 | x <- [1..10]] -- cada elemento dessa lista será armazenado em x e guardado em outra lista elevado ao quadrado
-- ! a expressão não precisa fazer uso da variável
-- [0 | x <- [1..10]] -- a nova lista armazenará um zero para cada elemento da lista [1..10]
-- ? exemplo usando uma condição
-- ? [x | x <- [1..100], x `mod` 7 == 0] -- retornará uma lista com todos os múltiplos de 7 dentro da lista de entrada 

-- * EXERCÍCIOS: BANCO DE DADOS

type Pessoa = String
type Livro = String
type BancoDados = [(Pessoa,Livro)]

-- livros emprestados em uma biblioteca
baseExemplo :: BancoDados
baseExemplo = [("Sergio","O Senhor dos Aneis"), ("Andre","Duna"), ("Fernando","Jonathan Strange & Mr. Norrell"), ("Fernando","A Game of Thrones")]

-- quais livros a pessoa já pegou
livros :: BancoDados -> Pessoa -> [Livro]
livros bd p = [livro | (pessoa, livro) <- bd, pessoa == p] -- pega a tupla de bd e adiciona a (p,l) 

-- quais pessoas já pegaram esse livro
emprestimos :: BancoDados -> Livro ->[Pessoa]
emprestimos bd l = [pessoa | (pessoa, livro) <- bd, livro == l]
-- se o livro está emprestado
emprestado :: BancoDados -> Livro -> Bool
emprestado bd l = (emprestimos bd l) /= []

-- conta quantos livros uma pessoa tomou emprestado
qtdEmprestimos ::BancoDados -> Pessoa -> Int
qtdEmprestimos bd p = length (livros bd p)

-- pessoa vai pegar um livro emprestado
emprestar :: BancoDados -> Pessoa -> Livro -> BancoDados
emprestar [] pessoa livro = [(pessoa, livro)] -- retorna o banco de dados inteiro
emprestar ((p,l):as) pessoa livro 
    | p == pessoa && l == livro = ((p,l):as) -- se o livro já está com a pessoa, nada acontece
    | otherwise                 = ((p,l):emprestar as pessoa livro) -- se não, chamo a função recursivamente para checar o próximo par

-- pessoa vai devolver o livro
devolver :: BancoDados -> Pessoa -> Livro -> BancoDados
devolver [] pessoa livro = [(pessoa, livro)] -- retorna o banco de dados inteiro
devolver ((p,l):as) pessoa livro 
    | p == pessoa && l == livro = ((p,l):devolver as pessoa livro)
    | otherwise                 = ((p,l):as) 



