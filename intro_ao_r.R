
## ---

## title: Curso Introdutório ao Ambiente R

## author: Sollano Rabelo Braga

## email: sollanorb@gmail.com

## date: Dezembro, 2016

## output:

##    pdf_document:

##      toc: true

##      toc_depth: 3

##      highlight: tango

##      df_print: kable

##    html_document:

##      toc: true

##      df_print: kable

##      toc_float: true

##      toc_depth: 3

##      theme: "readable" 

##      highlight: tango

## ---
##
## \pagebreak
##

## # 0) Links úteis ####

## Link para baixar a versão mais atualizada do R:
##
## http://cran.fiocruz.br/bin/windows/base/
##
## Link para baixar a versão mais atualizada do RStudio:
## https://www.rstudio.com/products/rstudio/download/
##
## Curso online gratuito disponibilizado pelo Prof. Eric Gorgens:
## https://eliademy.com/catalog/programac-o-cientifica-no-r.html
##
## Stack Overflow: Melhor lugar para se tirar dúvidas sobre o R.
## Ele tem versões em português e inglês, sendo que a em inglês é bem
## mais completa:
##
## http://stackoverflow.com/questions/tagged/r (ingles)
##
## http://pt.stackoverflow.com/questions/tagged/r (portugues)
##
## R-Bloggers: Blog sobre R: Tutoriais, notícias sobre pacotes, discussões, etc:
##
## https://www.r-bloggers.com/
##
## Links com pdfs disponibilizados pelo pessoal do RStudio.
## Eles cobrem vários topicos, desde o R básico ao avançado:
##
## https://www.rstudio.com/resources/cheatsheets/
##
## # 1) Criar um projeto e uma área de trabalho ####

## Quando se define a área de trabalho, pode-se trabalhar de forma mais direta
## podendo-se chamar objetos a partir daquele local diretamente.
##
## Para isso existem duas formas:
##
## Por linha de comando, ou utilizando a interface do RStudio.
##
## Com a interface do RStudio, os trabalhos são separados em projetos, 
## que preservam todas as informações de cada trabalho feito separadamente.
##
## O projeto pode ser criado indo-se em file -> New Project
## ou no canto superior direito, so símbolo do RStudio
##
## Carregando-se o projeto, ele irá carregar automaticamente a área de trabalho deste projeto
##
## Utilizando linhas de comando pode-se apenas definir o diretório de trabalho,
## com o comando setwd. Este método era utilizado antes da IDE RStudio ser criada,
## tendo caído em desuso ultimamente.
##
## # 2) Operadores e comandos úteis ####

## Operadores são semelhantes a funções, e nos permitem fazer as operações
## mais básicas no R. Podem ser divididos entre operadores matemáticos e lógicos:
##
## Operadores matemáticos:
##
## "+"    soma;
##
## "-"    subtração;
##
## "/"    divisão;
##
## "*"    multiplicação;
##
## "%*%"  multiplicação de matrizes;
##
## "^"    exponenciação ;
##
## "~"    usado em fórmulas de modelos (y ~ x);
##
## Operadores lógicos:
##
## "=="   igualdade (não confundir com =, o operador de atribuição);
##
## "!="   diferente de;
##
## "!x"    diferente de x;
##
## "x & y"  x E y;
##
## "x | y"  x OU y;
##
## ">"    maior que;
##
## "=>"   maior ou igual que;
##
## "<"    menor que;
##
## "<="   menor ou igual que;
##
## 1:5 %in% 1:20;  1:5 existe dentro de 1:20?;
##
## Operadores lógicos serão melhor exemplificados no tópico 8.
##
## A seguir serão mostrados alguns comandos úteis. Esta lista pode ser utilizada
## ao longo do curso sempre que necessário:
##
## Interrogação na frente de um comando ou termo abre o menu de ajuda:
?summary 
## ![documentação de ajuda da função summary](help/summary.png)
##
## Dimensão dos dados:
dim(iris) 

## Número de linhas dos dados:
nrow(iris) 

## Número de colunas dos dados:
ncol(iris) 

## Comprimento dos dados:
length(iris)

## 6 primeiras linhas dos dados:
head(iris) 

## 6 ultimas linhas dos dados:
tail(iris) 

## Nomes das variáveis:
names(iris) 
## Informações estruturais sobre os dados:
str(iris) 

## Classe das variáveis:
class(iris) 

## Concatenar; Une números, caracteres em um vetor:
c(1,3,"quatro") 

## Compara dois dataframes e diz se eles são idênticos ou não:
all.equal(iris,iris) 

## remove todos os NAs:
# na.omit(iris) 

## Substitui NA por 0:
iris[is.na(iris)] <- 0 

## Substitui 0 por NA:
iris[iris==0] <- NA  

## Tabela de frequência absoluta:
table(iris$DESCCATEGORIA) 

## Tabela de frequência relativa:
table(iris$DESCCATEGORIA)/nrow(iris) * 100 

## Apaga variável:
iris$Idade <- NULL

## apaga objeto:
# rm(x) 

## Limpar a área de trabalho:
# rm(list = ls())

## Listar todos os objetos:
#ls()

## # 3) Criação de objetos e atribuição de valores ####

## Objetos tem valores associados a eles quando se utiliza <- ou =.
## No exemplo a seguir, um objeto x e criado, que tem o valor de 10:
x <- 10
x = 10

x

## Para se deletar um objeto, utiliza-se a função rm():
rm(x)

## Pode-se atribuir um conjunto de números, utilizando c(), ou seq():
y <- c(1,2,3,4,5,6,7,8)
z <- seq(from = 1, to = 8, by = 1)
z <- 1:8

## R e sensível a maiúsculas e minúsculas (Case sensitive). então y e diferente de Y:
y
#Y

## Nomes de objetos podem conter números, mas não podem começar com números:
x1 <- 35


## # 4) Classes de objetos (Class) ####

## Dados carregados e salvos no ambiente R são chamados de objetos.
## pode-se criar objetos no R com o comando ->, <-, ou =

x <- 10
10 -> x
x = 10

## Qual método utilizado para salvar objetos fica a critério do usuário
## entretanto, não e recomendado o uso do =, pois o mesmo símbolo e utilizado com outros significados,
## criando um código confuso.
##
## neste curso será utilizado <- 

## objetos podem pertencer a diferentes classes:
##
## ## 4.1) Numeric (Números decimais)  ####

## valores decimais são chamados de numéricos no R.
## Este e o tipo computacional de dadospadrão no R,
## ou seja, quando se cria um dado numérico, ele automaticamente possui classe numeric.
##
## Pode-se verificar isto com a função class():
x <- 3

class(x)

## pode-se verificar se x realmente e numeric com a função is.numeric()
is.numeric(x)

## ## 4.2) Integer (Números inteiros) ####

## para se criar um objeto de classe integer, utiliza-se as.integer(),
## já que porpadrão o R cria objetos numéricos de classe numeric:
x <- as.integer(3)
as.integer(3)
x
class(x)

## Ao se utilizar a função as.integer em um valor decimal, ele se torna inteiro:
x <- as.integer(3.6)
x

## Pode-se também converter valores lógicos (TRUE ou FALSE) em números inteiros
## assim como em outras linguagens, TRUE possui valor 1, e FALSE possui valor 0:
as.integer(TRUE)
as.integer(FALSE)

## ## 4.3) Complex (Números complexos) ####

## Números complexos não são muito utilizados na nossa área,
## entretanto, e importante o conhecimento dos mesmos:
y <- 1 + 2i
class(y)

