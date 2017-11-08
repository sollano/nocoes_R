
## ---

## title: Mini-curso Noções básicas do R

## author: Sollano Rabelo Braga

## email: sollanorb@gmail.com

## date: Novembro, 2017

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
##
## Link para baixar a versão mais atualizada do R (Mantenha o R sempre atualizado):
##
## http://cran.fiocruz.br/bin/windows/base/
##
## Link para baixar a versão mais atualizada do RStudio:
## https://www.rstudio.com/products/rstudio/download/
##
## Curso online gratuito disponibilizado pelo Prof. Eric Gorgens:
## https://eliademy.com/catalog/programac-o-cientifica-no-r.html
##
## Lista do youtube com videos de introdução ao R, criados pelo Prof. Eric Gorgens:
## https://www.youtube.com/playlist?list=PLLCIDTaS6A7C4Ig6gf4d66hvyvl5e3zyy
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
## utilize # para criar comentários
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

## R e sensível a maiúsculas e minúsculas (Case sensitive). então y é diferente de Y:
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
x
class(x)

## pode-se verificar se x realmente e numeric com a função is.numeric()
is.numeric(x)

## ## 4.2) Integer (Números inteiros) ####

## para se criar um objeto de classe integer, utiliza-se as.integer(),
## já que porpadrão o R cria objetos numéricos de classe numeric:
x <- as.integer(3)
x
class(x)

## ## 4.3) Logical (lógicos) ####

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

## ## 4.4) Character (Caracteres) ####

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
x
y <- "programacão" 
y
## Classes dos objetos x e y:
class(x) 
class(y)

## Apesar de estar representando um número, ão se tentar
## realizar calculos com o objeto x, e gerado um erro:

# 3 + x 

## ## 4.5) Factors (Fatores) ####

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

## ## 5.2) Matrices (Matrizes) ####

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

## ## 5.3) Data Frames ####

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
meusdados

## Pode-se visualizá-lo como uma tabela, clicando nele na aba environment, ou utilizando View:
# View(meusdados)

## o R possui dataframes built-in, ou seja, que já vem instalados com o a instalação básica:
head(mtcars)
head(iris)

## mais detalhes sobre a manipulação de data frames serão abordados em tópicos futuros. 
##

## ## 5.4) Lists (Listas) ####

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


## ## 5.5) Functions (funções) ####

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

## # 6) Pacotes ####

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
## A seguir, uma lista dos pacotes mais utilizados e recomendados:
##
## 1. tidyverse - É um conjunto de pacotes para ciência de dados.
## inclui alguns dos pacotes mais utilizados no mundo, como dplyr, ggplot2, entre outros.
## Alguns destes serão detalhados abaixo. É muito recomendado explorar todos os pacotes inclusos
## no tidyverse.
##
## 2. dplyr - para manipulação de dados. Composto por funções simples e fáceis de usar 
## que resolvem a maioria dos problemas envolvendo manipulação de dados;
##
## 3. tidyr - Organização dos dados. Transformar tabelas longas, unir variáveis, lidar com NA, etc;
##
## 4. readxl - para carregar arquivos direto do excel em formato .xlsx;
## 
## 3. ggplot2 - para criação de gráficos bonitos e customizáveis;
##
## 3. raster - para manipulação de imagens e shape files no R;
##
## 5. ExpDes.pt - Pacote destinado a analise de delineamentos experimentais (todo em portugues);
##
## 6. agricolae -  Pacote destinado a analise de delineamentos experimentais;
##
## 7. vegan - Pacote utilizado para análises descritivas de ecologia;
##
## A única desvantagem em se utilizar pacotes, é que 
## pode acontecer do pacote ser atualizado e uma função mudar de nome, ou deixar de existir,
## deixando códigos antigos inutilizados. [Códigos escritos utilizando as funções padrões do R,
## também conhecidas como r base são mais recomendados.
##
## # 7) Importar dados no R ####

