Feature: Card Deck

  Scenario: User is able to draw card from a deck
    Given I create a new deck
    When shuffle the deck
    Then I should be able to draw 3 cards from the deck

  Scenario: User should be able to draw from seperate piles
    Given make 2 piles with 5 cards from each deck
    Then List the cards in pile 1 and pile 2
    And shuffle pile 1
    And draw 2 cards from pile 1
    #And draw 3 cards from pile 2