## ## 4.4) Logical (lógicos) ####

## Valores lógicos são utilizados para comparações, 
## e são gerados toda vez que se compara objetos no R utilizando operadores
## como maior que (>), menor que (<), ou igual a (==).
##
## Por exemplo, digamos que se tenha objetos chamados x e y,
## com valores de 1 e 2, respectivamente:

## Primeiro cria-se objetos para exemplo:
x <- 1; y <- 2

## x e maior do que y?
x > y 

class(x > y)

## Se a comparação for feita com um vetor maior, o resultado são vários
## elementos lógicos:
5 > c(1:7)

## Outro operador utilizado e o %in%, que indica se 
## um conjunto de dados existe dentro de outro conjunto:

4:6 %in% 1:10

## ## 4.5) Character (Caracteres) ####

## Character representa valores string no R. Palavras, frases, etc.
## Mesmo um dado de classe pode se tornar um valor string.
## Isto pode ocorrer involuntariamente, gerando erros,
## pois não e possível realizar calculos com dados de classe Character.
## Existem vários métodos de se criar e manipular objetos character,
## por enquanto serão utilizados os mais básicos.
##
## Pode-se criar um objeto de classe character colocando 
## letras ou números entre aspas, "":

x <- "3.14" 
y <- "programacão" 
## Classes dos objetos x e y:
class(x) 
class(y)

## Apesar de estar representando um número, ão se tentar
## realizar calculos com o objeto x, e gerado um erro:

# 3 + x 

## # 5) Tipos de objetos (Modes) ####

## No R, dados podem ser organizados em diferentes tipos, ou modos;
## as principais serão refenciadas neste tópico.
##

## ## 5.1) Vectors (vetores) ####

## No R, um vetor é uma sequência de dados de mesma classe;
## vetores possuem apenas uma dimensão;
## um vetor pode ser criado com a função c(), que concatena valores:

a <- c(1, 2, 5.3, 6, -2, 4) 
a # vetor numérico

b <- c("um", "dois", "tres") 
b # vetor character 

c <- c(TRUE,TRUE,TRUE,FALSE,TRUE,FALSE) 
c # vetor logical

## Ao se tentar unir strings e números, ou seja, objetos de classes diferentes em um único vetor,
## os números serão "coagidos" (coerced) para caracteres, pois um vetor so pode ter uma classe:

# atenção aos números entre aspas, indicando que eles na verdade são caracteres:
c(a, b) 

## ## 5.3) Matrices (Matrizes) ####

## No R, uma matriz é um conjunto de elementos organizados de forma retangular bidimensional;
## Todas as colunas de uma matriz devem ter o mesmo número de elementos e a mesma classe(numeric,character, etc).
##
## Pode-se criar uma matriz com a função matrix():

d <- matrix( 
  c(2, 4, 3, 1), # dados a serem inseridos 
  nrow=2,              # número de linhas 
  ncol=2,              # número de colunas 
  byrow = TRUE)        # organizar a matriz por linha 

## matriz que vai de 1 a 4, com duas linhas, organizada por coluna:
e <- matrix(1:4, nrow = 2,byrow = FALSE)

## matriz d no console:
d 

## Pode-se fazer operações matemáticas com matrizes:

## Multiplicação:
d * 4 

## Multiplicação de matrizes:
d %*% e 

## Matriz transposta:
t(d)

## Matriz Inversa:
solve(d) 

## elementos de uma matriz podem ser referenciados utilizando [],
## utilizando df[linha, coluna], por exemplo:

## Primeira linha, segunda coluna:
d[1,2]

## Todos os objetos da segunda linha:
d[2, ]

## mais detalhes sobre manipulação de matrizes serão abordados em tópicos futuros.
##

## ## 5.4) Data Frames ####

## Dataframes (df) são a forma padrão de se inserir dados no R.
## Um data frame é mais geral do que uma matriz, de forma que 
## diferentes colunas podem ter diferentes classes.
##
## Colunas são chamadas de variáveis (variables) e linhas de observações (observations);
##
## Pode-se utilizar vetores para criar um data frame:
a <- c(1, 2, 3, 4) 
b <- c("vermelho", "azul", "vermelho", "rosa")  
c <- c(TRUE,TRUE,TRUE,FALSE) 

meusdados <- data.frame(a,b,c)
meusdados 

## Observa-se que agora na aba "environment, abaixo de Data, existe o df "meusdados",
## com 4 observações e 3 variáveis, ou seja, 4 linhas e 3 colunas.
##
## Outra forma de verificar isto e com a função dim():
dim(meusdados) 

## Os nomes das variáveis de um df podem ser alterados:
names(meusdados) <- c("Idade", "ID", "Teste") 

## Verifica-se os nomes das variáveis:
names(meusdados)

## Pode-se visualizá-lo como uma tabela, clicando nele na aba environment, ou utilizando View:
# View(meusdados)

## Elementos de um df podem ser chamados por nome, com $, ou por posição, com []:
##
## variável Idade:
meusdados$Idade 

## terceira coluna do df meusdados:
meusdados[,3] 

## o R possui dataframes built-in, ou seja, que já vem instalados com o a instalação básica:
head(mtcars)
head(iris)

## mais detalhes sobre a manipulação de data frames serãoabordadosem tópicos futuros. 
##

## ## 5.5) Lists (Listas) ####

## Listas são coleções ordenadas de objetos;
## Podem unir objetos de diferentes tipos, classes e domensões em um único objeto.
## São uteis quando se quer unir informações de objetos de domensões diferentes,
## e na otimização de loops.
##

## Por exemplo: Um dataframe e um vetor podem ser unidos por uma lista:

meusdados <- data.frame(a = c(1, 2, 3, 4),
                        b = c("vermelho", "azul", "vermelho", "rosa"),
                        c = c(TRUE, TRUE, TRUE, FALSE))

d <- matrix( c(2, 4, 3, 1),   nrow=2, byrow = TRUE)    

minhalista <- list(d, meusdados)

minhalista

class(minhalista)

## Elementos de uma lista são identificados utilizando [[]]

## primeiro elemento de uma lista:
minhalista[[1]] 

## segundo elemento de uma lista:
minhalista[[2]] 

## observa-se que a classe do objeto não se altera dentro da lista:
class(minhalista[[1]]) 

## Caso seja utilizado apenas um colchete, a classe do objeto será de uma lista:
class(minhalista[1]) 


## ## 5.6) Factors (Fatores) ####

## Variaveis nominais ou classificatórias são chamadas de fatores no R.
## Elas podem ser utilizadas para separar os dados em classes, ou grupos.
##
## Sera utilizado como exemplo o dataframe Iris.
## pode-se obter mais informações sobre o dataframe com utilizando uma ? na frente do mesmo
?iris
## ![documentação de ajuda dao dataframe iris](help/iris.png)
##
## Caso se rode apenas o nome do dataframe, o console fica poluído,
## pois será mostrado todo o dataframe no console, ou pelo menos 
## as primeiras centenas de linhas:
iris

## Uma melhor forma de se visualizar o dado e visualizar as
## primeiras e ultimas 6 linhas com head() e tail().
##
## Primeiras 6 linhas:
head(iris)

## Ultimas 6 linhas:
tail(iris)

## Iris da informações de largura e comprimento de sépalas e pétalas  de flores
## por espécie.

## Pode-se verificar os nomes das variáveis de iris:
names(iris)

iris$Species

## Observando a classe da variável Species, veremos que se trata de um fator:
class(iris$Species)

