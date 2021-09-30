require_relative 'blackjack'

SUITS = ['Spades', 'Hearts', 'Clubs', 'Diamonds'] 
VALUES = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']

game = Blackjack.new SUITS, VALUES
game.deal
puts game.show
player_hand = game.player_hand.dealt_cards

while game.player_hand.get_card_value  <= 21 do 
  #if dealt a blackjack end game
  unless player_hand.first.value == '10' && player_hand.last.value == 'Ace' || player_hand.last.value == '10' && player_hand.first.value == 'Ace'
    puts
    puts "Hit(1) or Stand(2)?"
    res = gets.chomp
    if res == '1'
      puts
      game.hit
      puts "Player hand: " + game.player_hand.to_s
      puts "Dealer hand: " + game.dealer_hand.to_s
    elsif res == '2'
      puts
      game.stand
      puts "Player hand: " + game.player_hand.to_s
      puts "Dealer hand: " + game.dealer_hand.to_s
      break
    end
  else
    game.stand
    puts
    puts "Player hand: " + game.player_hand.to_s
    puts "Dealer hand: " + game.dealer_hand.to_s
    break
  end
end

puts game.set_result
