Given("visito la pantalla de inicio") do
  visit('/')
end

Then("deberia mostrarme {string} tras haberse generado los limites") do |message|
  expect(last_response.body) =~ /#{message}/
end