## Um fator agrupa observações repetidas, e as separa em grupos;
## estes são chamados de levels, ou níveis.
##
## Aqui obtem-se os nomes das 3 espécies neste dataframe:
levels(iris$Species) 

## E se o objetivo fosse obter os dados de largura e comprimento
## apenas da espécie setosa?
##
## Como a variável Species separa os dados nos níveis
## "setosa", "versicolor", "virginica", basta filtrar iris
## com a variável Species, especificando que se deseja apenas os dados que
## estão dentro no nível "setosa":
iris[iris$Species=="setosa" , ] 

## Isto e chamado de subsetting; existe um tópico separado 
## neste curso para estas operações.
##

## ## 5.7) Functions (funções) ####

## funções são formas de se compactar rotinas ou operações complexas,
## que se deseja fazer repetidas vezes, em apenas um comando, facilitando
## a digitação, diminuindo o tamanho de scripts, etc.
##
## O R possui funções que são nativas dele, que podem ser acessadas assim que se 
## abre o programa. Estas são as funções conhecidas como base.
## Novas funções podem ser adquiridas por meio de pacotes, ou podem ser criadas
## pelo próprio usuário.
##
## Para acessar uma função do R base, basta digitar o nome dela, seguido de um parênteses.
## Por exemplo:
sum(4,5)


## Todas as funções no R possuem argumentos. Argumentos são as entradas da função,
## que são separados por "," . 
## Por exemplo, para se descobrir os argumentos função matrix, usa-se o comando:
args(matrix)

## Para se saber mais sobre uma função, basta utilizar ? seguido do nome da função:
?matrix
## ![documentação de ajuda da função matrix](help/matrix.png)
##
## Agora se tem uma descrição detalhada da função. 
## Com isso, conclui-se que:
##
## 1. Entrada de dados, default: NA 
## 2. número de linhas da matriz, default: 1
## 3. número de colunas, default: 1
## 4. organização das colunas, default: TRUE
## 5. definição de nomes dinamico, default: NULL

## A função matrix possui valorespadrão para todos os seus argumentos.
## Portando, se a função for rodada sem nenhum argumento modificado,
## ela irá gerar uma matrix 1x1, composta por NA:
matrix()

## Caso se altere estes argumentos, altera-se a saída:
matrix(1)

matrix(1, nrow = 2 )

matrix(1, nrow = 2, ncol = 2 )

## Algumas funções não funcionam sem uma entrada, como por exemplo, summary.
## Summary nos da um resumo de um determinado objeto.
args(summary)

## não existe default para o argumento object, indicando que
## ele e um argumento obrigatório. Se a função for rodada sem uma entrada,
## ela irá gerar um erro:
#summary()

## Agora caso inserido um dataframe como entrada, a função retorna
## média, quartis, mediana, mínimo e máximo de cada variável:
summary(mtcars)

## # 6) Importar e exportar dados no R ####

## Pode-se importar  e exportar dados no R base (sem a utilização de pacotes)
## pelos formatos .csv e .txt;
## os dois formatos são semelhantes em questão de tamanho e velocidade,
## fica a critério do usuário qual tipo de arquivo utilizar.
##
## ## 6.1) Importar ####

## utiliza-se read.csv2 para arquivos com separador ";" e dec "," (padrão nacional/europeu);
## e read.csv para arquivos com separador "," e dec "." (padrão americano).
##
## As funções de importação de dados tem como primeiro argumento
## o caminho em que o arquivo que se deseja importar se encontra.
## Por exemplo, se o arquivo estivesse na pasta R, de meus documentos,
## e o nome do arquivo fosse dados, e seu formato csv, o seu caminho seria:
##
## D:/Meus Documentos/R/dados.csv
##
## Digita-se o caminho, seguido do nome do objeto e a sua extensão.
## Caso o objeto esteja dentro da pasta da área de trabalho,
## basta digitar o nome do arquivo e sua extensão, que ele será importado.
## Por exemplo:

## Importa-se dados inserindo o caminho completo:
dados <- read.csv2(file = "D:/Documents/R/aulas_cursos/intro_ao_r/dados.csv" )

## Digitando-se apenas o nome do arquivo, localizado no diretório de trabalho:
dados <- read.csv2("dados.csv")

## O dado anterior foi salvo utilizando o padrão brasileiro de separador e decimal.
## Caso o arquivo possua o padrão americano, deve-se usar a função read.csv,
## ou altera-se os argumentos de dec e sep.
##
## Para se importar dados em .txt, utiliza-se read.table.
## Deve-se alterar o argumento header para TRUE, pois o padrão e FALSE,
## e especificar o separador, dependendo do padrão utilizado:
dados <- read.table("D:/Documents/R/aulas_cursos/intro_ao_r/dados.txt", 
                    header = T, dec = ",")

dados <- read.table("dados.txt", header = T, dec = ",") 

## Caso seja utilizada a IDE RStudio, também e possível importar dados 
## pelo menu "import dataset", na aba environment.
##
## porém e recomendado utilizar-se das linhas de comando, para que se ganhe
## familiaridade com o programa, e para que os scripts criados futuramente
## tenham a importação dos dados nele, tornando-os mais práticos.
##

## ## 6.2) Exportar dados ####

## Para se exportar dados no R, utiliza-se a família de funções write,
## como write.table, para o formato .txt e write.csv para o formato .csv;
##
## O modelo utilizado e:
## write.csv2(nome do objeto a exportar, "nome do arquivo.csv").
##
## Semelhante a família das funções read, utiliza-se write.csv2
## para arquivos com separador ";" e dec "," (padrão nacional/europeu);
## e write.csv para arquivos com separador "," e dec "." (padrão americano).
##
## Deve-se atentar a extensão do arquivo no nome:
write.csv2(dados, "teste.csv") 

## Por padrão os nomes das linhas são inseridas no arquivo. Para que isto não aconteça,
## utiliza-se row.names = FALSE:
write.csv2(dados, "teste.csv", row.names = FALSE)

write.table(dados, "teste.txt", dec = ",", row.names = FALSE)

## # 7) Baixar e carregar Pacotes ####

## Pacotes são a unidade fundamental de código reproduzível no R.
## Eles incluem funções do R reutilizáveis, a documentação que explica como utilizá-la,
## e dados de exemplo. 
## Geralmente pacotes são feitos com um propósito específico,
## que facilita alguma operação que se deseja fazer no R, como por exemplo
## facilitar a manipulação de dados, gráficos mais complexos e bonitos,
## importação de arquivos que por padrão não são aceitos no R, entre outros.
##
## Qualquer pessoa pode criar um pacote e compartilhá-lo. Mas,
## para que ele se torne um pacote "oficial" do R, deve ser enviado para o CRAN,
## onde passa por uma rigorosa analise, ate que seja aceito e disponível para download pelo mesmo.
##
## Para se instalar pacotes utiliza-se a função install.packages.
##
## Para instalar um pacote basta rodar a função inserindo o nome
## do pacote entre aspas.
##
## É interessante sempre utilizar o argumento dependencies com valor TRUE,
## para que seja instalado junto com o pacote, todos os pacotes que este precisa
## para funcionar corretamente.
## A seguir exemplifica-se a instalação do pacote dplyr:
#install.packages("dplyr", dependencies = TRUE)

## Esta operação e feita uma unica vez, e precisa ser refeita apenas quando
## se deseja atualizar o pacote.
##

## Para se carregar um pacote, basta utilizar a função library ou require:
library(dplyr)

## ou:
require(dplyr)

