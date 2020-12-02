# Capítulo 2 – Variáveis

Nós podemos fazer aritmética com programação.

O que é 3 + 4?

*É 7!*

Pode ser, mas vamos testar isso. Nós podemos usar `print` para fazer o número aparecer no console de resultados:

```lua
print (3 + 4)
-- Resultado: 7
```

Execute seu código (pressione F6 e feche a janela para exibir o resultado) e seu console deve exibir `7`.

Legal! Agora, o que é a + b?

*Hmm…*

Bem, pode ser qualquer coisa. Isso porque “a” e “b” não têm valor. Vamos mudar isso.

```lua
a = 5
b = 3
```

Vamos dar uma olhada nisso: o que é a + b? O que nós estamos perguntando é “qual o valor de a + o valor de b?”. Em outras palavras, o que é 5 + 3? É 8.

Mas vamos provar que a + b é 8 exibindo-o no console:

```lua
a = 5
b = 3
print(a + b)
-- Resultado: 8
```

Execute seu código de novo.

Aqui, `a` e `b` são o que chamamos de *variáveis*. Uma variável é uma palavra que você pode armazenar um valor. O número 3 sempre será 3, e 7 sempre será 7, mas uma variável pode ser qualquer coisa que você quiser. Por isso o nome, “variável”.

A palavra em que você pode armazenar um valor pode ser qualquer coisa:

```lua
ovelha = 3
teste = 20
CALCA = 1040
asdfghjkl = 42
```

Variáveis diferem maiúsculas de minúsculas. Isso significa que quando você tem uma mesma palavra escrita de formas diferentes, elas não serão consideradas iguais. Por exemplo:

```lua
ovelha = 3
OVELHA = 10
oVeLhA = 200
```

são três variáveis diferentes, cada uma com seu próprio valor.

Você pode fazer muito mais do que apenas somar números:

```lua
a = 20 - 10 -- Subtração
b = 20 * 10 -- Multiplicação
c = 20 / 10 -- Divisão
d = 20 ^ 10 -- Exponenciação
```

Usamos pontos para números com decimais:

```lua
a = 10.4
b = 2.63
c = 0.1
pi = 3.141592
```

Dê uma olhada nesse código:

```lua
X = 5
Y = 3
Z = X + Y
```

Primeiro nós dizemos que `X = 5`. Quando damos um valor à uma variável, chamamos isso de *atribuição*. Nós *atribuímos* 5 à `X` e 3 à `Y`. Em seguida, atribuímos `X + Y` à Z, então agora `Z` é 8. Lembre-se que você sempre pode verificar o valor de uma variável com `print`.

Se nós mudarmos os valores de `X` e `Y` depois de atribuirmos `Z` isso não afetará seu valor, que continuará sendo 8.

```lua
X = 5
Y = 3
Z = X + Y
X = 2
Y = 40
print(Z)
-- Resultado: 8
```

Isso acontece porque, para o computador, `Z` não é `X + Y`, é 8 — o resultado da soma daqueles valores naquele momento do código.

***

## Strings

Uma variável também pode armazenar texto.

```lua
text = "Olá Mundo!"
```

Isso é o que chamamos de *string* (fio em inglês), porque é um fio de caracteres.

Nós podemos conectar strings usando dois pontos (`..`):

```lua
nome = "Daniel"
idade = "25"
texto = "Olá, meu nome é " .. nome .. ", e eu tenho " .. idade .. " anos."
print(texto)
-- Resultado: "Olá, meu nome é Daniel, e eu tenho 25 anos."
```

***

## Regras de nomeação de variáveis

Existem algumas regras quando nomeamos uma variável. Antes de tudo, sua variável pode ter um número, mas não pode começar com um:

```lua
teste8 -- OK
tes8te -- OK
8teste -- Não permitido.
```

O nome da sua variável também não pode conter nenhum caractere especial ou acentuação, como `@#$%^&*`.

E, finalmente, o nome de sua variável não pode ser uma **palavra-chave**. Palavras-chave são palavras reservadas usadas pela linguagem de programação. Aqui vai uma lista de palavras-chaves:

```
and       break     do        else      elseif
end       false     for       function  if
in        local     nil       not       or
repeat    return    then      true      until     while
```

***

## Uso

Variáveis podem ser usadas para manter um controle dos valores. Por exemplo, você pode ter uma variável `pontos` onde toda a vez que nós ganhamos um ponto, você pode fazer `pontos = pontos + 1`.

***

## Resumo

Variáveis são palavras em que armazenamos um valor como um número ou um texto. Você pode nomeá-las da forma que quiser, com algumas exceções. Variáveis diferenciam maiúsculas de minúsculas.