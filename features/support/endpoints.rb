module Endpoints

  def self.base_url
    "https://deckofcardsapi.com/api/deck"
  end

  def self.create_deck
    base_url + "/new/"
  end

end
