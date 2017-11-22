Given("visito la pantalla de juego y esto cerca del wumpus") do
  visit('/')
end

Then("deberia mostrarme {string}") do |message|
  expect(last_response.body) =~ /#{message}/
end