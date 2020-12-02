# Capítulo 3 – Funções

Funções armazenam pedaços de código. Isso permite que executemos esse código sempre que quisermos. Funções também são chamadas de **métodos**.

Existem duas formas de criar uma função:

```lua
exemplo = function ()
	print("Olá Mundo!")
end
```

Essa é a forma mais comum:

```lua
function exemplo()
	print("Olá Mundo!")
end
```

Você começa escrevendo a palavra-chave `function`, seguida pelo nome da função. Uma função é um tipo de variável, então as mesmas regras de nomeação de variáveis se aplicam para funções. O nome dessa função é `exemplo`. Depois do nome, nós colocamos um conjunto de parênteses `()`. Agora nós podemos colocar o código que queremos dentro de nossa função. Nesse caso, nós colocamos `print("Olá Mundo!")`. Quando a função estiver pronta, nós fechamos ela usando a palavra-chave `end`.

Note que quando você executar o código, você não verá nenhum “Olá Mundo!” em seu console. Isso acontece porque é necessário **executar a função**. Nós executamos uma função dessa forma:

```lua
exemplo()
-- Resultado: "Olá Mundo!"
```

Você só precisa escrever o nome da função seguido dos parênteses. Isso é o que chamamos de *chamada de função*.

***

## Parâmetros

Dê uma olhada nesse código:

```lua
function mostraNumero(num)
	print("Eu quero o número " .. num)
end

mostraNumero(15)
mostraNumero(2)
mostraNumero(44)
mostraNumero(100)

print(num)

-- Resultado:
-- "Eu quero o número 15"
-- "Eu quero o número 2"
-- "Eu quero o número 44"
-- "Eu quero o número 100"
-- nil
```

Dentro dos parênteses de uma função nós podemos adicionar o que chamamos de *parâmetros*. Parâmetros são variáveis temporárias que só existem dentro da função. Nesse caso, nós adicionamos o parâmetro `num`, e agora nós podemos usar `num` como outras variáveis.

Nós executamos nossa função várias vezes, cada vez com um número diferente, e cada vez ela exibiu a mesma frase com um número diferente. O número que colocamos dentro dos parênteses é o que chamamos de um *argumento*. Isso significa que, na primeira chamada de função, nós *passamos* o *argumento* 15 para o *parâmetro* `num`.

No final do nosso código nós imprimimos `num` fora da nossa função. Isso resulta em `nil`. Isso significa que `num` não possui valor. Não é um número, nem string, nem uma função. É nada. Como disse antes, parâmetros são variáveis que só existem dentro da função.

***

## Retornos

Funções podem retornar um valor que nós podemos armazenar em uma variável. Você pode retornar um valor usando a palavra-chave `return`.

```lua
function meDaCinco()
	return 5
end

a = meDaCinco()
print(a)
-- Resultado: 5
```

`a` possui o valor que a função `meDaCinco()` *retorna*.

Outro exemplo

```lua
-- Múltiplos argumentos e parâmetros são separados por vírgulas.
function soma(a, b)
	return a + b
end

print(soma(200, 95))
-- Resultado: 295
```

Nossa função `soma()` retorna a soma de `a` e `b`. Nós não precisamos armazenar o resultado da função em uma variável, nós podemos imprimi-la diretamente na tela.

***

## Uso

Muitas vezes você precisa executar certos trechos de código em vários lugares. Ao invés de copiar aquele código cada vez que você precisar usá-lo, você pode simplesmente adicionar uma chamada de função. Se precisarmos mudar o comportamento dessa função, nós só vamos precisar mudar em um lugar, ao invés de mudar em cada lugar onde o código é executado. Isso nos ajuda a evitar a repetir código. [Não se repita](https://pt.wikipedia.org/wiki/Don%27t_repeat_yourself) é um dos princípios mais importantes da programação.

***

## Resumo

Funções podem armazenar trechos de códigos que podemos executar a qualquer momento. Nós chamamos uma função escrevendo seu nome seguido de parênteses. Nós podemos colocar valores dentro desses parênteses. Esses valores são passados para os parâmetros da função, que são variáveis temporárias que só existem dentro da função. Funções também podem retornar um valor. Funções removem repetição (o que é uma coisa boa).