## Pode-se importar  e exportar dados no R base (sem a utilização de pacotes)
## pelos formatos .csv e .txt;
## os dois formatos são semelhantes em questão de tamanho e velocidade,
## fica a critério do usuário qual tipo de arquivo utilizar.
##
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
dados <- read.csv2(file = "C:/Users/solla/Documents/R/aulas_cursos/nocoes_R/dados.csv" )

## Digitando-se apenas o nome do arquivo, localizado no diretório de trabalho:
dados <- read.csv2("dados.csv")

## O dado anterior foi salvo utilizando o padrão brasileiro de separador e decimal.
## Caso o arquivo possua o padrão americano, deve-se usar a função read.csv,
## ou altera-se os argumentos de dec e sep.
##
## Para se importar dados em .txt, utiliza-se read.table.
## Deve-se alterar o argumento header para TRUE, pois o padrão e FALSE,
## e especificar o separador, dependendo do padrão utilizado:
dados <- read.table("C:/Users/solla/Documents/R/aulas_cursos/nocoes_R/dados.txt", 
                    header = T, dec = ",", sep = "\t")

dados <- read.table("dados.txt", header = T, dec = ",", sep = "\t") 

## Caso seja utilizada a IDE RStudio, também e possível importar dados 
## pelo menu "import dataset", na aba environment.
##
## porém e recomendado utilizar-se das linhas de comando, para que se ganhe
## familiaridade com o programa, e para que os scripts criados futuramente
## tenham a importação dos dados nele, tornando-os mais práticos.
##
## Importar dados direto em formato excel
##
## Isto pode ser feito utilizando o pacote readxl:
library(readxl)
teste <- read_xlsx("dados.xlsx")
teste

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
## Quando se realiza subsetting, é possível utilizar varias condições,
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

## NA, ou Not Avaiable, são valores inválidos, ou vazios no R.
## Este tipo de dado pode atrapalhar quando se utiliza fórmulas como média,
## ou na hora de plotar gráficos. Devido a isso, e interessante se ter
## uma cópia dos dados originais, pode se remove os NAs. Isso pode ser feito
## com a função na.omit:
dados_g <- na.omit(dados)
head(dados_g)


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



## # 10) Graficos de dispersao, histogramas e boxplot com ggplot2 ####
## ## 10.0) Carregar dados e pacotes ####

library(tidyverse)
dados_g <- read.csv2("dados.csv")
dados_g <- na.omit(dados_g)
dados_g$DAP <- dados_g$CAP/pi
head(dados_g)

## ## 10.1) Dispersão ####

## Histograma para a altura em função da idade
##
## Primeiro cria-se a base do grafico
a <- ggplot(dados_g, aes(x = DAP, y = ALT1))
a

## depois adiciona-se outras camadas
a + geom_point()

## tamanho personalizado
a + geom_point( size = 4)

## Cor personalizada
a + geom_point(size = 4, color = "blue")

## Transparencia nos pontos
a + geom_point(size = 4, color = "blue", alpha = .75)

## pode-se preencher os dados com uma variavel classificatoria
a + geom_point(size = 4, aes(color=DESCCATEGORIA))

## titulo personalizado 
a + geom_point(size = 4, aes(color=DESCCATEGORIA)) +
  labs(x="DAP (cm)", y="Altura (m)", colour = "Categoria", title = "Grafico de Dispersao")

## Tamanho e fonte personalizado
a + geom_point(size = 4, aes(color=DESCCATEGORIA)) +
  labs(x="DAP (cm)", y="Altura (m)", colour = "Categoria", title = "Grafico de Dispersao") +
theme_gray(base_family = "serif") +
theme(
  plot.title=element_text(size = 16, face="bold", vjust = 0.9), 
  axis.title=element_text(size = 12)) 

## Limites do eixo y personalizado
a + geom_point(size = 4, aes(color=DESCCATEGORIA)) +
  labs(x="DAP (cm)", y="Altura (m)", colour = "Categoria", title = "Grafico de Dispersao") +
  theme(
    plot.title=element_text(size = 16, face="bold", vjust = 0.9), 
    axis.title=element_text(size = 12)) +
  coord_cartesian(ylim = c(15,35)) 
  
