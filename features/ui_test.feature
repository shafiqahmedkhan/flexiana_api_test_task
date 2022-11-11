Feature: Checkers

  Scenario: User should be able to make 2 moves
  Given I start a new game
  And make my first move
  And let the computer move
  And make my second move allowing the my piece to be taken
  Then make sure your piece is taken
  And start a new game