## É necessário carregar um pacote que se deseja utilizar sempre que 
## se iniciar uma nova seção, ou seja, sempre que se abrir o programa.
## 
## A seguir, uma lista dos pacotes mais utilizados:
##
## 1. dplyr, para manipulação de dados;
##
## 2. ggplot2, para criação de gráficos mais bonitos e customizáveis;
##
## 3. raster, para manipulação de imagens e shape files no R;
##
## 4. readxl, para carregar arquivos do excel sem a necessidade de conversão.
##

## # 8) Indexar ou extrair partes de um objeto (subsetting) e lógica ####

## ## 8.1) Subsetting ####

## Quando se trata de dataframes, pode-se utilizar $
## para selecionar uma coluna especifica por nome,
## ou [] para especificar uma linha e/ou coluna especifica por posição.
##
## Utilizando [], primeiro especifica-se a linha, e depois a coluna, 
## separados por ",";
## caso um destes espaços fiquem vazios, toda a seção e selecionada.
##

## Primeiramente importa-se o dado que será utilizado neste capitulo:
dados <- read.csv2("dados.csv")
head(dados)

## Utilizando o dataframe dados, pode-se selecionar apenas a variável CAP,
## utilizando $:
dados$CAP

## Com isso pode-se pedir a média do CAP;
## É importante utilizar o argumento na.rm, que remove qualquer na contido no dado:
mean(dados$CAP, na.rm = T)

## Caso tente-se rodar apenas o nome da variável gera-se um erro:
# CAP 

## Isso ocorre porque quando se roda o nome, o R procura um objeto com este nome
## no ambiente, e não encontra, gerando o erro.
## Para que se possa chamar variáveis por nome sem $, precisa-se utilizar
## a função attach, que fixa o dado no ambiente:
attach(dados)

## Agora, chamar o nome da variável não gera erro:
CAP

## porém, quando se trabalha com mais de um dataframe, ou com scripts longos,
## fixar dados pode gerar erros e atrapalhar o fluxo do script.
## Por isso a maioria dos usuários não recomenda o uso do attach.
## 
## Para desafixar dados, basta utilizar detach:
detach(dados) 

## Uma outra forma de selecionar a coluna CAP e utilizando [];
## utilizando head(), percebe-se que a coluna CAP está na posição 4:
head(dados)

## Portando, pode-se utilizar [] para selecionar a coluna CAP,
## posicionando o número 4 do lado direito da virgula, indicando posição de coluna:
dados[ , 4] 

## Como o lado esquerdo está vazio, todas as linhas são mostradas.
##

## Pode-se utilizar o argumento drop=F, para se manter a classe de dataframe,
## ao invés de converte-la em vetor:
dados[ , 4, drop = F] 

## Para mostrar apenas as 10 primeiras linhas, e a coluna 4, utiliza-se
## o seguinte comando:
dados[1:10 , 4] 

## Utilizando [] também é possível especificar uma ou mais colunas por nome,
## porém este deve estar entre aspas:
dados["CAP"] 

## Para selecionar mais de uma coluna,  os nomes devem estar concatenados
## com a função c():
dados[c("CAP" , "ALT1")] 

## ## 8.2) Logica e subsetting (Filtrar) ####

## quando se faz testes lógicos entre dataframes, utilizando
## operadores lógicos, como >, < ==, gera-se um vetor lógico (ou booleano).
## Por exemplo, se pergunta-se quais dados de CAP são maiores que 50,
## gera-se o seguinte vetor:
dados$CAP > 50

## Caso um vetor lógico seja inserido dentro de [],
## apenas as linhas em que se tem o valor TRUE são mantidas.
##
## Com este raciocínio pode-se filtrar o dado. por exemplo:
dados[dados$CAP > 50 , ] 

## Com isso, fatores são muito uteis quando se deseja filtrar os dados.
## Por exemplo, a variável DESCCATEGORIA indica a qualidade da arvore,
## como dominante, normal, falha, etc.
## Pode-se verificar isso com a função levels:
levels(dados$DESCCATEGORIA)

## Seguindo o raciocínio, pode-se selecionar apenas as arvores dominantes:
dados[dados$DESCCATEGORIA == "Dominante", ] 
## Aqui seleciona-se apenas as linhas em que DESCCATEGORIA é igual a dominante,
## e todas as colunas.
##
## outra forma de se filtrar dados e com a função subset.
##
## Aqui mantem-se apenas as linhas em que o CAP é maior que 55:
subset(dados, CAP > 55)

## e aqui, antem-se apenas as linhas em que o CAP é maior que 55,
## e apenas a coluna CAP:
subset(dados, CAP > 55, select = CAP)

## Quando se realiza subsetting, e possível utilizar varias condições,
## deixando o filtro mais específico.
## O uso dos operadores  & (E) e | (ou) são muito utilizados,
## pois especificam mutualidade exclusiva:
##
## No exemplo a seguir mantem-se as linhas apenas onde
## CODTALHAO é igual a 3656 E CODPARCELA é igual a 101:
dados[dados$CODTALHAO == 3656 & dados$CODPARCELA == 101, ] 
## Isso indica que apenas o talhão 3656 será mantido,
## e dessas linhas, apenas as que a parcela e 101 serão mantidas.
##
## Esta condição é exclusiva, ou seja, mesmo que 101 apareça
## em outros talhões, só serão exibidos os dados do talhão 3656.
##
## Já no próximo exemplo, o operador utilizado foi |, significando,
## linhas do talhão 3656, OU parcela 101. 
##
dados[dados$CODTALHAO == 3656 | dados$CODPARCELA == 101, ]

## Ou seja, pode ser qualquer parcela, desde que seja do talhão 3656. 
## E pode ser qualquer talhão, desde que a parcela seja 101
##
## O talhão 3654 possui a parcela 101

## da mesma forma, este mesmo resultado pode ser obtido com a função subset:
subset(dados, CODTALHAO == 3656 & CODPARCELA == 101)
subset(dados, CODTALHAO == 3656 | CODPARCELA == 101)

## # 9) Modificando variáveis, fatores e criando novos objetos ####

## ## 9.1) Criar variáveis e objetos ####

## Para se criar novas variáveis em um dataframe, basta utilizar
## $ ou [], digitando o nome da variável que se deseja criar,
## seguido de <- ou =, e o que irá compor a nova variável.
## Por exemplo, a conversão de circunferência para diâmetro:
dados$DAP <- dados$CAP / pi
dados["DAP"] <- dados$CAP / pi
head(dados)

## Percebe-se que os dados possuem muitas casas decimais;
## pode-se utilizar a função round para resolver isto.
##
## No primeiro argumento informa-se o objeto ou variável que deseja-se alterar;
## e no segundo o número de casas desejadas:
dados$DAP <- round(dados$DAP, 4)
head(dados)

## Para se deletar uma variável, utiliza-se NULL:

dados$DAP_QUAD <- dados$DAP ^ 2

head(dados)

dados$DAP_QUAD <- NULL

head(dados)

## Agora cria-se um objeto que contém apenas arvores normais ou dominantes:
dados_nd <- dados[dados$DESCCATEGORIA %in% c("Dominante", "Normal"), ]

## Ou, utilizando a função subset:
dados_nd <- subset(dados, DESCCATEGORIA %in% c("Dominante", "Normal") )

head(dados_nd)

## Detalhe importante: Quando extrai-se algumas observações de um dataframe
## seja com subset ou com indexação, variáveis de fatoriais
## ainda mantem seus níveis originais, de maneira semelhante ao filtro do excel
levels(dados_nd$DESCCATEGORIA)

