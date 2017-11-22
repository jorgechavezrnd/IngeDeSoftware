When("aparece el mensaje {string}") do |message|
  expect(last_response.body) =~ /#{message}/
end

Then("vuelvo a la pantalla de inicio") do
  visit('/')
end

Then("muestra {string}") do |title|
  expect(last_response.body) =~ /#{title}/
end