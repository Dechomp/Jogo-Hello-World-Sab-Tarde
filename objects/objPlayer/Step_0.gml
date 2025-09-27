/*
Aqui iremos codificar o processo de andar do player
Nós vamos a função keyboard_check()
Mas o que ela faz?
Primeiro vamos pegar a descrição dela
Uma dica, com o mouse encima da função ela irá mostrar uma descrição dela
Descrição:
function keyboard_check(key: Constant. VirtualKey OR Real) -> Bool
With this function you can check to see if a key is held down or not.
key The key to check the down state of.

Tradução:
A função keyboard_check(Key/Tecla: Constante. do teclado ou um valor real) -
- e retorno da função e do tipo booleano(true ou false)
Com esta função, voce consegue checar se uma tecla foi apertada ou não
E key/tecla é o parametro, e ela representa qual tecla voce deseja conferir

No nosso caso, nós queremos que toda vez que a tecla vk_up seja apertada, nós vamos diminuir
O valor de y em 3, afinal velocidade possui o valor de 3

Lembrando que y é referente ao plano vertical, e x ao plano horizontal
E como o ponto mais alto visivel é 0, nós teremos que nos aproximar dele, neste caso
Diminuindo o valor de y

E a função if, só funciona quando um valor é verdadeiro, ou seja, true
Então apenas quando eu apertar a tecla vk_up, (Que é a seta para cima do teclado), -
 - irá se movimentar para cima
 
O que é vk_, basicamente são todas as teclas do teclado que não são relacionadas ao idioma
Ou seja, tudo que não é letra ou acento
Mas e se quisermos apertar as letras? Como fazemos?
Vamos usar outra função, neste caso a função ord()
Descrição da função:
function ord(string: String) -> Real
This function takes a single character input string and returns the Unicode (UTF8) -
 - value for that character.
string The string with which to find the Unicode code.

Tradução:
Função ord(texto: Tipo String) -> retorno de valor Real(decimal)
Esta função pega um caracter unico dentro da string e retorna em valor Uncidode(UTF8) -
 - basicamente pega o valor real do endereço númerico daquela tecla
texto referece a letra a qual voce deseja achar em valor Unicode
Lembrando que valores das teclas de texto se encontram dentro de aspas - 
- e com a letra maiuscula
Exemplo keyboard_check(ord("W"))

Só que nós queremos que funcione se apertar a tecla W ou a seta para cima certo?
Neste caso, temos que adicionar uma condição de uma coisa ou outra
Sabendo como funciona, nós vamos usar qual, o and ou o or? o or
Ou seja, if keyboard_check(vk_up) or keyboard_chec(ord("W")){ Vá para cima }

Lembrando que no GameMaker funciona como uma matriz ou uma tabela do excel
*/
//Para cima, o meu y tem que diminuir
if keyboard_check(vk_up)   or keyboard_check(ord("W")){
	y -= velocidade
}
//Para baixo, o meu y tem que aumentar
if keyboard_check(vk_down) or keyboard_check(ord("S")){
	y += velocidade
}
//Para esquerda, o meu x tem que diminuir
if keyboard_check(vk_left) or keyboard_check(ord("A")){
	x -= velocidade
}

//Para direita, o meu x tem que aumentar
if keyboard_check(vk_right) or keyboard_check(ord("D")){
	x+= velocidade
}