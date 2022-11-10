require_relative 'endpoints'

class Requests
  include Endpoints

  def self.create_new_deck
    HTTParty.post(Endpoints.create_deck)
  end

  def self.shuffle_deck(deck_count)
    HTTParty.post(Endpoints.shuffle_deck(deck_count))
  end

  def self.draw_a_card(deck_id, draw_count)
    HTTParty.get(Endpoints.draw_a_card(deck_id, draw_count))
  end

  def self.draw_a_card_from_shuffled_deck(draw_count)
    puts Endpoints.draw_a_card_from_shuffled_deck(draw_count)
    HTTParty.get(Endpoints.draw_a_card_from_shuffled_deck(draw_count))
  end

  def self.add_cards_to_piles(deck_id, pile_name, cards)
    HTTParty.get(Endpoints.add_cards_to_piles(deck_id, pile_name, cards))
  end

  def self.list_cards_from_a_pile(deck_id, pile_name)
    HTTParty.get(Endpoints.list_cards_from_a_pile(deck_id, pile_name))
  end

  def self.shuffle_a_pile(deck_id, pile_name)
    HTTParty.post(Endpoints.shuffle_a_pile(deck_id, pile_name))
  end

end