## Isso pode ser um problema quando se utiliza a ferramenta grafica do
## R base, portanto e necessário remover estes níveis.
## Para resolver isso aplica-se a função droplevels nesta variável:
dados_nd <- droplevels(dados_nd)
levels(dados_nd$DESCCATEGORIA)

## NA, ou Not Avaiable, são valores inválidos, ou vazios no R.
## Este tipo de dado pode atrapalhar quando se utiliza fórmulas como média,
## ou na hora de plotar gráficos. Devido a isso, e interessante se ter
## uma cópia dos dados originais, pode se remove os NAs. Isso pode ser feito
## com a função na.omit:
dados_s_na <- na.omit(dados)
head(dados_s_na)


## ## 9.2) Converter variáveis ####

## Para se converter variáveis de uma classe para outra, basta utilizar
## a família de funções "as".

## Por exemplo, para se transformar uma variável character em uma variável
## factor, utiliza-se a função as.factor:
class(dados$DESCCATEGORIA)
dados$DESCCATEGORIA <- as.factor(dados$DESCCATEGORIA)
class(dados$DESCCATEGORIA)

## Ou se para transformar uma variável numeric para character, 
## utiliza-se as.character:
class(dados$CODTALHAO)
dados$CODTALHAO <- as.factor(dados$CODTALHAO)
class(dados$CODTALHAO)


## # 10) rbind & cbind ####

## No R, as funções rbind e cbind são utilizadas para unir matrizes, vetores e dataframes
## por linha e coluna, respectivamente.
##

## ## 10.1) dados utilizados ####

## Neste tópico serão utilizados dois dataframes:

dados <- read.csv2("dados.csv")
head(dados)

talhao3 <- read.csv2("talhao3.csv")
head(talhao3)

## ## 10.2) rbind ####

## Com rbind, une-se objetos por linha.
## Por exemplo, a seguir cria-se um dado que une os objetos
## dados e talhao3 por linha em um objeto só.
dados_completo <- rbind(dados, talhao3)

head(dados_completo)
tail(dados_completo)

## Vale lembrar que para que objetos sejam unidos por linha,
## eles devem ter o mesmo número de colunas, e os mesmos nomes.
##

## ## 10.3) cbind ####

## Com cbind une-se objetos por coluna.
## Por exemplo, a seguir cria-se um vetor que diz se a variável CAP
## de dados é maior ou menor que 50:

CAP_TESTE <- dados$CAP > 50
CAP_TESTE

## Em seguida, testa-se se a altura é menor que 25:
ALT1_TESTE <- dados$ALT1 > 50
ALT1_TESTE

## Agora, une-se os dois objetos ao dado original por coluna,
## utilizando cbind:

dados_testes <- cbind(dados, CAP_TESTE, ALT1_TESTE)

head(dados_testes)

## Caso os dados não tenham o mesmo número de linhas, ocorre um erro.
##
## A excessão é quando se utiliza cbind com um vetor de tamanho 1, 
## em que ele é repetido por todo o dado:

dados_testes <- cbind(dados_testes, b0 = 0.045)
head(dados_testes)

## # 11) Gráficos de dispersão, histogramas e boxplot com R Base ####

## ## 11.1) Dados utilizados ####

dados <- read.csv2("dados.csv")
dados$DAP <- dados$CAP/pi
dados_s_na <- na.omit(dados)

dados_nd <- dados_s_na[dados_s_na$DESCCATEGORIA == "Dominante" | dados_s_na$DESCCATEGORIA == "Normal", ]
dados_nd$DESCCATEGORIA <- droplevels(dados_nd$DESCCATEGORIA)

## ## 11.2) Dispersão ####

## Gráfico de dispersão básico:
plot(x= dados_s_na$DAP, y = dados_s_na$ALT1)

## Gráfico com símbolo personalizado:
plot(
  x= dados_s_na$DAP, 
  y = dados_s_na$ALT1, 
  pch = 19)

## Gráfico com símbolo colorido:
plot(
  x= dados_s_na$DAP, 
  y = dados_s_na$ALT1, 
  pch = 19, 
  col = "red")

## Gráfico com título, e subtítulos para os eixos:
plot(
  x = dados_s_na$DAP,  
  y = dados_s_na$ALT1, 
  pch = 19, 
  col = "red",  
  main = "Circunferência a altura do peito",  
  xlab = "ALT1" , 
  ylab = "DAP (cm)")

## Gráfico com o limite do eixo y modificado:
plot(
  x = dados_s_na$DAP,  
  y = dados_s_na$ALT1, 
  pch = 19, 
  col = "red",  
  main = "Circunferência a altura do peito",  
  xlab = "ALT1" , 
  ylab = "DAP (cm)", 
  ylim = c(15,35) )

## Gráfico com os números do eixo y alinhados:
plot(
  x = dados_s_na$DAP,  
  y = dados_s_na$ALT1, pch = 19, 
  col = "red",  
  main = "Circunferência a altura do peito",  
  xlab = "frequência" , 
  ylab = "DAP (cm)", 
  ylim = c(15,35), 
  las = 1)

## Linha de tendência:
# abline(lm(ALT1 ~ DAP, data = dados))
## ![](plots/abline.png)
##

## ## 11.3) Histograma ####

## Histograma básico:
hist(dados_s_na$DAP)
## Por padrão, o histograma plota a frequência, 
## um titulo e largura das colunas.
##
## Densidade ao invés de frequência:
hist(
  dados_s_na$DAP, 
  freq = F)

## Cor:
hist(
  dados_s_na$DAP, 
  freq = F, 
  col = "blue")

## Limite do eixo y customizado:
hist(
  dados_s_na$DAP, 
  freq = F, 
  col = "blue", 
  ylim = c(0,0.40))

## Largura das colunas:
hist(
  dados_s_na$DAP, 
  freq = F, 
  col = "blue", 
  ylim = c(0,0.40), 
  breaks = 5)

## Título:
hist(
  dados_s_na$DAP, 
  freq = F, 
  col = "blue", 
  ylim = c(0,0.40), 
  breaks = 5, 
  main = "Histograma para DAP", 
  xlab = "DAP (cm)", 
  ylab = "Densidade")

## números do eixo y alinhados:
hist(
  dados_s_na$DAP, 
  freq = F, 
  col = "blue", 
  ylim = c(0,0.40), 
  breaks = 5, 
  main = "Histograma para DAP", 
  xlab = "DAP (cm)", 
  ylab = "Densidade", 
  las = 1)

## Curva de densidade:
# lines(density(dados_s_na$DAP))

## ![](plots/lines_density_1.png)
##
## Personalizar curva:
# lines(density(dados_s_na$DAP), col = 2, lwd = 3)

##
## ![](plots/lines_density_2.png)
##

## ## 11.4) Boxplot ####

## Gráfico básico de boxplot:
boxplot(dados_s_na$ALT1)

## Cor:
boxplot(
  dados_s_na$ALT1, 
  col = "steelblue")

## Título, e subtítulos para os eixos:
boxplot(
  dados_s_na$ALT1, 
  col = "steelblue", 
  main = "Boxplot", ylab = "DAP")

## Limite do eixo y modificado:
boxplot(
  dados_s_na$ALT1, 
  col = "steelblue", 
  main = "Boxplot", 
  ylab = "DAP", 
  ylim = c(15,35))

## Adicionar ponto de média:
# points(mean(dados_s_na$ALT1), pch = 18, cex = 2)

## ![](plots/points_mean.png)
##

