/*
Nós queremos toda que esncostar no inimigo, idependente se eu encostar encima
Ou embaixo dele, eu quero que o player morra e reincie a fase
Para isso, usaremops as funções instace_destroy() e a room_restart()
Descrição de cada uma:
instance_destroy():
function instance_destroy([id: Asset.GMObject OR Id. Instance OR Constant.All],-
- [execute_event_flag: Bool]) -> Undefined
You call this function whenever you wish to destroy an instance, normally -
-triggering a Destroy Event and also a Clean Up Event.
id The instance ID or object_index to destroy - 
- (optional, default is the calling instance) - 
execute_event_flag Set to true or false to perform the destroy event or not -
-(optional, default is true)
execute_event_flag	
Lembrando que instancia seria o "ser" e objeto o "categoria" do "ser"
Tradução:
A função instance_destroy([id da instancia(primeiro parametro): - 
- o objeto o qual voce quer destruir(as categorias) - 
- ou o id da instancia( o ser ) ou todas as constantes, ou seja, todas as instancias], - 
- [executar o evento permitido segundo parametro : valor booleano(true ou false)])  ->  - 
- retorno vazio ou indefinido
Voce chama esta função quando voce deseja destruir uma instancia, normamente desencadiando -
 - no evento de destruição da instancia como também o evento de limpeza
 *********Lembrando que eventos são quando algo acontece
1º id se refere a identificação do index do objeto que queira destruir(é opcional, o padrão -
 - é destuir a instacia que chamou esta função)
2º executar o evento permitido: se refere a permissão do evento ser executado ou não - 
 -  (opcional, pois o padrão é verdadeiro)
 
room_restart():
function room_restart() Undefined
This function will restart the current room, as if it had just been entered.

Função room_restart(sem parametro) e retorno indefindo ou vazio:
esta função irá reiniciar a sala atual, como se tivisse acabada de ser executada - 
(ou seja, como ela foi feita normalmente)
*/
instance_destroy()
room_restart()