Given("visito la pantalla del juego") do
  visit('/game')
end

Then("deberia volver al menu principal") do
  visit('/')
end