## linha de tendencia
a  + geom_point(size = 4, aes(color=DESCCATEGORIA)) +
  labs(x="DAP (cm)", y="Altura (m)", colour = "Categoria", title = "Grafico de Dispersao") +
  theme(
    plot.title=element_text(size = 16, face="bold", vjust = 0.9), 
    axis.title=element_text(size = 12)) +
  coord_cartesian(ylim = c(15,35)) +
  geom_smooth(method = "lm", color = "red")  
    
## linha de tendencia sem intervalo de confiança
a  + geom_point(size = 4, aes(color=DESCCATEGORIA)) +
  labs(x="DAP (cm)", y="Altura (m)", colour = "Categoria", title = "Grafico de Dispersao") +
  theme(
    plot.title=element_text(size = 16, face="bold", vjust = 0.9), 
    axis.title=element_text(size = 12)) +
  coord_cartesian(ylim = c(15,35)) +
  geom_smooth(method = "lm", color = "red", se=FALSE)  

## tema diferente
a  + geom_point(size = 4, aes(color=DESCCATEGORIA)) +
  labs(x="DAP (cm)", y="Altura (m)", colour = "Categoria", title = "Grafico de Dispersao") +
  theme_classic() +
  theme(
    plot.title=element_text(size = 16, face="bold", vjust = 0.9), 
    axis.title=element_text(size = 12)) +
  coord_cartesian(ylim = c(15,35)) +
  geom_smooth(method = "lm", color = "red", se=FALSE) 

## Fonte times new roman
a  + geom_point(size = 4, aes(color=DESCCATEGORIA)) +
    labs(x="DAP (cm)", y="Altura (m)", colour = "Categoria", title = "Grafico de Dispersao") +
    theme_bw(base_family = "serif") +
    theme(
      plot.title=element_text(size = 16, face="bold", vjust = 0.9), 
      axis.title=element_text(size = 12)) +
    coord_cartesian(ylim = c(15,35)) +
    geom_smooth(method = "lm", color = "red", se=FALSE) 
  
## Pode-se utilizar subsetting com uma variavel categorica
a + geom_point(size = 4, aes(color=DESCCATEGORIA), show.legend = F) +
  labs(x="DAP (cm)", y="Altura (m)", colour = "Categoria", title = "Grafico de Dispersao") +
  theme_bw(base_family = "serif") +
  theme(
    plot.title=element_text(size = 16, face="bold", vjust = 0.9), 
    axis.title=element_text(size = 12)) +
  coord_cartesian(ylim = c(15,35)) +
  geom_smooth(method = "lm", color = "red", se=FALSE) +
  facet_grid(.~CODTALHAO) 

## Grafico em escala de cinza para variável discreta
a + geom_point(size = 4, aes(color=DESCCATEGORIA)) +
  labs(x="DAP (cm)", y="Altura (m)", colour = "Categoria", title = "Grafico de Dispersao") +
  theme_bw(base_family = "serif") +
  theme(
    plot.title=element_text(size = 16, face="bold", vjust = 0.9), 
    axis.title=element_text(size = 12)) +
  coord_cartesian(ylim = c(15,35)) +
  geom_smooth(method = "lm", color = "red", se=FALSE) +
  facet_grid(.~CODTALHAO) + 
  scale_colour_grey(start = 0.6, end = 0.2)

## Grafico em escala de cinza para variável contínua
a + geom_point(size = 4, aes(color=ALT1)) +
  labs(x="DAP (cm)", y="Altura (m)", colour = "Altura (m)", title = "Grafico de Dispersao") +
  theme_bw(base_family = "serif") +
  theme(
    plot.title=element_text(size = 16, face="bold", vjust = 0.9), 
    axis.title=element_text(size = 12)) +
  coord_cartesian(ylim = c(15,35)) +
  geom_smooth(method = "lm", color = "red", se=FALSE) +
  facet_grid(.~CODTALHAO) + 
  scale_colour_gradient(low = "light gray",high = "gray20")

