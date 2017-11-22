Given("visito la pagina de juego") do
  visit('/game')
end

When("presiona el boton {string}") do |button|
  click_button(button)
end

When("presiona el boton de direccion despues del mensaje {string}") do |messageOption|
  expect(last_response.body) =~ /#{messageOption}/
end

Then("me muestra {string}") do |message|
 expect(last_response.body) =~ /#{message}/
end