Given("I create a new deck") do
  @response = Requests.create_new_deck
  expect(@response.code).to eql(200)
end

And("shuffle the deck") do
  @response = Requests.shuffle_deck(1)
  expect(@response.code).to eql(200)
  response_body = JSON.parse(@response.body)
  @deck_id = response_body["deck_id"]
end

Then("I should be able to draw {int} cards from the deck") do |draw_count|
  @response = Requests.draw_a_card(@deck_id, draw_count)
  expect(@response.code).to eql(200)
  # add assertion to confirm deck has now 49 cards remaining
end

And('make {int} piles with {int} cards from each deck') do |no_of_piles, no_of_cards|
  #draw 5 cards from deck 1
  @drawn_cards_1 = Requests.draw_a_card_from_shuffled_deck(no_of_cards)
  response_body = JSON.parse(@drawn_cards_1.body)
  @deck_id = response_body["deck_id"]
  #assert we have 5 cards
  response_body = JSON.parse(@drawn_cards_1.body)
  expect(response_body["cards"].count).to eql no_of_cards.to_int
  #add these cards to a pile
  puts "************"
  puts @array1 = []
  puts "**************"
  response_body["cards"].each_with_index do | element |
    @array1.push(element['code'])
  end
  puts @array1
  puts @array1.respond_to?(:to_a)
  puts @array1.join(",")
  puts @array1.respond_to?(:to_s)
  puts @pile_1 = SecureRandom.send(:choose, [*'a'..'z'], 20)
  pile_1 = HTTParty.get("https://deckofcardsapi.com/api/deck/#{@deck_id}/pile/#{@pile_1}/add/?cards=#{@array1.join(",")}")
  puts pile_1.body
  #  puts list_of_cards
  #
  #draw 5 cards from deck 2
  #@drawn_cards_2 = Requests.draw_a_card_from_shuffled_deck(no_of_cards)
  #add these to 2 seperate pile
end

And("List the cards in pile1 and pile2") do
  #list the cards in both pile
  response = HTTParty.get("https://deckofcardsapi.com/api/deck/#{@deck_id}/pile/#{@pile_1}/list/")
  puts response.body
end

And(/^shuffle pile1$/) do
  response1 = HTTParty.post("https://deckofcardsapi.com/api/deck/#{@deck_id}/pile/#{@pile_1}/shuffle/")
  puts response1.body
  response2 = HTTParty.get("https://deckofcardsapi.com/api/deck/#{@deck_id}/pile/#{@pile_1}/list/")
  puts response2.body
  #aseert the above 2 responses are not equal
end

And("draw {int} cards from pile 1") do |no_of_cards|
  response = HTTParty.post("https://deckofcardsapi.com/api/deck/#{@deck_id}/pile/#{@pile_1}/draw/?count=#{no_of_cards}")
  puts response.body
end

And("draw {int} cards from pile 2") do |no_of_cards|
  response = HTTParty.post("https://deckofcardsapi.com/api/deck/#{@deck_id}/pile/#{@pile_1}/draw/?count=#{no_of_cards}")
  puts response.body
end
