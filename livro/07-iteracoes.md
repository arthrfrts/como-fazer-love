# Capítulo 7 – Tabelas e ciclos `for`

## Tabelas

Tabelas são listas em que nós podemos armazenar valores.

Você pode criar uma tabela com chaves `{ }`:

```lua
function love.load()
	frutas = {}
end
```

Nós acabamos de criar uma tabela chamada `frutas`. Agora nós podemos armazenar valores dentro dessa tabela. Existem várias formas de fazermos isso.

Uma dessas formas é colocarmos os valores dentro das chaves:

```lua
function love.load()
	-- Cada valor é separado por uma vírgula, assim como parâmetros e argumentos.
	frutas = {"maçã", "banana"}
end
```

Nós também podemos usar a função `table.insert`. O primeiro argumento é a tabela, o segundo argumento é o valor que nós queremos armazenar dentro dela.

```lua
function love.load()
	-- Cada valor é separado por uma vírgula, assim como parâmetros e argumentos.
	frutas = {"maçã", "banana"}
	table.insert(frutas, "pêra")
```

Agora, quando `love.load` for executado, nossa tabela terá os valores `"maçã"`, `"banana"` e `"pêra"` armazenados. Para provarmos isso, vamos exibir os valores na tela usando `love.graphics.print("texto", x, y)`.

```lua
function love.draw()
	-- Argumentos: (texto, posição x, posição y)
	love.graphics.print("Teste", 100, 100)
end
```

Quando você executar o jogo, você deverá ver o texto “Teste”.  Nós podemos acessar os valores em nossa tabela escrevendo o nome dela, seguido por colchetes (`[ ]`). Dentro desses colchetes, nós escrevemos a posição do valor que nós queremos.

