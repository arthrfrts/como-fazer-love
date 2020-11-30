# Capítulo 1 – Instalação

***

*Os capítulos 2 e 3 podem ser feitos sem instalar nada. Você pode usar [repl.it](https://repl.it/languages/lua) como uma alternativa se você não quiser instalar nenhum software por enquanto, mas preste atenção no parágrafo **Mais umas coisinhas** no final.*

***

## LÖVE

Vá para [love2d.org](https://www.love2d.org/).

Você deve baixar o **instalador** da versão de 32-bit ou 64-bit Isso depende do seu tipo de sistema. Se você não tem certeza do seu tipo de sistema, vá de 32-bit.

![](//raw.githubusercontent.com/arthrfrts/como-fazer-love/master/images/book/1/download_love.png)

Abra o instalador. Clique em *Next* (Próximo). Clique em *I Agree* (Eu concordo). Agora você pode decidir onde você quer instalar o LÖVE. Não importa onde você instala o LÖVE, mas tenha certeza de que você vai se lembrar de onde você o instalou — você vai precisar disso logo mais. Essa pasta será chamada de *Pasta de instalação*.

A minha pasta de instalação será `C:/Arquivos de Programas/LOVE`.

Clique em *Next* (Próximo). Clique em *Install* (Instalar).

Quando LÖVE tiver sido instalado, clique em *Finish* (Terminar).

***

## ZeroBrane Studio

Agora a gente fai precisar de um editor de texto. Nós vamos usar o ZeroBrane Studio nesse tutorial.

Acesse [studio.zerobrane.com](https://studio.zerobrane.com/) e clique em “Download”.

![](//raw.githubusercontent.com/arthrfrts/como-fazer-love/master/images/book/1/download_brane.png)

Aqui você terá a opção para fazer uma doação ao projeto do ZeroBrane Studio. Se você não quiser doar, clique em ["Take me to the download page this time"](https://studio.zerobrane.com/download?not-this-time),

Abra o instalador e instale o ZeroBrane Studio em uma pasta à sua escolha.

![](//raw.githubusercontent.com/arthrfrts/como-fazer-love/master/images/book/1/install_brane.png)

Quando o ZeroBrane Studio terminar de instalar, abra-o.

Agora nós vamos precisar criar uma pasta de projeto. Abra seu explorador de arquivos e crie uma pasta onde você quiser, e dê o nome que você quiser à ela. No ZeroBrane Studio, clique no ícone de “Select Project Folder” e selecione a pasta que você acabou de criar.

![](//raw.githubusercontent.com/arthrfrts/como-fazer-love/master/images/book/1/project_brane.png)

No ZeroBrane Studio, crie um novo arquivo em `File` &rarr; `New` ou use o atalho `Control + N`.

Dentro desse arquivo, escreva o código abaixo:


```lua
function love.draw()
	love.graphics.print("Olá mundo!", 100, 100)
end
```

Salve o arquivo em `File` &rarr; `Save` ou com o atalho `Control + S`. Salve o arquivo como `main.lua`.

Vá em `Project` &rarr; `Lua Interpreter` e selecione `LÖVE`.

Agora, quando você pressionar `F6`, uma janela vai abrir com o texto “Olá mundo!”. Parabéns, você começou a aprender LÖVE. Todas as vezes que eu falar para você *executar o jogo* ou *executar o código*, eu estou dizendo para você pressionar `F6` e executar o LÖVE.

Caso nada aconteça e o texto *Can't find love2d executable in any of the following folders* aparecer, significa que você instalou o LÖVE em algum lugar que o ZeroBrane Studio não conseguiu encontrá-lo. Vá em `Edit` &rarr; `Preferences` &rarr; `Settings: User` e adicione:

```lua
path.love2d = 'C:/caminho/para/love.exe'
```

Substitua `C:/caminho/para` para o caminho onde você instalou o LÖVE. Preste atenção e use as barras (`/`).

***

## Mais umas coisinhas

Você copiou e colou o código de exemplo? Eu recomendo que você digite o código que eu mostrei. Pode parecer um trabalho desnecessário, mas fazer isso vai ajudar você a memorizar tudo muito melhor.

A única coisa que você não precisa digitar são os comentários.


```lua
-- Isso é um comentário, isso não é um código.
-- A próxima linha é um código:

print(123)

-- Resultado: 123
```

Cada linha que começa com dois hífens (--) é um *comentário*. O computador vai ignorá-lo, o que significa que nós podemos digitar o que quisermos sem termos nenhum erro. Eu posso usar comentários para explicar algumas seções do código. Ao digitar o código, você não precisa copiar os comentários.

Com `print` nós enviamos informações para o *console*. Essa é a caixa na parte inferior do nosso editor. **Quando você fechar o jogo**, o console vai exibir o texto “123”. Eu adicionei o texto `-- Resultado:` para indicar qual é o resultado esperado. Não confunda isso com `love.graphics.print`.

Se você colocar o código abaixo no topo de seu `main.lua`, você vai ver os resultados logo em seguida. Não é importante como isso funciona, ele basicamente diz para o programa não esperar ser fechado para exibir os resultados.

```lua
io.stdout:setvbuf("no")
```

***

## Editores de texto alternativos

* [Atom](https://love2d.org/wiki/Atom)
* [Visual Studio Code](https://code.visualstudio.com/)
* [Sublime Text](https://love2d.org/wiki/Sublime_Text)