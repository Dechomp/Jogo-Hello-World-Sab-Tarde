/*
Aqui nós queremos que toda vez que eu encostar nos objetos coletaveis eles desapareçam
E aumente a quantidade de pontos em 1
Para fazer desaparecer, iremos usar a mesma função usada para destruir a instancia do objPlayer
Com algumas alterações
Descrição da função instance_destroy() no objPlayer.Colission_objInimigo linha 6
Lembrando que quando chamamos a função sem parametros, o pdarão e destruir a instancia a qual
A chamou, mas se fizermos isto, irá destruir o instacia do player, então teremos que mandar
Um parametro que identifique a instacia do objColetavel
Quando nós estamos em um evento de colisão, está parte fica mais "fácil", pois apenas precisamos
mandar dentro do paremetro o other, pois ele já identificará a outra instancia
Futuramente, iremos usar um método que identifica qual é a instacia com outra função
*/
instance_destroy(other)

/*
Então a parte de destruir os coletáveis esta feita, o que iremos fazer agora é criar os pontos e mostra-los
Dentro do jogo
Para criamos os pontos, teoricamente, iriamos criar apenas uma variável, o problema disto, é que não poderiamos
Acessar este valor de outros objetos, para podermos usar este valor em quaisquer outros objetos, criaremos uma 
variável global, que é bem simples, é só antes de criar a variável, colocar "global."
Então para criar seria gloabl.nomeVariável
No nosso caso, no evento de create do player, iremos criar a variável global.pontos recebendo 0
E quando colidirmos com um objColetavel, aumentaremos a quantidade de pontos em 1
*/

//Agora aumentaremos a quantidade de pontos sempre em 1, pois ao usar ++ ele incrementa o valor anterior em 1
global.pontos++
//Bom, criamos a variável, mas não conseguimos vê-la, para isto, criaremos um novo objeto que ficará resposável
//para mostrar o valor atual da variável