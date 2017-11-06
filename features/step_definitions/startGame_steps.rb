Given("visito la pagina de inicio") do
  visit('/')
end

Then("deberia mostrarme {string}") do |titulo|
  expect(last_response.body) =~ /#{titulo}/
end

When("presiono el boton {string}") do |boton|
  click_button(boton)
end

Then("deberia mostrarme la pantalla del juego") do
  visit('/game')
end

Given("visito la pantalla del juego") do
  visit('/game')
end

Then("deberia volver al menu principal") do
  visit('/')
end