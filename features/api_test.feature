Feature: api test

  Scenario: api test
    Given Create a deck
    And Shuffle the deck
    And Draw 3 cards from deck
    And Make 2piles with 5cards each from deck
    And List the cards in pile1 and pile2
    And shuffle pile1
    And draw 2 cards from pile1
    And draw 3 cards from pile2