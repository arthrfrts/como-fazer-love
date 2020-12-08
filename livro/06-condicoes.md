# Capítulo 6 – Condições

> Nós usaremos o código do capítulo anterior.

Com condições *se… senão*, nós podemos executar partes do código apenas quando uma condição for alcançada.

Você pode criar uma condição *se* assim:

```lua
if condicao then
	-- código
end
```

Uma condição, ou declaração *se…*, é algo que pode ser verdadeiro ou falso.

Por exemplo: `5 > 9`

O `>` significa “maior que”, então a declaração de que 5 é maior que 9 é falsa.

Coloque uma declaração ao redor do código que aumenta x:


```lua
function love.update(dt)
	if 5 > 9 then
		x = x + 100 * dt
	end
end
```

Quando você executar o jogo, você vai notar que seu retângulo não vai se mover. Isso acontece porque a declaração é falsa. Se nós mudarmos a declaração para `5 < 9` (5 é menor que 9), então a declaração vai ser verdadeira, e o código dentro da condição será executado.

Com isso, nós podemos fazer `x` alcançar até 600, e então parar de se mover, com `x < 600`:
```lua
function love.update(dt)
	if x < 600 then
		x = x + 100 * dt
	end
end
```

![](//raw.githubusercontent.com/arthrfrts/como-fazer-love/master/images/book/6/rectangle_stop.gif)

Se nós quisermos verificar se um valor é igual a outro valor, nós precisamos usar dois símbolos de igualdade (`==`).

Por exemplo: `4 == 7`.

Usamos um sinal de igualdade para **atribuição**, e dois sinais de igualdade para **comparação**.

```lua
x = 10 -- Atribui 10 ao valor de x.
x == 10 -- Compara 10 com o valor de x.
```

Nós também podemos usar `>=` e `<=` para verificar se valores são maiores ou iguais ou menores ou iguais a outro.

```lua
10 <= 10 -- verdadeiro, 10 é igual a 10
15 >= 4 --t verdadeiro, 15 é maior que 4
```

## Booleanos

Uma variável também pode ver verdadeira (`true`) ou falsa (`false`). Esse tipo de variável é o que chamamos de um *booleano*.

Vamos criar uma nova variável chamada `move` com o valor `true` e verificar se `move` é verdadeiro em nossa condição:

```lua
function love.load()
	x = 100
	move = true
end

function love.update(dt)
	-- Remember, 2 equal signs!
	if move == true then
		x = x + 100 * dt
	end
end
```

`move` é `true`, então nosso retângulo se mexe. Mas `move == true` é, na verdade, redundante. Nós estamos verificando se é verdade que o valor de `move` é verdadeiro. Nós podemos usar simplesmente `move` como uma declaração:


```lua
if move then
	x = x + 100 * dt
end
```

Se nós quisermos verificar se `move` é falso (`false`), nós podemos colocar um `not` na sua frente:

```lua
if not move then
	x = x + 100 * dt
end
```

S nós quisermos verificar se um número **não é igual** a outro número, nós usamos um til (`~`).

```lua
if 4 ~= 5 then
	x = x + 100 * dt
end
```

Nós também podemos atribuir `true` ou `false` à uma variável com uma declaração.

Por exemplo: `move = 6 > 3`.

Se nós verificarmos se `move` é verdadeiro, e então mudarmos `move` para falso em uma declaração *se…*, nós não seremos chutados para fora da condição. Todo o código abaixo será executado:

```lua
if move then
	move = false
	print("Isso vai ser executado!")
	x = x + 100 * dt
end
```

## Teclas de seta

Vamos fazer o retângulo se mover se a tecla de seta direita estiver sendo pressionada. Para isso nós usaremos a função [`love.keyboard.isDown`](https://www.love2d.org/wiki/love.keyboard.isDown).


Note como o “D” de “Down” está em letra maiúscula. Esse é um tipo de grafia que chamamos *camelCasing*, nós começamos a primeira palavra com letra maiúscula, e então a letra inicial de cada palavra começa com letra maíscula. Esse é o tipo de grafia que nós vamos adotar também em nossas variáveis durante esse tutorial.

Nós passamos a string `right` como um argumento para verificar se a seta direita está pressionada:

```lua
if love.keyboard.isDown("right") then
	x = x + 100 * dt
end
```

Agora nosso retângulo só vai se mover quando a tecla de seta direita estiver pressionada.

![](/images/book/6/rectangle_right.gif)

Nós também podemos usar `else` (“senão”) para instruir o nosso jogo a fazer algo quando a condição for falsa. Vamos fazer o nosso retângulo se mover para a esquerda quando nós não estivermos pressionando o botão para a direita:

```lua
if love.keyboard.isDown("right") then
	x = x + 100 * dt
else
	x = x - 100 * dt -- Nós diminuímos o o valor de x.
end
```

Nós também podemos verificar se outra declaração é verdade depois que a primeira for considerada falsa, com `elseif` (“senão, se”). Vamos fazer isso: se o botão para a direita não estiver pressionado, verificar se o botão para a direita está:

```lua
if love.keyboard.isDown("right") then
	x = x + 100 * dt
elseif love.keyboard.isDown("left") then
	x = x - 100 * dt
end
```

Tente fazer o retângulo se mover para cima e para baixo também.

***

## `and` (e) & `or` (ou)

Com `and` (“e”) nós podemos verificar se várias declarações são verdadeiras.

 ```lua
if 5 < 9 and 14 > 7 then
	print("As duas declarações são verdadeiras")
end
```

Com `or` (“ou”), a condição será executada se alguma das declarações for verdadeira:

 ```lua
if 20 < 9 or 14 > 7 or 5 == 10 then
	print("Uma dessas declarações é verdadeira")
end
```

***

## Mais uma coisinha

Para ser mais preciso, condições verificam se declarações **não são** `false` ou `nil`.

```lua
if true then print(1) end -- Não é falso ou nulo, será executado.
if false then print(2) end -- Falso, não será executado.
if nil then print(3) end -- Nulo, não será executado.
if 5 then print(4) end -- Não é falso ou nulo, será executado.
if "hello" then print(5) end -- Não é falso ou nulo, será executado.
-- Resultado: 1, 4, 5
```

***

## Resumo

Com condições e declarações nós permitimos que partes do código só sejam executadas quando uma condição for atendida. Nós podemos verificar se um número é maior, menor ou igual a outro número/valor. UMa variável também pode ser verdadeira ou falsa. Esse tipo de variável é o que chamamos de *booleano*. Nós podemos usar `else` para dizer ao nosso jogo o que executar quando uma declaração for falsa, ou `elseif` para fazer outra verificação.