## Mais customizações em theme
a + geom_point(size = 4, aes(color=DESCCATEGORIA)) +
  labs(x="DAP (cm)", y="Altura (m)", colour = "Categoria", title = "Grafico de Dispersao") +
  theme_bw(base_family = "serif") +
  theme(
    legend.position = "bottom", 
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    panel.border = element_blank(), 
    plot.title = element_text(size = 26, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 26, face = "bold"), 
    axis.text = element_text(size = 23), 
    axis.line.x = element_line(color = "black"), 
    axis.line.y = element_line(color = "black"), 
    strip.text.x = element_text(size = 22,face = "bold"), 
    legend.text = element_text(size = 20), 
    legend.title = element_text(size = 22, face="bold") ) +
  coord_cartesian(ylim = c(15,35)) +
  geom_smooth(method = "lm", color = "red", se=FALSE) +
  facet_grid(.~CODTALHAO) + 
  scale_colour_grey(start = 0.6, end = 0.2)

## ## 10.2) Histogramas ####

## Histograma para o DAP
b <- ggplot(dados_g, aes(x = DAP, y=..density..)) +
  theme_bw(base_family = "serif") +
  theme(
    legend.position = "bottom", 
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    panel.border = element_blank(), 
    plot.title = element_text(size = 26, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 26, face = "bold"), 
    axis.text = element_text(size = 23), 
    axis.line.x = element_line(color = "black"), 
    axis.line.y = element_line(color = "black"), 
    strip.text.x = element_text(size = 22,face = "bold"), 
    legend.text = element_text(size = 20), 
    legend.title = element_text(size = 22, face="bold") ) + 
  scale_colour_grey(start = 0.6, end = 0.2) +
  scale_fill_grey(start = 0.6, end = 0.2)

## para se criar um histograma basta alterar o argumento geom_
b + geom_histogram()

## frequencia ao inves de densidade
b + geom_histogram(aes(y=..count..))

## Largura das colunas
b + geom_histogram(binwidth = 2)

## cor personalizada
b + geom_histogram(binwidth = 2, fill = "cyan4", color = "black")

## Preenchimento personalizado
b + geom_histogram(binwidth = 2, fill = "cyan4")

## Largura das colunas
b + geom_histogram(binwidth = 2, fill = "cyan4")

## pode-se preencher os dados com uma variavel classificatoria
b + geom_histogram(binwidth = 2, aes(fill = DESCCATEGORIA), color = "black")

## sem legenda
b + geom_histogram(binwidth = 2, aes(fill = DESCCATEGORIA), color = "black", show.legend = FALSE)

## TItulo
b + geom_histogram(binwidth = 2, aes(fill = DESCCATEGORIA)) + 
  labs(x = "DAP (cm)", y = "Densidade", title = "Histograma do DAP") + 
  coord_cartesian(xlim = c(10,25), ylim = c(0, .3)) 

## Curva de densidade
b + geom_histogram(binwidth = 2, aes(fill = DESCCATEGORIA)) + 
  labs(x = "DAP (cm)", y = "Densidade", title = "Histograma do DAP") +
  geom_density(color = "grey32")

b + geom_histogram(binwidth = 2) + 
  labs(x = "DAP (cm)", y = "Densidade", title = "Histograma do DAP") + 
  coord_cartesian(xlim = c(10,25), ylim = c(0, .3)) + 
  geom_density(color = "grey32") 

## Podemos utilizar subsetting com uma variavel categorica
b + geom_histogram(binwidth = 2) + 
  labs(x = "DAP (cm)", y = "Densidade", title = "Histograma do DAP") + 
  geom_density(color = "grey32") + 
  facet_grid(.~DESCCATEGORIA)

b + geom_histogram(binwidth = 2) +
  labs(x = "DAP (cm)", y = "Densidade", title = "Histograma do DAP") + 
  geom_density(color = "grey32") + 
  facet_grid(.~CODTALHAO)

b + geom_histogram(binwidth = 2, aes(fill = DESCCATEGORIA)) + 
  labs(x = "DAP (cm)", y = "Densidade", title = "Histograma do DAP") +
  coord_cartesian(xlim = c(10,25), ylim = c(0, .7)) +
  geom_density(color = "grey32") + 
  facet_grid(.~CODTALHAO)