## Gráfico com os números do eixo y alinhados:
boxplot(
  dados_s_na$ALT1, 
  col = "steelblue", 
  main = "Boxplot", 
  ylab = "DAP", 
  ylim = c(15,35), 
  las = 1)


## Agora, plota-se boxplots utilizando os dados criados anteriormente,
## que possuem apenas arvores normais e dominantes:
boxplot(dados_nd$ALT1 ~ dados_nd$DESCCATEGORIA)

boxplot(
  dados_nd$ALT1 ~ dados_nd$DESCCATEGORIA, 
  col = "steelblue", 
  main = "Boxplot",
  xlab = "Classificação")

boxplot(
  dados_nd$ALT1 ~ dados_nd$DESCCATEGORIA, 
  col = "steelblue", 
  main = "Boxplot", 
  xlab = "Classificação", 
  ylim = c(15,35))

boxplot(
  dados_nd$ALT1 ~ dados_nd$DESCCATEGORIA, 
  col = "steelblue", 
  main = "Boxplot", 
  xlab = "Classificação", 
  ylim = c(15,35), las = 1)

## Pode-se visualizar os talhões individualmente 
## utilizando a variável CODTALHAO:
boxplot(
  dados_nd$ALT1 ~ dados_nd$CODTALHAO, 
  col = "steelblue", 
  main = "Boxplot", 
  xlab = "Classificação", 
  ylim = c(15,35), 
  las = 1)

## ## 11.5) Exportar gráficos ####

## Para se exportar gráficos por linhas de comando, deve-se seguir 3 passos:
##
## 1. Digita-se a extensão que se deseja como um comando,
## com o nome do arquivo que se deseja criar dentro (png(), jpeg(), pdf() );
##
## 2. Plota-se o gráfico, com a função plot(), boxplot(), etc;
##
## 3. R então finaliza-se com dev.off() este comando cria o arquivo, 
## que será salvo no diretório de trabalho, 
## a não ser que se especifique outro caminho.
##
## Por exemplo:
##
## Passo 1: Extensão e nome do arquivo que será criado;
## Pode-se escolher a resolução da imagem (nº de pixels), utilizando
## width (largura) e height(altura):

png("grafico.png", width = 1280, height = 720)

## Passo 2: Plota-se o gráfico normalmente:
boxplot( dados_nd$ALT1 ~ dados_nd$DESCCATEGORIA )

##  Passo 3: Finaliza-se com dev.off para exportar o gráfico para um arquivo:
dev.off() 

## Pode-se utilizar a Interface do RStudio para se exportar gráficos também.
##
## na aba plots, 
##
## selecionar export, e o formato desejado
##
## Será aberta uma janela, com opções como formato, local a ser salvo, 
## e tamanho da imagem.
##
## Após definir as opções desejadas, basta clicar em salvar.
##

## # 12) Controle de fluxo (loops) ####

## ## 12.1) Dados utilizados ####

dados <- read.csv2("dados.csv")
dados$DAP <- dados$CAP/pi
dados_s_na <- na.omit(dados)

## Informações sobre controle de fluxo (control flow) podem ser obtidas
## digitando-se o seguinte comando no RStudio:
?Control
## ![documentação de ajuda das funções de controle de fluxo](help/Control.png)
##
## Utilizando o controle de fluxo é possível criar programas que se ramifiquem
## em alternativas, ou que "tomem decisões". Os loops estão presentes em todas
## as linguagens de programação, sendo muito importantes em qualquer linguagem.
##
## Na comunidade do R, entretanto, é recomendado que se evite loops sempre que possível,
## pois o R possui funções vetorizadas que são mais rápidas e eficientes, como
## as funções da família apply. São poucas as linguagens que possuem 
## funções vetorizadas, mas no R elas tem muita utilidade, sendo mais eficientes
## do que loops em questão de consumo de memória e tempo, na grande maioria das vezes.
## Existe um tópico separado neste curso que trata sobre funções vetorizadas.
##
## porém em alguns casos é necessário utilizá-los, quando se necessita
## criar rotinas especificas ou complexas, que apenas uma função
## vetorizada não é capaz de executar. 
## Além disso, são um ótimo exercicio, que 
## utiliza vários conceitos, sendo uma ferramenta importante de se 
## aprender como um iniciante na linguagem.
##

## ## 12.2) Loop for ####

## Imagine que se deseja exibir no console (printar) a frase "o número escolhido é i",
## onde "i" e igual a 1, 2, 3 até 7. Uma forma de fazer isso seria:

print(paste("o número escolhido é", 1))

print(paste("o número escolhido é", 2))

print(paste("o número escolhido é", 3))

print(paste("o número escolhido é", 4))

print(paste("o número escolhido é", 5))

print(paste("o número escolhido é", 6))

print(paste("o número escolhido é", 7))

## Percebe-se essa forma não é interessante. Repete-se o mesmo código varias vezes,
## o que vai contra um conceito conhecido em programação: 
## não se repita (Don't Repeat Yourself - DRY).
##
## Utilizando loops, é possível automatizar processos. O loop for repete processos
## dentro de um intervalo específico.
##
## Sabe-se que 1:7, gera um vetor contendo os números deste intervalo:
1:7

## Assim, utilizando este intervalo no loop, é possível evitar a repetição:
##
## Utiliza-se a função for, seguida da letra i (de índice), e o vetor que vai de 1 a 7.
## A seguir, inserimos o código utilizado anteriormente, porém, onde se utilizava
## os números 1, 2,3 4, 5, 6 e 7, utiliza-se i. Isto diz ao programa que ele irá repetir
## essa função 7 vezes, pois i vai de 1 a 7:

for(i in 1:7){
  
  print(paste("o número escolhido é", i))
  
}

## obs: i é utilizado por convenção, e indica índice. Porém, qualquer letra
## ou palavra poderia ser utilizada em seu lugar.
##
## Certo. Mas e se o objetivo fosse salvar estes resultados em um objeto?
## Pode-se criar uma lista e salvar cada resultado em um elemento desta lista.
## É recomendado se utilizar uma lista ao invés de dataframes,
## pois o R trabalha mais rápido com indexações em vetores e listas.
##
## Primeiro cria-se a lista fora do loop com  o número de anos que
##serão utilizados, e em seguida roda-se o loop:
lista <- vector("list", length = 7)

for(i in 1:7){
  
  lista[[i]] <- paste("o número escolhido é", i)
  
}

lista

## Para converter essa lista em uma matriz, basta utilizar a função do.call:
lista_vec <- do.call("rbind", lista)
lista_vec

## Utilizar uma lista e converte-la em matriz fora do loop, é uma forma de 
## se otimizar o loop. Loops que contém rbind dentro deles, ou que utilizam 
## dataframes, são muito mais lentos, podendo levar a travamentos no programa.
##
## para exemplificar, vamos aumentar o tamanho do vetor e da lista para 10000,
## e medir o tempo de execução com a função system.time.

lista <- vector("list", length = 10000)
system.time(
  
  
  for(i in 1:10000){
    
    lista[[i]] <- paste("o número escolhido e", i)
    
  }
)

## Uma velocidade razoável, mesmo com 10000 interações.
## Agora, se for utilizado um dataframe dentro do loop para interação,
## o resultado é um pouco diferente:

dataf <- data.frame()

system.time(
  
  for(i in 1:10000){
    
    dataf[i,] <- paste("o número escolhido e", i)
    
  }
)

## Dependendo do tipo de loop, e da complexidade dos cálculos,
## este tipo de loop pode levar horas ou dias para ser completado.
## Portanto, este tipo de programação deve ser evitado.
##
## Vale lembrar que, sempre que possível, deve-se utilizar funções vetorizadas
## ao invés de loops, pois estas são muito mais otimizadas.
##


