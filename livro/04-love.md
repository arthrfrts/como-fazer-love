# Capítulo 4 – LÖVE

## O que é LÖVE?

LÖVE é o que chamamos de *framework*. Simplesmente: é uma ferramenta que deixa a programação de jogos mais fácil.

LÖVE é feito com *C++* e *OpenGL*, ambos considerados bem difíceis. O código fonte de LÖVE é bastante complexo, mas toda essa complexidade deixa a criação de um jogo muito mais fácil para nós.

Por exemplo, com `love.graphics.ellipse()` nós podemos desenhar uma elipse. Esse é o código fonte por trás dela:

```cpp
void Graphics::ellipse(DrawMode mode, float x, float y, float a, float b, int points)
{
	float two_pi = static_cast<float>(LOVE_M_PI * 2);
	if (points <= 0) points = 1;
	float angle_shift = (two_pi / points);
	float phi = .0f;

	float *coords = new float[2 * (points + 1)];
	for (int i = 0; i < points; ++i, phi += angle_shift)
	{
		coords[2*i+0] = x + a * cosf(phi);
		coords[2*i+1] = y + b * sinf(phi);
	}

	coords[2*points+0] = coords[0];
	coords[2*points+1] = coords[1];

	polygon(mode, coords, (points + 1) * 2);

	delete[] coords;
}
```

Você pode não ter entendido nada desse código (eu mesmo entendo muito pouco), e é exatamente por isso que usamos LÖVE. Ele fica encarregado das partes mais difíceis da programação de jogos, e deixa a parte divertida para nós.

***

## Lua

Lua é a linguagem de programação que LÖVE usa. Lua é uma linguagem de programação independente, e não é feita para ou por LÖVE. Os criadores de LÖVE simplesmente escolheram Lua como a linguagem da framework deles.

Então que parte do que nós desenvolvemos é LÖVE, e qual parte é Lua? É bem simples de descobrir: tudo o que começa com `love.` é parte da framework de LÖVE, todo o resto é Lua.

Essas funções fazem parte da framework de LÖVE:

```lua
love.graphics.circle("fill", 10, 10, 100, 25)
love.graphics.rectangle("line", 200, 30, 120, 100)
```

E isso é Lua:

```lua
function test(a, b)
	return a + b
end
print(test(10, 20))
--Output: 30
```

Se continua sendo confuso para você, não tem problema. Essa não é a parte mais importante agora.

***

## Como LÖVE funciona?

> Você precisa ter instalado LÖVE a partir desse ponto. Volte para o [Capítulo 1](01-instalacao) se você não instalou ele ainda.

LÖVE chama três funções. Primeiro, ele carrega a função `love.load()`. É aqui que a gente cria nossas variáveis.

Depois disso ele chama as funções `love.update()` e `love.draw()`, repetidamente nessa ordem.

Então: `love.load()` &rarr; `love.update()` &rarr; `love.draw()` &rarr; `love.update()` &rarr; `love.draw()` &rarr; `love.update()`, e assim por diante.

Por baixo do capô, LÖVE chama essas funções, e nós às criamos e as enchemos de código. Isso é o que chamamos de um *callback*.

LÖVE é feito de *módulos*, como `love.graphics`, `love.audio` e `love.filesystem`. Existem cerca de quinze módulos, e cada módulo foca-se em uma coisa. Tudo o que é desenhado é feito pelo `love.graphics`, e tudo com som é feito pelo `love.audio`.

Por enquanto vamos nos focar em `love.graphics`.

LÖVE tem uma [wiki](https://www.love2d.org/wiki/Main_Page) com uma explicação para cada função. Digamos que a gente quer desenhar um retângulo. Na wiki nós vamos para [`love.graphics`](https://www.love2d.org/wiki/love.graphics), e na página a gente procura por “rectangle”. Nós vamos encontrar [`love.graphics.rectangle`](https://www.love2d.org/wiki/love.graphics.rectangle).

[![](//raw.githubusercontent.com/arthrfrts/como-fazer-love/master/images/book/4/rectangle.png "love2d.org/wiki/love.graphics.rectangle")](https://www.love2d.org/wiki/love.graphics.rectangle)

Essa página nos diz o que a função faz e quais os argumentos ela precisa. O primeiro argumento é `mode`, e precisa ser um tipo de `DrawMode`. Nós podemos clicar em [`DrawMode`](https://www.love2d.org/wiki/DrawMode) para saber mais informações sobre esse tipo.

[![](//raw.githubusercontent.com/arthrfrts/como-fazer-love/master/images/book/4/drawmode.png "love2d.org/wiki/DrawMode")](https://www.love2d.org/wiki/DrawMode)

`DrawMode` é uma string que pode ser tanto “fill” quanto “line”, e controla como as formas são desenhadas.

Todos os próximos argumentos são números.

Se quisermos desenhar um retângulo preenchido, nós podemos fazer o seguinte:

```lua
function love.draw()
	love.graphics.rectangle("fill", 100, 200, 50, 80)
end
```

Quando executarmos o jogo veremos um retângulo preenchido:

![](//raw.githubusercontent.com/arthrfrts/como-fazer-love/master/images/book/4/example_rectangle.png)

As funções que LÖVE oferece são o que chamamos de API. API significa [interface de programação de aplicação](https://pt.wikipedia.org/wiki/Interface_de_programação_de_aplicações). Você pode ler o artigo da Wikipédia para saber o que, exatamente, é uma API, mas nesse caso é simplesmente as funções de LÖVE que você pode usar.

***

## Resumo

LÖVE é uma ferramenta que facilita criarmos os nossos jogos. LÖVE usa uma linguagem de programação chamado Lua. Tudo o que começa com `love.` é parte da framework de LÖVE. A wiki de LÖVE nos diz tudo o que precisamos saber sobre como usar LÖVE.