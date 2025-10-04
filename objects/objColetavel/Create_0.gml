/*
Assim como criamos os pontos no objPLayer, aqui poderiamos também criar a quantidade de objColetavel direto
O problema é que, o evento de create, é realizado toda vez que uma nova instancia é criada
Quando fizemos isto com o objPlayer, não havia problema, pois tinhamos apenas uma instacia dele por fase
Então, como ele global.pontos recebia 0, era até melhor que substitui-se o valor anterior
Mas agora, temos mais de uma instacia por fase
Ou seja, teremos que achar um método para definir, se já há objColetaveis, e se exitir, vamos apenas
Aumentar a quantidade de em 1, se não existir, vamos criar a variável global.
Aqui não poderiamos checar a exitencia do objColetavel, pois quando chamarmos ele, a própria instacia
Do objColetavel já conta como existencia, e aí vai dar erro no jogo, posi ao tentar somar 1 com algo
Que não existe, dara erro, então usarmos outro método
Iremos usar uma função que checa a exitencia da varável global
Descrição:
function variable_global_exists(name: String) -> Bool
With this function you can check whether a global scope variable exists or not.
name The name of the global variable to check for (as a string)

Tradução:
Função variable_global_exists(name: valor String) retorno booleano
Com esta função, você consegue checar se no escopo a variavel global existe ou não
name O nome da variável global para checar a existencia (como uma string)

Então, se existir a variável global, aumentaremos o valor em 1, se não, deifinimos ela em 1
*/
if variable_global_exists("quantidadeColetaveis"){
	global.quantidadeColetaveis ++
}
else{
	global.quantidadeColetaveis = 1
}

//Na próxima aula, iremops confirgurar a troca de fase e também o rset dos pontos