## ## 12.3) if e else ####

## Utilizando if (se) e else(caso contrário), é possível
## estabelecer condições nos loops. Com isto pode-se criar programas
## específicos que executem as tarefas que o usuário deseja.
##
## Por exemplo, criar uma variável que indica se os valores de DAP
## são maiores, ou menores que a média do DAP:

lista <- vector("list", length = nrow(dados))

media <- mean(dados$DAP, na.rm = T)


for(i in 1:nrow(dados) ){
  
  if(is.na(dados$DAP[i]) ){
    
    lista[[i]] <- "Falha"
    
  }else if( dados$DAP[i] <= media ){
    
    lista[[i]] <- "Menor que a media"
    
    
  }else if(dados$DAP[i] > media){
    
    lista[[i]] <- "Maior que a media"
    
  }
  
 }

## Agora, basta converter a lista em vetor, e adiciona-la aos dados
## como variável:

classe <- do.call(rbind, lista)
head(classe)

dados$CLASSE <- classe

head(dados)


## ## 12.4) Loop while ####

## Os loops while (enquanto) loops executam blocos de comando até 
## que a condição utilizada seja satisfeita.

## Exemplo: definindo que x e 1, soma-se 0.5 a 1, até que 
## x seja menor que 10, e printa-se
## o valor atual de x, e o valor atual de x mais 0.5:

x <- 1
while(x < 10) { 
  x <- x + 0.5
  print( c(x-0.5, x) ) 
}

## ## 12.7) next statements ####

## Utilizando next, é possível fazer com que o loop pule uma etapa,
## caso a condição seja alcançada. Neste exemplo, caso x alcance 
## o valor de 7.5, 8 ou 8.5, o loop irá pular, e não irá printar seu valor:
x <- 1
while(x < 10) { 
  
  
  x <- x + 0.5
  
  if(x %in% c(7.5, 8, 8.5) ){next}
  
  
  print( c(x - 0.5, x) ) 
  
}


## ## 12.5) break statements ####

## Breaks podem ser utilizados em qualquer loop, e são usados
## para interromper o loop, caso a condição seja alcançada:
x <- 1

while(x < 10) { 
  
  if(x == 8){break}
  
  x <- x + 0.5
  print( c(x-0.5, x) ) 
  
}

## ## 12.6) loop repeat ####

## Os loops repeat são utilizados em conjunto com o break,
## onde repetem uma ação infinitamente, até que uma 
## condição seja alcançada, e se realize o break:

i <- 1

repeat { 
  
  print(i) 
  i <- i + 1 
  if(i > 4) { break } 
  
}


## # 13) funções definidas por usuários ####

## No R além de se utilizar funções básicas do R, e funções provenientes de 
## pacotes, é possível que o próprio usuário crie funções próprias.
##
## Uma função precisa ter um nome, pelo menos um argumento (não é obrigatório),
## e um corpo de código, que faz alguma coisa. No final ela retorna o resultado,
## utilizando a função return, ou a última linha de código utilizada.
## 
## O interessante de funções  é que objetos criados dentro da função
## pertencem ao ambiente da função, eles não existem fora dela. Ou seja,
## tudo o que ocorre dentro do corpo da função, fica dentro da função,
## sendo possível retornar um objeto final, ou seja, retorná-lo para o ambiente
## global. 
##
## A estrutura básica de uma função e:

nome.da.funcao <- function(argumento1, argumento2) {
  coisas
  return(alguma.coisa)
}

## Os argumentos podem ser qualquer tipo de objeto, entre as chaves ({})
## fica o corpo da função, ou seja, o código que será executado.
## no final da função retorna-se o objeto desejado como saída com a função
## return. So é possível retornar um objeto em uma função.
##
## Como exemplo, a seguir cria-se uma função básica,
## que calcula a média, variância e desvio padrão de um vetor:

calcula.vars <- function(x){
  
  c(mean(x), var(x), sd(x) )
  
}

calcula.vars(iris$Sepal.Length)

## não foi utilizado return na função anterior. Isso porque a função
## apenas realiza as operações, sem criar nenhum objeto no ambiente da função.
## Caso o objeto seja criado, ele deve ser retornado com a função return.
## Se isso não for feito, a função não irá retornar nada (NULL):

calcula.vars <- function(x){
  
  y <- c(mean(x), var(x), sd(x) )
  
}

calcula.vars(iris$Sepal.Length)

## Agora, retornando-se y, tem-se uma saída:

calcula.vars <- function(x){
  
  y <- c(mean(x), var(x), sd(x) )
  
  return(y)
  
}

calcula.vars(iris$Sepal.Length)

## Para deixar a função um pouco mais avançada, 
## pode-se adicionar um segundo argumento.

calcula.vars <- function(x, renomear = F){
  
  y <- c(mean(x), var(x), sd(x) )
  
  
  if(renomear == TRUE){
    
    names(y) <- c("Media","Variancia","Des.Padrao")
    
    return(y)
    
  }else{
    
    return(y)
    
  }
  
  
}

## Agora, caso o argumento "renomear" não seja alterado,
## a função irá retornar y normalmente,
## mas, se ele for verdadeiro, a função altera os nomes
## da variável y, e a retorna:
calcula.vars(iris$Sepal.Length)
calcula.vars(iris$Sepal.Length, renomear = T)


## # 14) funções vetorizadas ####

## Agora serão apresentadas a função ifelse, e a família de funções apply;
## Estas incluem: apply, lapply, sapply, vlapply, by, entre outras.
##
## Estas funções diferenciadas das demais pois são vetorizadas,
## ou seja, aplicam funções por partes,
## seja para cada linha,  coluna, ou item da lista, de forma repetida.
##
## Elas agem sobre uma lista, vetor ou dataframe, e aplicam uma função
## indicada com um ou mais argumentos opcionais.
##
## Estas são funções complexas e com vários usos; Aqui elas serão apenas 
## introduzidas.
##
## As funções são apply, lapply , sapply, vapply, mapply, rapply, and tapply,
## alem da função by, que funciona de forma semelhante, e aplica funções
## por fator.
##
## Estas funções se diferenciam basicamente entre o tipo de dado que 
## será utilizado como entrada, e o formato de saída que se deseja.
##

## ## 14.1) Dados utilizados ####

dados <- read.csv2("dados.csv")

dados$DAP <- dados$CAP/pi
dados_s_na <- na.omit(dados)

## ## 14.2) apply #### 

## A documentação da função apply diz o seguinte:
?apply
## ![documentação de ajuda da função apply](help/apply.png)
##
## A função apply aplica uma função em uma determinada matriz ou variável por linhas, ou colunas,
## e retorna um vetor;
## Ela possui 3 argumentos:
##
## 1. X: objeto em que se deseja aplicar a função, matriz ou dataframe;
##
## 2. MARGIN: Aqui informa-se se a função deve ser aplicada nas linhas, ou colunas do objeto;
## 1 indica linhas, e 2 indica colunas;
##
## 3. FUN: Aqui indica-se a função desejada;
## 
## 4. ...: Caso a função possua argumentos opcionais, eles são inseridos em sequência.
##

## Por exemplo, pode-se calcular a média de todas as colunas numéricas
## do objeto dados. Para isso, primeiro, cria-se um objeto
## apenas com as variáveis numéricas:
dados_num <- dados[ , -6]
head(dados_num)

