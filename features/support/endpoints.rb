module Endpoints

  def self.base_url
    "https://deckofcardsapi.com/api/deck"
  end

  def self.create_deck
    base_url + "/new/"
  end

  def self.shuffle_deck(deck_count)
    base_url + "/new/shuffle/?deck_count=#{deck_count}"
  end

  def self.draw_a_card(deck_id, draw_count)
    base_url + "/#{deck_id}/draw/?count=#{draw_count}"
  end

  def self.draw_a_card_from_shuffled_deck(draw_count)
    base_url + "/new/draw/?count=#{draw_count}"
  end

  def self.drawing_from_piles(deck_id, pile_name, cards)
    base_url + "#{deck_id}/pile/#{pile_name}/add/?cards=#{cards}"
  end

end
