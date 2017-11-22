Given("visito la pantalla del juego") do
  visit('/game')
end

When("presiono el boton {string}") do |button|
  click_button(button)
end

Then("deberia devolverme la menu principal") do
  visit('/')
end

Then("mostrarme {string}") do |title|
  expect(last_response.body) =~ /#{title}/
end