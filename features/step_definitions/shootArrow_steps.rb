Then("si no le diste al wumpus me muestra {string}") do |message|
  expect(last_response.body) =~ /#{message}/
end

Then("me muestra Muestra el mensaje de victoria si es que se mato al wumpus y te devuelve al menu principal") do
  visit('/')
end