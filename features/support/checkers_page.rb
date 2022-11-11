class CheckersPage < SitePrism::Page

  set_url 'http://www.gamesforthebrain.com/game/checkers/'
  element :pop_up_btn, "button[class=' css-1hmbpel']"
  element :restart_game, "a[href='./']"
  element :message, "p[id='message']"
  element :position_4_3, "img[name=space42]"
  element :position_3_4, "img[name=space53]"
  element :position_2_5, "img[name=space64]"
  element :selected_counter, "img[src='you2.gif']"
  elements :my_counters, "img[src='you1.gif']"

  def remove_pop_up
    pop_up_btn.click
  end

  def restart_the_game
    restart_game.click
  end

  def message_text
    message.text
  end

  def make_first_move
    position_4_3.click
    position_3_4.click
  end

  def make_second_move
    position_3_4.click
    position_2_5.click
  end
end
