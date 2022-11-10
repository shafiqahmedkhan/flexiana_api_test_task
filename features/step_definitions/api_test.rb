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
  @drawn_cards_2 = Requests.draw_a_card_from_shuffled_deck(no_of_cards)
  response_body_1 = JSON.parse(@drawn_cards_1.body)
  response_body_2 = JSON.parse(@drawn_cards_2.body)
  @deck_id_1 = response_body_1["deck_id"]
  @deck_id_2 = response_body_2["deck_id"]
  #assert we have 5 cards
  expect(response_body_1["cards"].count).to eql no_of_cards.to_int
  expect(response_body_2["cards"].count).to eql no_of_cards.to_int
  #add these cards to a pile
  @array_1 = []
  response_body_1["cards"].each_with_index do | element |
    @array_1.push(element['code'])
  end
  @array_2 = []
  response_body_2["cards"].each_with_index do | element |
    @array_2.push(element['code'])
  end
  @pile_1 = Utilities.generate_pile_name
  @pile_2 = Utilities.generate_pile_name
  puts
  pile_1 = Requests.add_cards_to_piles(@deck_id_1, @pile_1, @array_1.join(","))
  pile_2 = Requests.add_cards_to_piles(@deck_id_2, @pile_1, @array_2.join(","))
end

And("List the cards in pile 1 and pile 2") do
  response_1 = Requests.list_cards_from_a_pile(@deck_id_1, @pile_1)
  expect(response_1.code).to eql(200)
  response_2 = Requests.list_cards_from_a_pile(@deck_id_2, @pile_2)
  expect(response_2.code).to eql(200)
end

And(/^shuffle pile1$/) do
  response_1 = HTTParty.post("https://deckofcardsapi.com/api/deck/#{@deck_id_1}/pile/#{@pile_1}/shuffle/")
  puts response_1.body
  response_2 = HTTParty.get("https://deckofcardsapi.com/api/deck/#{@deck_id_2}/pile/#{@pile_2}/list/")
  puts response_2.body
  #aseert the above 2 responses are not equal
end

And("draw {int} cards from pile 1") do |no_of_cards|
  response = HTTParty.post("https://deckofcardsapi.com/api/deck/#{@deck_id_1}/pile/#{@pile_1}/draw/?count=#{no_of_cards}")
  puts response.body
end

And("draw {int} cards from pile 2") do |no_of_cards|
  response = HTTParty.post("https://deckofcardsapi.com/api/deck/#{@deck_id_2}/pile/#{@pile_2}/draw/?count=#{no_of_cards}")
  puts response.body
end
