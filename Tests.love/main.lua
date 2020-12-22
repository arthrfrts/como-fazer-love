function love.load()
  frutas = {"maçã", "banana"}
  table.insert(frutas, "pêra")
  table.insert(frutas, "abacaxi")
  table.remove(frutas, 2)
end

function love.draw()
  for i = 1, #frutas do
    love.graphics.print(frutas[i], 100, 100 + 50 * i)
  end
end