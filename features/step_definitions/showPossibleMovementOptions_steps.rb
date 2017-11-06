Then("muestra el mensaje {string}") do |mensaje|
  expect(last_response.body) =~ /#{mensaje}/
end