![](//raw.githubusercontent.com/arthrfrts/como-fazer-love/master/images/book/7/table.png)

Como dito, tabelas são uma lista de valores. Primeiro, nós adicionamos `"maçã"` e `"banana"`, então esses estão na primeira e na segunda posição da lista. Depois nós adicionamos `"pêra"`, então ela está na terceira posição da lista. Na posição 4 não existe nenhum valor (por enquanto), já que nós só adicionamos três valores.

Então, se quisermos exibir `"maçã"`, nós precisamos pegar o primeiro valor da lista:

```lua
function love.draw()
	love.graphics.print(frutas[1], 100, 100)
end
```

Isso deve desenhar a palavra `"maçã"` na tela. Se você substituir `[1]` por `[2]` você deve ver `"banana"`, e com `[3]` você vai ter `"pêra"`.
Agora nós queremos desenhar as três frutas. Nós podemos usar a função `love.graphics.print` três vezes, cada vez com uma posição diferente…

```lua
function love.draw()
	love.graphics.print(frutas[1], 100, 100)
	love.graphics.print(frutas[2], 100, 200)
	love.graphics.print(frutas[3], 100, 300)
end
```

…mas imagine se nós tivéssemos 100 valores em nossa tabela. Por sorte temos uma solução para isso: ciclos `for`!

## Ciclos `for`

Um ciclo `for` é um modo de iterarmos por um pedaço de código um número específico de vezes.

Você pode criar um ciclo `for` assim:

```lua
function love.load()
	frutas = {"maçã", "banana"}
	
	table.insert(frutas, "pêra")
	
	for i = 1, 10 do
		print("Olá!", i)
	end
end
```

Se você executar o jogo, você verá `Olá! 1`, `Olá! 2`, `Olá 3`… no console, até chegar à 10.

Para criar um ciclo `for`, primeiro nós escrevemos `for`. Depois, nós escrevemos uma variável e atribuímos um valor numérico à ela. É aí que o ciclo `for` vai começar. A variável pode ter qualquer nome, mas é comum usarmos `i`. Essa variável só pode ser usada dentro do ciclo `for` (bem como funcionam funções e parâmetros). Depois, você escreve o número que deve ser alcançado. Por exemplo, `for i = 8, 18 do` vai começar em 6 e repetir o código até chegar em 18.

Também existe um terceiro número opcional, que é o valor pelo qual a variável vai ser somada. `for i = 6, 18, 4` seria percorrido como `6, 10, 14, 18`. Com isso você também pode executar ciclos `for` regressivos usando -1.

Nossa tabela começa em 1 e tem 3 valores, então nós vamos escrever:

```lua
function love.load()
	frutas = {"maçã", "banana"}
	
	table.insert(frutas, "pêra")
	
	for i = 1, 3 do
		print(frutas[i])
		
	end
end
```


Quando você executar o código, você verá que as três frutas serão imprimidas no console. No primeiro ciclo ele imprime `frutas[1]`, no segundo ciclo será `frutas[2]`, e no terceiro ciclo, `frutas[3]`.

## Editando tabelas

E se quisermos adicionar ou remover um valor de uma tabela? Nós teríamos que mudar o 3 para outro número. Para isso nós usamos `#frutas`. Com o símbolo `#`, nós podemos obter o comprimento de uma tabela. O comprimento de uma tabela se refere ao número de coisas dentro dela. Esse comprimento seria `3` no nosso caso, uma vez que nós temos três valores: `maçã`, `banana` e `pêra` na nossa tabela `frutas`.

```lua
function love.load()
	frutas = {"maçã", "banana"}
	
	print(#frutas)
	-- Resultado: 2
	
	table.insert(frutas, "pêra")
	
	print(#frutas)
	-- Resultado: 3
	
	for i = 1, #frutas do
		print(frutas[i])
	end
end
```

Vamos usar isso para desenhar as três frutas na tela.

```lua
function love.draw()
	for i = 1, #frutas do
		love.graphics.print(frutas[i], 100, 100)
	end
end
```

Se você executar o jogo, você verá que as três frutas estarão impressas na tela do jogo, porém imprimimos todas na mesma posição. Nós podemos corrigir isso imprimindo cada valor em uma altura diferente.

```lua
function love.draw()
	for i = 1,#frutas do
		love.graphics.print(frutas[i], 100, 100 + 50 * i)
	end
end
```

Agora, `maçã` será desenhado na posição Y = 100 + 50 * 1, que é 150. Já `banana` será desenhado em 200, e `pêra` em 250.

![](//raw.githubusercontent.com/arthrfrts/como-fazer-love/master/images/book/7/fruits.png)

Se adicionarmos outra fruta, não precisaremos mudar nada. Ela será impressa automaticamente. Vamos adicionar `"abacaxi"`.


```lua
function love.load()
	frutas = {"maçã", "banana"}
	table.insert(frutas, "pêra")
	table.insert(frutas, "abacaxi")
end
```

Nós também podemos remover valores de nossa tabela. Para isso, usamos `table.remove`. O primeiro argumento é a tabela na qual desejamos remover algo, e o segundo argumento é a posição do que nós queremos remover. Então, se quisermos remover `banana`, 'nós fazemos o seguinte: 

```lua
function love.load()
	frutas = {"maçã", "banana"}
	table.insert(frutas, "pêra")
	table.insert(frutas, "abacaxi")
	table.remove(frutas, 2)
end
```

Quando você executar o jogo novamente, você verá que `banana` não será desenhada mais, e `pêra` e `abacaxi` foram movidas para cima.

![](//raw.githubusercontent.com/arthrfrts/como-fazer-love/master/images/book/7/shift.png)

Quando você remove o valor de uma tabela com `table.remove`, todos os itens seguintes serão movidos para cima. Então algo que estava na terceira posição da tabela foi para a segunda, e o que estava na quarta posição foi para a terceira.

Você também pode adicionar ou alterar os valores dentro de uma tabela diretamente. Por exemplo, nós podemos substituir `maçã` por `tomate`:

```lua
function love.load()
	frutas = {"maçã", "banana"}
	table.insert(frutas, "pêra")
	table.insert(frutas, "abacaxi")
	table.remove(frutas, 2)
	-- Altera o valor da posição 1 para `tomate`:
	frutas[1] = "tomate"
end
```

***

## ipairs

Vamos voltar para os ciclos `for`. Existe um outro método mais fácil de percorrer uma tabela. Nós podemos usar um ciclo `ipairs`.

```lua
function love.load()
	frutas = {"maçã", "banana"}
	table.insert(frutas, "pêra")
	table.insert(frutas, "abacaxi")
	table.remove(frutas, 2)
	fruts[1] = "tomate"
	
	for i, v in ipairs(frutas) do
		print(i, v)
	end
	
	--[[ Resultado:
		1, "tomate"
		2, "pêra"
		3, "abacaxi"
	]]--
end
```

Esse ciclo `for` percorre, ou como chamamos **percorre** todos os valores na tabela. A variável `i` nos informa qual é a posição atual da tabela, enquanto `v` nos informa com o valor daquela posição. É uma maneira mais simples de escrever `frutas[i]`. Por exemplo, na primeira iteração os valores seriam `i = 1` e `v = "maçã"`. Na segunda iteração, os valores seriam `i = 2` e `v = "pêra"`, e assim por diante.

Mas como isso funciona? Por que a função `ipairs` permite isso? Vamos falar disso uma outra hora. Por agora, tudo o que você precisa saber é que `ipairs` é basicamente uma maneira mais simples de fazer o seguinte:

```lua
for i = 1, #frutas do
	v = frutas[i]
end
```

Vamos usar `ipairs` para desenhar nossa tabela:

```lua
function love.draw()
	-- `i` e `v` são variáveis, nós podemos nomeá-las como quisermos.
	
	for i, fruta in ipairs(frutas) do
		love.graphics.print(fruta, 100, 100 + 50 * i)
	end
end
```

***

## Resumo

Tabelas são listas em que podemos armazenar valores. Nós armazenamos esses valores ao criar a tabela; ou com `table.insert`, ou ainda com `nome_da_tabela[i] = "algum valor"`. Nós podemos obter o comprimento de uma tabela com `#nome_da_tabela`. Com ciclos `for` nós podemos repetir um pedaço de código um número de vezes. Nós também podemos usar ciclos `for` para percorrer tabelas.
