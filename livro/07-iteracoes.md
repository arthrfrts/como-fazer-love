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

But what if we add or remove a value from a table? We would have to change the 3 into another number. For that we use `#fruits`. With the #-sign, we can get the length of a table. The length of a table refers to the number of things in that table. That length would be `3` in our case, since we have 3 entries: `apple`, `banana`, and `pear` in our `fruits` table.

```lua
function love.load()
	fruits = {"apple", "banana"}

	print(#fruits)
	--Output: 2

	table.insert(fruits, "pear")

	print(#fruits)
	--Output: 3

	for i=1,#fruits do
		print(fruits[i])
	end
end
```

Let's use this knowledge to draw all 3 fruits.

```lua
function love.draw()
	for i=1,#fruits do
		love.graphics.print(fruits[i], 100, 100)
	end
end
```

If you run the game you should see it draws all 3 fruits, except they're all drawn on the same position. We can fix this by printing each number on a different height.

```lua
function love.draw()
	for i=1,#fruits do
		love.graphics.print(fruits[i], 100, 100 + 50 * i)
	end
end
```

So now `"apple"` will be drawn on the y-position 100 + 50 * 1, which is 150. Then `"banana"` gets drawn on 200, and `"pear"` on 250.

![](/images/book/7/fruits.png)

If we were to add another fruit, we won't have to change anything. It will automatically be drawn. Let's add `"pineapple"`.

```lua
function love.load()
	fruits = {"apple", "banana"}
	table.insert(fruits, "pear")
	table.insert(fruits, "pineapple")
end
```

We can also remove values from our table. For that we use `table.remove`. The first argument is the table we want to remove something from, the second argument is the position we want to remove. So if we want to remove banana, we do the following:

```lua
function love.load()
	fruits = {"apple", "banana"}
	table.insert(fruits, "pear")
	table.insert(fruits, "pineapple")
	table.remove(fruits, 2)
end
```

When you run the game you'll see that banana is no longer drawn, and that pear and pinapple have moved up.

![](/images/book/7/shift.png)

When you remove a value from a table with `table.remove`, all the following items in the table will move up. So what was on position 3 is now on position 2 in the table. And what was on position 4 is now on position 3.

You can also add or change the values inside the table directly. For example, we can change `"apple"` into `"tomato"`:

```lua
function love.load()
	fruits = {"apple", "banana"}
	table.insert(fruits, "pear")
	table.insert(fruits, "pineapple")
	table.remove(fruits, 2)
	--The value of position 1 in the table becomes "tomato"
	fruits[1] = "tomato"
end
```

___

## ipairs

Back to the for-loops. There is actually another way, and an easier way to loop through the table. We can use an `ipairs` loop.

```lua
function love.load()
	fruits = {"apple", "banana"}
	table.insert(fruits, "pear")
	table.insert(fruits, "pineapple")
	table.remove(fruits, 2)
	fruits[1] = "tomato"

	for i,v in ipairs(fruits) do
		print(i, v)
	end
	--Output:
	--1, "tomato"
	--2, "pear"
	--3, "pineapple"
end
```

This for-loop loops, or what we also call *iterates*, through all the values in the table. The variables `i` tells us the position of the table, `v` is the value of that position in the table. It's basically a shorthand for `fruits[i]`. For example, in the first iteration the values for the variables  `i` would be `1` and `v` would be `"apple"`. In the second iteration, `i` and `v` would be `2` and `"pear"` respectively.

But how does it work? Why does the function `ipairs` allow for this? That is for another time. For now all you need to know is that `ipairs` is basically a shorthand for the following:

```lua
for i=1, #fruits do
	v = fruits[i]
end
```

Let's use `ipairs` for drawing our tables.

```lua
function love.draw()
	-- i and v are variables, so we can name them whatever we want
	for i,frt in ipairs(fruits) do
		love.graphics.print(frt, 100, 100 + 50 * i)
	end
end
```

___

## Summary
Tables are lists in which we can store values. We store these values when creating the table, with `table.insert`, or with `table_name[1] = "some_value"`. We can get the length of the table with `#table_name`. With for-loops we can repeat a piece of code a number of times. We can also use for-loops to iterate through tables.
