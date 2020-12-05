# Capítulo 5 – Movimentando um retângulo

Agora a gente pode começar com o que eu gosto de chamar “a parte divertida”. Nós vamos começar a fazer as coisas se moverem!

Vamos começar com as três chamadas principais:

```lua
function love.load()

end


function love.update()


end


function love.draw()

end
```

Agora, vamos desenhar um retângulo.


```lua
function love.draw()
	love.graphics.rectangle("line", 100, 50, 200, 150)
end
```

![](//raw.githubusercontent.com/arthrfrts/como-fazer-love/master/images/book/5/rectangle.png)

O segundo e o terceiro argumento dessa função são as posições X e Y.

X significa “posicionamento horizontal na tela”. 0 é o canto esquerdo da tela.

Y significa “posicionamento vertical na tela”. 0 é o canto superior da tela.

![](//raw.githubusercontent.com/arthrfrts/como-fazer-love/master/images/book/5/coordinates.png)

Agora nós queremos fazer o retângulo se mover. É hora de começar a pensar como um programador. O quê, exatamente, precisa acontecer para que o retângulo se mova para a direita? A posição X precisa aumentar. 100, 101, 102, 103, 104, etc. Mas nós não podemos mudar 100 para 101, 100 é 100. Nós precisamos de algo que possa mudar para qualquer número que quisermos. Isso mesmo, uma **variável**!

Em `love.load`, crie uma nova variável chamada `x` e substitua o 100 em `love.graphics.rectangle` com `x`.

```lua
function love.load()
	x = 100	
end

function love.draw()
	love.graphics.rectangle("line", x, 50, 200, 150)
end
```

Agora a posição X do nosso retângulo é o valor de `x`.

Note que o nome da variável `x` é apenas um nome. A gente pode chamar ela de `sorvete`, `unicornio` ou qualquer outra coisa. Funções não se importam com o nome de uma variável, apenas com o seu valor.

Agora nós queremos fazer o retângulo se mover. Nós fazemos isso em `love.update`. Nós vamos aumentar o `x` em 5 a cada atualização. Em outras palavras, `x` precisa ser `x` + 5, e é exatamente o que nós vamos escrever:

```lua
function love.update()
	x = x + 5
end
```

Então agora quando `x` é 100, ele vai mudar `x` para ser 100 + 5. Então, na próxima atualização, `x` será 105 e `x` deverá mudar para 105 + 5, e assim por diante.

Rode o jogo, o retângulo vai começar a se mover.

![](//raw.githubusercontent.com/arthrfrts/como-fazer-love/master/images/book/5/rectangle_move.gif)

***

## Tempo delta

Nós temos um retângulo em movimento, mas temos um pequeno problema. Se você for executar o jogo em um computador diferente, o retângulo talvez se mova em uma velocidade difeente. Isso acontece porque nem todos os computadores atualizam com a mesma frequência, e isso pode causar problemas.

Por exemplo, digamos que o Computador A rode a 100 FPS (quadros por segundo), e Computador 8 rode a 200 FPS.

100 x 5 = 500

200 x 5 = 1000

Então, em um segundo, `x` aumentou para 500 no computador A, enquanto no computador B `x` aumentou para 1000.

Ainda bem que há uma solução para esse problema: tempo delta.

Quando LÖVE chama `love.update`, ele passa um argumento. Adicione o parâmetro `dt` (uma sigla para “delta time”) no `love.update`, e vamos exibí-lo.


```lua
function love.update(dt)
	print(dt)
	x = x + 5
end
```

Tempo delta é o tempo que se passou entre a atualização anterior e a atual. Então, em um computador A, que roda a 100 FPS, o tempo delta é em média 1 / 100, que é 0,01.

No computador B, o tempo delta seria 1 / 200, que é 0,005.

Em um segundo, o computador atualiza 100 vezes, e aumenta `x` em 5 a cada 0,01 segundo, enquanto o computador B atualiza 200 vezes e aumenta o `x` em 5 a cada 0,005 segundos.

100 x 5 * 0.01 = 5

200 x 5 * 0.005 = 5

Ao usar o o tempo delta, nosso retângulo se moverá na mesma velocidade em todos os computadores.

```lua
function love.update(dt)
	x = x + 5 * dt
```

Agora nosso retângulo se moverá 5 pixels por segundo em todos os computadores. Mude 5 para 100 e faça-o ir mais rápido.

***

## Resumo

Nós usamos uma variável que aumenta a cada atualização para fazer um retângulo se mover. Ao aumentar nós multiplicamos o valor adicionado com o tempo delta. O tempo delta é o tempo entre a atualização anterior e a atual. Usando o tempo delta é possível fazer com oque o retângulo se mova na mesma velocidade em todos os computadores.