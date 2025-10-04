//Como no nosso jogo não possui câmera, não precisamos escolher entre draw ou draw GUI

/*
Bom, aqui usaremos algumas funções, mas já vamos aproveitar e também falar sobre a padrão de indentificar
os nomes da função
Neste objeto, queremos desenhar a quantidade de pontos, sendo estes um texto
Então temos duas plavras chaves, desenhar e texto, ou seja, iremos desenhar um texto
Fazendo a tradução direta, termos as palavras draw(desenhar) e text(texto), então podemos checar
Pela existencia da função draw_text()
E ela exite mesmo
Em assim, que muitas funções dá para se descobrir apenas pelas traduções leterais
Por exemplo, um padrão é que qualquer função para desenhar começa com a palavras draw
E funções que tenha a ver com o texto(conteúdo), terão a palavra text envolvida
As funções que tem algo a ver com a fase, geralmente conteram room no nome e assim por diante
Bom, agora queremos criar uma varivel que contenha a seguinte mensagem ("Pontos: " a quantidade de pontos)
Neste caso, podemos pensar que é simples fazer isto, é só criar uma variavel  e receber "Pontos: " + global.pontos
Mas há um problema nisto, pois o tipo der globnal.pontos não é um texto/String, ele é uma valor do tipo inteiro, 
certo?
Então, antes de somar este texto, termos que converter o valor inteiro em um valor de texto, 
para isto, usaremos a função string()
Descrição da função:
function string(val_or_format: Any, [...: Any*]) -> String
With this function you can turn any value into a string.
val_or_format The value to be turned into a string or a format string.
			  Values to replace the placeholders with.

Tradução:
Função string(val_or_format: qualquer, [....: qualquer*]) retorno do tipo String
Com esta função, você consegue tornar qualquer valor em um valor string.
val_or_format O valor que queira tornar em string ou no formato string
			  Valores para substituir os placehorders
No nosso caso, usaremos a função deste jeito
mensagem = "Pontos: " + string(global.pontos)
*/
mensagem = "Pontos: " + string(global.pontos) + " de " + string(global.quantidadeColetaveis)

/*
Agora iremos usar o draw_text() passando a mensagem como o texto
Descrição da função:
function draw_text(x: Real, y: Real, string: Any) -> Undefined
With this function you can draw any string at any position within the room (for drawing real -
- numbers you should use the string() function to convert them into text).
X The x coordinate of the drawn string.
Y The y coordinate of the drawn string.
string The string to draw.

Tradução:
Função draw_text(x: valor real, y: valor real, string: qualquer valor) retorno indefindop ou vazio
Com esta função, você consegue desenhar qualquer string em qualquer posição da room (Para desenhar números
reais vocÊ deverá usar a função string() para converter eles em texto)
X O da cordenada x do desenho da string
Y O da cordenada y do desenho da string
string O valor string a ser desenhado
No nosso caso, já usamos a função string, agora é só fazer o comando
*/
draw_text(x, y, mensagem)