b + geom_histogram(binwidth = 2, aes(fill = DESCCATEGORIA)) + 
  labs(x = "DAP (cm)", y = "Densidade", title = "Histograma do DAP") +
  coord_cartesian(xlim = c(10,25), ylim = c(0, .7)) +
  geom_density(color = "grey32") + 
  facet_grid(.~CODTALHAO)
## ## 10.3) Boxplot ####

## Boxplot da altura em função da qualidade da árvore
c <- ggplot(dados_g, aes(x = DESCCATEGORIA, y = ALT1)) +
  theme_bw(base_family = "serif") +
  theme(
    legend.position = "bottom", 
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    panel.border = element_blank(), 
    plot.title = element_text(size = 26, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 26, face = "bold"), 
    axis.text = element_text(size = 23), 
    axis.line.x = element_line(color = "black"), 
    axis.line.y = element_line(color = "black"), 
    strip.text.x = element_text(size = 22,face = "bold"), 
    legend.text = element_text(size = 20), 
    legend.title = element_text(size = 22, face="bold") ) + 
  scale_colour_grey(start = 0.6, end = 0.2) +
  scale_fill_grey(start = 0.6, end = 0.2)

## Boxplot basico
c + geom_boxplot()

## cor personalizada
c + geom_boxplot(color = "red")

## Preenchimento personalizado
c + geom_boxplot(fill = "steelblue")

## TItulo
c + geom_boxplot(fill = "steelblue") +
  labs(x = "Categoria", y = "Altura (m)", title = "Boxplot para Altura")

## Adicionar ponto de media
c + geom_boxplot(fill = "darkgray") +
  labs(x = "Categoria", y = "Altura (m)", title = "Boxplot para Altura") + 
  stat_summary(fun.y=mean, geom="point", shape=18, size = 4, show.legend=FALSE)

## Podemos utilizar subsetting com uma variavel categorica (factor)
c + geom_boxplot(fill = "darkgray") +
  labs(x = "Categoria", y = "Altura (m)", title = "Boxplot para Altura") + 
  stat_summary(fun.y=mean, geom="point", shape=18, size = 4, show.legend=FALSE) + 
  facet_grid(.~CODTALHAO) 

## Normalmente, ggplot2 nao plota boxplots sem categoria;
## Podemos improvisar e criar uma categoria falsa
ggplot(dados_g2, aes(x = factor(0), y = ALT1)) + 
  geom_boxplot(fill = "darkgray") +
  labs(x = "Categoria", y = "Altura (m)", title = "Boxplot para Altura") + 
  stat_summary(fun.y=mean, geom="point", shape=18, size = 4, show.legend=FALSE) + 
  facet_grid(.~CODTALHAO) 

## ## 10.4) Linhas ####

## Dado utilizado: Orange: Crescimento de árvores de laranja.
head(Orange,10)

## Gráfico da circunferência em função da idade.
##
## Primeiro cira-se a base do gráfico
d <- ggplot(Orange, aes(x = age, y = circumference)) +
  theme_bw(base_family = "serif") +
  theme(
    legend.position = "bottom", 
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    panel.border = element_blank(), 
    plot.title = element_text(size = 26, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 26, face = "bold"), 
    axis.text = element_text(size = 23), 
    axis.line.x = element_line(color = "black"), 
    axis.line.y = element_line(color = "black"), 
    strip.text.x = element_text(size = 22,face = "bold"), 
    legend.text = element_text(size = 20), 
    legend.title = element_text(size = 22, face="bold") ) + 
  scale_colour_grey(start = 0.6, end = 0.2) +
  scale_fill_grey(start = 0.6, end = 0.2)

d + geom_line() 

# Linhas por árvore
d + geom_line(aes(linetype=Tree), size=1) +
  labs(x = "Idade", y = "Circunferência", linetype="Árvore" )

## ## 10.5) Exportar Graficos ####

## Podemos combinar graficos feitos com o pacote ggplot2 pelo comando grid.arrange
## Para isso salvamos os graficos desejados em variaveis

