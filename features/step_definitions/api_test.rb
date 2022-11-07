Then("I create a deck") do
  @response = Requests.create_new_deck
  #@response = HTTParty.post("https://deckofcardsapi.com/api/deck/new/")
  puts @response.code
  puts @response.body
  #need to capture the deck_id
end

And("shuffle the deck") do
  #@response = HTTParty.post("https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=1")
  #puts @response.code
  #puts @response.body
  #need to capture deck_id
end

And("Draw {int} cards from the deck") do |no_of_cards|
  #insert deck id here
  @response = HTTParty.post("https://deckofcardsapi.com/api/deck/<<deck_id>>/draw/?count=3")
end

And(/^Make 2piles with 5cards each from deck$/) do
  pending
end

And(/^List the cards in pile1 and pile2$/) do |arg|
  pending
end

And(/^shuffle pile1$/) do
  pending
end

And(/^draw (\d+) cards from pile1$/) do |arg|
  pending
end

And(/^draw (\d+) cards from pile2$/) do |arg|
  pending
end