## Para calcular a média de todas as colunas,
## insere-se o dataframe no argumento X,
## o número 2 no argumento MARGIN, indicando que
## a função será aplicada nas colunas, e no argumento FUN,
## a média.
apply(X = dados_num, MARGIN = 2, FUN = mean) 

## Caso alguma coluna de X possua NAs, a média resultara em NA,
## portanto é necessário especificar o argumento opcional da função mean,
## que indica que NAs devem ser removidos da conta:
apply(dados_num, 2, mean, na.rm = T)

## De forma semelhante, a média das linhas pode ser obtida
## utilizando 1 como segundo argumento:
apply(dados_num, 1, mean)

## ## 14.3) lapply, sapply e vapply #### 

## A documentação da função lapply diz o seguinte:
?lapply
## ![documentação de ajuda da função lapply, sapply e vapply](help/lapply.png)
##
## lapply funciona de maneira semelhante a apply,
## porém é voltada para vetores ou listas;
## ela aplica uma função elementos do objeto, porém retorna uma lista.
##
## Para exemplificar, a seguir converte-se dados_num em uma lista:

dados_num_lista <- as.list( dados_num )
dados_num_lista

## Agora, quando se tenta utilizar a função apply com o objeto
## dados_num_lista, gera-se erro:
# apply(dados_num_lista, 2, mean, na.rm=T)

## Ja a função lapply funciona tanto para listas, quanto para dataframes:

## Lista:
lapply(dados_num_lista, mean, na.rm=T)

## Dataframe:
lapply(dados_num, sd, na.rm=T)

## sapply funciona de forma semelhante, porém, sua saída é uma matriz:

## Lista:
sapply(dados_num_lista, mean, na.rm=T)

## Dataframe:
sapply(dados_num, sd, na.rm=T)

## vapply tem saída semelhante a sapply, e se difere pois tem um argumento opcional
## que permite alterar os nomes da linha do objeto de saída.
## 
## A seguir utiliza-se a função fivenum (que gera valores de mínimo,
## quartil, mediana, terceiro quartil e máximo ) com sapply,
## e com vapply, onde indica-se os nomes dos resultados.
##
## Como exemplo será utilizada a função fivenum,
## que gera as estatísticas de mínimo, quartis, mediana e máximo.
##
## Primeiro cria-se um dado sem NAs:
dados_num_s_na <- na.omit( dados[ , -6] )

## Em seguida, utiliza-se a função fivenum aplicada por sapply:
sapply(dados_num_s_na, fivenum )

## Observa-se que não é possível distinguir, sem conhecer a função,
## quais linhas correspondem a quais estatísticas.
## Sabendo que a ordem das estatísticas é "Mínimo", "1º Quartil", "Mediana",
## "3º QUartil" e "Máxima", utiliza-se o terceiro argumento da função
## vapply para se alterar os nomes do resultado da função aplicada:

vapply(dados_num_s_na, fivenum, c("Min"=0, "1 Qu."=0, "Mediana"=0, "3 Qu."=0, "Max"=0) )

## Como quando se utiliza vapply, se define o tamanho do objeto de saída,
## (com base no terceiro argumento), portanto esta pode ser mais rápida e 
## segura de se utilizar em certas situações.
##

## ## 14.4) by ####

## A documentação de by diz o seguinte:
?by
## ![documentação de ajuda da função by](help/by.png)
##
## Com by, é possível dividir o dado em pedaços com um fator,
## e aplicar uma função para cada pedaço, ou seja, aplica funções por grupo,
## de forma semelhante a "tabela dinâmica" do MO Excel. 
##
## Seus argumentos principais são:
##
## 1. data: objeto em que se deseja aplicar a função, deve ser uma matriz ou dataframe;
##
## 2. INDICES: Vetor fatorial que será utilizado para dividir o dado em grupos;
##
## 3. FUN: Aqui indica-se a função desejada;
## 
## 4. ...: Caso a função possua argumentos opcionais, eles são inseridos em sequência.
##
## Utilizando o dataframe iris como exemplo, tem-se:
head(iris)

## Para se calcular a média de comprimento e largura das pétalas e sépalas
## por espécie, basta utilizar:
media_especie <- by(iris[, 1:4], iris$Species, colMeans)
media_especie
## Como by retorna uma lista, pode-se utilizar do.call para converte-la em
## uma matriz:

media_especie <- do.call(rbind, media_especie) 

as.data.frame(media_especie)

## Ou, de forma direta :
media_especie <- as.data.frame(
  do.call(rbind,
    by(iris[, 1:4], iris$Species, colMeans) ) ) 
media_especie

## obs: A função as.data.frame foi utilizada apenas para melhorar
## a visualização da tabela na apostila.
##

## ## 14.5) tapply ####

## A documentação de tapply diz o seguinte:
?tapply
## ![documentação de ajuda da função tapply](help/tapply.png)
##
## tapply funciona de forma semelhante a by, porém, aceita vetores como entrada.
## Seus argumentos principais são:
##
## 1. X: objeto em que se deseja aplicar a função, geralmente um vetor;
##
## 2. INDEX: Vetor fatorial que será utilizado para dividir o dado em grupos;
##
## 3. FUN: Aqui indica-se a função desejada;
## 
## 4. ...: Caso a função possua argumentos opcionais, eles são inseridos em sequência.
##
## Utilizando o dataframe iris como exemplo, tem-se:
head(iris)

tapply(iris$Petal.Length, iris$Species, mean)

## Para se aplicar a função tapply em varias colunas, basta utilizá-la
## em conjunto com a função apply.
##
## no primeiro argumento insere-se as colunas que se deseje aplicar a função,
##
## No segundo argumento insere-se o número 2, pois o objetivo é 
## aplicar a função por coluna;
##
## No terceiro argumento, insere-se a função. Aqui insere-se tapply,
## seguida de seus 2 argumentos principais, INDEX e FUN.
##
## Utiliza-se iris$Species como INDEX, pois será utilizado como fator de grupo,
## e mean como fun, para que se calcule a média das colunas:
media_especie_2 <- apply(iris[,1:4], 2, tapply, iris$Species, mean )

as.data.frame(media_especie_2)

## Esse método de realizar funções por grupo tem vantagem sobre a função by,
## pois tem sua saída em classe matrix.
##
## obs: A função as.data.frame foi utilizada apenas para melhorar
## a visualização da tabela na apostila.
##

## ## 14.6) ifelse ####

## A documentação de ifelse diz o seguinte:
?ifelse
## ![documentação de ajuda da função ifelse](help/ifelse.png)
##
## A função ifelse é a função vetorizada das afirmações if e else,
## sendo uma ótima substituta a for loops que utilizam if e else,
## se demonstrando muito mais rápida, dependendo do loop.
## Possui três argumentos:
##
## 1. test: teste lógico;
## 2. yes: valores a serem retornados caso test seja TRUE;
## 3. no:  valores a serem retornados caso test seja FALSE.
##
## Utilizando o exemplo do loop for, pode-se observar como o código fica
## muito mais simples:

média <- mean(dados$DAP, na.rm = T)

ifelse(dados$DAP > 20, "maior que a media", "menor que a media")

## elementos onde dados$DAP eram NA, ifelse simplesmente retorna NA e prossegue,
## ao invés de parar e retornar um erro, como em um loop for.
##
## Caso se deseje inserir um valor quando dados$DAP for na, basta
## utilizar um ifelse dentro do outro; esse tipo de ação é chamada de 
## nesting:
ifelse(is.na(dados$DAP), "Falha",
       ifelse(dados$DAP > 20, "maior que a media", "menor que a media")
)

