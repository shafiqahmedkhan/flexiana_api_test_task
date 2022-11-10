class Utilities

  def self.generate_pile_name
    SecureRandom.send(:choose, [*'a'..'z'], 20)
  end

end
