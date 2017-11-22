When("presiono una direccion despues del mensaje {string}") do |direction|
  expect(last_response.body) =~ /#{direction}/
end

Then("muestra el mensaje {string}") do |messageError|
  expect(last_response.body) =~ /#{messageError}/
end