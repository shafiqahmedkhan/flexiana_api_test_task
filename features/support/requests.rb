require_relative 'endpoints'

class Requests
  include Endpoints

  def self.create_new_deck
    HTTParty.post(Endpoints.create_deck)
  end

end