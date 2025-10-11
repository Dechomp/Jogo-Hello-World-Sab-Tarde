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
	
	/*
	Troca da direção da imagem
	Uma das propriedades do objeto é a image_xscale
	O que ela faz? Ela mexe com o tamanho horizontal da imagem
	Ou seja, se aumentarmos o tamhanho da imagem horizontalmente
	O valor de image_xscale aumentará junto
	Sendo o valor padrão dele começando em 1, ou seja, todo
	objeto tem o seu valor de tamanho em 1 de largura e 1 de altura
	Comparando a imagem normal
	Exemplo: uma imagem que possui 32x32 pixes, o objeto pegará esta
	escala de 1 para 1
	Mas porque mexeremos com este valor?
	Pois este valor pode ser negativo, por tanto ela iverterá a direção
	da imagem, por exemplo, o meu sprite, normalmente olha para direita
	Então, se eu quiser que ele olhe para esquerda, basta inverter
	O valor que há no image_xscale
	Então, se o valor normal é de 1x1, siginifica que para olhar para 
	esquerda vai ser -1x1
	Se inverter o valor da altura, fará ela ficar de cabeça para baixo
	No player, não usaremos isto, mas no meu inimigo sim
	*/
	//Jeito mais fácil porém não global
	//image_xscale = -1
	
	//Jeito global
	//image_xscale *= -1
	/*
	Mas antes de inverter, temos que verificar se eu já não estou olhando
	Para esta direção, se não, ficaremos invertendo infinitamente
	Para fazer isto é simples
	Só precisamo verificar se o valor de image_xscale é maior ou menor do valor
	que queremos, exemplo, sabemos que ára a esquerda o valor tem q ser
	negativo, ou seja, menor que 0, enão só precisamos verificar se o valor esta
	mais do que isto
	*/
	if image_xscale > 0{
		image_xscale *= -1
	}
	
}

//Para direita, o meu x tem que aumentar
if keyboard_check(vk_right) or keyboard_check(ord("D")){
	x+= velocidade
	
	//Jeito mais fácil porém não global
	//image_xscale = 1
	
	if image_xscale < 0{
		image_xscale *= -1
	}
}

/*
Bom, agora que criamos os pontos, eu quero que toda vez que eu coletar todos os coletáveis da sala, mude
para próxima sala.
Aqui, podemos fazer dois caminhos, o primeiro é sempre ter um número fixo de coletáveis na tela, por exemplo 5
Ou seja, deste jeito, obrigátória mente, teriamos que ficar limitado a 5 coletáveis no jogo, e não pedriamos 
nem colocar a mais ou a menos, por isso, vamos usar uma forma que, conte a quantidade de coletáveis, na sala
E quando a quantidade de pontos ser igual a quantidade de coletáveis na tela, iremos para a próxima sala
A método que iremos usar, é criar uma variável global, e toda vez que eu adicionar mais uma instancia do objColetavel
Aumente em 1 a quantidade total
*/

