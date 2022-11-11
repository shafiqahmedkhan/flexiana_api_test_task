Given(/^I start a new game$/) do
  @checkers_page = CheckersPage.new
  @checkers_page.load
  @checkers_page.wait_until_pop_up_btn_visible
  @checkers_page.remove_pop_up
  @checkers_page.restart_the_game
  expect(@checkers_page.message_text).to eql "Select an orange piece to move."
end

And(/^make your first move$/) do
  @checkers_page.make_first_move
end

And(/^let computer move$/) do
  @checkers_page.wait_until_message_visible text: "Make a move."
  expect(@checkers_page.message_text).to eql "Make a move."
end

And(/^make your second move$/) do
  sleep(2)
  @checkers_page.make_second_move
end

Then(/^make sure your piece is taken$/) do
  @checkers_page.wait_until_message_visible text: "Make a move."
  expect(@checkers_page.message_text).to eql "Make a move."
  expect(@checkers_page.my_counters.size).to eq(11)
end

And(/^start a new game$/) do
  @checkers_page.restart_the_game
  expect(@checkers_page.message_text).to eql "Select an orange piece to move."
end