disp <- a + geom_point(size = 4, aes(color=DESCCATEGORIA)) +
  labs(x="DAP (cm)", y="Altura (m)", colour = "Categoria", title = "Grafico de Dispersao") +
  theme_bw(base_family = "serif") +
  theme(
    legend.position = "bottom", 
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    panel.border = element_blank(), 
    plot.title = element_text(size = 26, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 26, face = "bold"), 
    axis.text = element_text(size = 23), 
    axis.line.x = element_line(color = "black"), 
    axis.line.y = element_line(color = "black"), 
    strip.text.x = element_text(size = 22,face = "bold"), 
    legend.text = element_text(size = 20), 
    legend.title = element_text(size = 22, face="bold") ) +
  coord_cartesian(ylim = c(15,35)) +
  geom_smooth(method = "lm", color = "red", se=FALSE) +
  facet_grid(.~CODTALHAO) + 
  scale_colour_grey(start = 0.6, end = 0.2)

boxp <- c + geom_boxplot(fill = "darkgray") +
  labs(x = "Categoria", y = "Altura (m)", title = "Boxplot para Altura") + 
  stat_summary(fun.y=mean, geom="point", shape=18, size = 4, show.legend=FALSE)

hist1 <- b + geom_histogram(binwidth = 2) + 
  labs(x = "DAP (cm)", y = "Densidade", title = "Histograma do DAP") + 
  geom_density(color = "grey32") + 
  facet_grid(.~DESCCATEGORIA)

hist2 <- b + geom_histogram(binwidth = 2) + 
  labs(x = "DAP (cm)", y = "Densidade", title = "Histograma do DAP") + 
  coord_cartesian(xlim = c(10,25), ylim = c(0, .3)) + 
  geom_density(color = "grey32") 

## Para salvarmos o grafico, basta usar o comando ggsave
## Por padrao este comando salva o ultimo grafico gerado
## para salvarmos um objeto especifico, basta indica-lo na função:
##
## Salvar um dos graficos gerados pelo ggplot2

ggsave("disp.jpeg",  disp, width = 12, height = 10)
ggsave("boxp.jpeg",  boxp, width = 12, height = 10)
ggsave("hist1.jpeg",  hist1, width = 12, height = 10)
ggsave("hist2.jpeg",  hist2, width = 12, height = 10)


##
## # 11) Atividade ####
## Base de dados utilizada:
##
## iris: Composta por comprimento e largura de sépalas e pétalas de 3 espécies de flores.
##

iris

## 1) 
##
## Calcular o comprimento médio das pétalas da espécie virginica
mean(iris[iris$Species=="virginica", "Petal.Length"], na.rm=T)

## 2) 
##
## Criar um Gráfico de dispersão do comprimento da pétala em função do comprimento da sépala,
## por espécie, com linha de tendência linear

base_grafico <- ggplot(iris, aes(x=Petal.Length, y = Sepal.Length)) +  
  theme_bw(base_family = "serif") +
  theme(
    legend.position = "bottom", 
    panel.grid.major = element_blank(), 
    panel.grid.minor = element_blank(),
    panel.border = element_blank(), 
    plot.title = element_text(size = 26, face = "bold", hjust = 0.5),
    axis.title = element_text(size = 26, face = "bold"), 
    axis.text = element_text(size = 23), 
    axis.line.x = element_line(color = "black"), 
    axis.line.y = element_line(color = "black"), 
    strip.text.x = element_text(size = 22,face = "bold"), 
    legend.text = element_text(size = 20), 
    legend.title = element_text(size = 22, face="bold") ) 

base_grafico + geom_point()

base_grafico + geom_point() + geom_smooth(method = "lm")

base_grafico + geom_point(aes(color=Species)) + geom_smooth(method = "lm")

base_grafico + geom_point(aes(color=Species)) + geom_smooth(aes(color=Species),method = "lm")


iris

## # 12) Exportar dados ####

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
write.csv2(iris, "iris.csv") 

## Por padrão os nomes das linhas são inseridas no arquivo. Para que isto não aconteça,
## utiliza-se row.names = FALSE:
write.csv2(dados, "iris.csv", row.names = FALSE)