/*
Agora com o sistema de pontuação implementado, vamos começar a mudança de fases
No nosso jogo a condição vai ser de coletar todos as instancias do objColetaveis
E assim que chegar, mudamos de fase
*/
if global.pontos == global.quantidadeColetaveis{
	//E aqui começamos a mudança de fases
	/*
	Para fazermos as mundaças de fase, temos algumas opções:
	Primeira opção, usar a variável do sistema "room"
	room é aonde fica a fase atual, caso você coloque ela para receber
	Outra fase, ela irá para lá
	Exp: room = rmFase2
	Ou seja, toda vez que chegarmos na pontuação total, iremos para
	rmFase2
	A primeira coisa a se observer, é que a quantidade de pontos totais é
	informada incorretamente
	Pois mostra a quantidade anterior mais a quantidade atual
	Isto acontece pois colocamos que, quando a váriável global quantidadeColetaveis
	Já existir, apenas somamos os pontos, e acaba interferindo no processo
	De troca de fases
	Então a primeira atualização deve ser que, toda vez que mexermos com algo
	Relacionado a transição ou reset da fazes, temos que zerar todas as variáveis
	relacionadas com o inicio de uma fase
	
	Outra coisa que percebemos, é que quando chamos na rmFase2, continuamos nela
	Uma das formas de resolver, seria colando infinitos if e elsa, o que não é recomendado
	Então para a troca de fases, usaremos uma função
	No caso, as mais comuns são a room_goto(), a room_goto_next(), e para voltar 
	seria a room_goto_previus()
	Resumidamente:
	room_goto(): Vai para uma fase usando o número da sequencia de onde ela esta
	Ou seja, se eu quiser ir para uma fase especifica, eu usa ela
	Exemplo, eu sei que a primeira fase, é tela de menu, quando eu quiser ir para
	tela de menu, eu coloco room_goto(0)
	Mas como saber qual é o número da fase? 
	Primeiramente, as fases funcionam como um vetor, ou seja, elas ficam
	Ordenadas, com a primeira posição sendo a posição 0, a última sendo a quantidade
	de fases menos 1,(Exp: se tiver 3 fases, a ultima fase esta na posição 2,
	se tiver 10, na posição 9, se tiver 127, na posição 126)
	Segundamente, para descobrir a posição, é só ir em room_order no framework
	room_goto_next(): Vai para a próxima sala na ordem
	Ou seja, se estiver na sala 1, ela vai para a sala 2, e assim por diante
	Exemplo, em um jogo, geralmente ao terminar uma fase, nós temos 3 botões
	Geralmente o primeiro vai para a fase de menu, o segundo reinicia a fase
	e o terceiro e de ir para a próxima fase
	Por fim, a função room_goto_previus():
	Ela vai para a fase anterior na lista
	Exemplo, em um jogo de rpg, quando você entra em uma dungeon e depois sai dela
	Se aonde você estava for a fase anterior a dungeon, é só usar esta função
	Certo, dito tudo isto, qual vocês acham mais viável para o nosso jogo?
	Ok, iremos de room_goto_next()
	Descrição:
	function room_goto_next() -> Undefined
	With this function you can make your game go to the next one as listed in 
	the Room Manager at the time the game was compiled.
	
	Tradução:
	Função room_goto_next(sem parâmetos) retorno vazio ou indefinido
	Com esta função, você pode modificar o jogo para a próxima fase na lista
	do gerenciador de fases no momento que o jogo foi compilado
	*/
	global.quantidadeColetaveis = 0
	//room_goto_next()
	/*
	Após compilarmos, vimos que a função deu certo na primeira fase
	Mas da erro na segunda por não possuir uma próxima fase
	Para consetar isto, teremos que fazer a validação da fase atual
	Pois, somente quando não for a última fase, iremos para próxima
	E quando tivermos na última, voltaremos para a primeira
	Usaremos algumas váriaveis do sistema para isto
	A fasse atual, fica na variável room
	A primeira fase do jogo, fica em room_first
	A última fase do jogo, fica em room_last
	*/
	if room != room_last{
		room_goto_next()
	}
	else{
		room = room_first
	}
	
	
}


/*
Aqui vamos impedir do player sair pelos contos do jogo

Uma das propriedades do player é a posição X e Y
Elas são refentes aonde elas estão dentro da room
Então, vamos entender o que é sair da pelos cantos da fase
Falamos isto, quando o X ou Y ficam fora do campo visivel da sala
E os campos visiveis começam da posição 0 tanto do x quanto do Y
E vão até o valor da largura e da altura
Exemplo, no meu jogo, a largura da sala é de 1366 e a altura de 768
Então qual quer vai ser a nossa validação?
Vai ser se o X (plano horizontal) é menor que 0 (Mais a esquerda) ou
maior que a largura da sala(1366, mais a direita)
E se o Y(plano vertical) é menor que 0 (Mais em acima) ou maior que
a altura da sala (768, mais abaixo)
Caso qualquer um deste valores seja verdadeiro, é só somar o mesmo valor
invertido
Exemplo: Se eu sair para a esquerda, quer dizer que eu acabei de diminuir 
pelo valor de velocidade, para voltar ao campo visivel, é so eu somar
o valor de velocidade
*/
//Saida pela esquerda
if x < 0{
	x += velocidade
}
//Para direita
if x > room_width{
	x -= velocidade
}

//Para cima
if y < 0{
	y += velocidade
}

//Para baixo
if y > room_height{
	y -= velocidade
}
/*
Para finalizar, podemos assumir que todas as propriedade que são visiveis
Podem ser alteradas dentro de um código
*/