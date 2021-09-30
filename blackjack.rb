require_relative 'deck'
require_relative 'hand'

class Blackjack
  attr_reader :player_hand, :dealer_hand, :deck, :playing
  attr_accessor :current_gamer, :result

  def initialize suits, values
    @player_hand = nil
    @dealer_hand = nil
    @deck = Deck.new suits, values
    @playing = false
    @current_gamer = 'Player'
    @result = ''
  end


  def deal
    #create dealer and player hands
    @dealer_hand = Hand.new
    @player_hand = Hand.new

    #add two cards to each persons hand
    2.times do
      @dealer_hand.add_card_to_hand(@deck.deal_card) #deal_card method is from Deck class
      @player_hand.add_card_to_hand(@deck.deal_card) #add_card_to_hand method is from Hand class
    end

    @playing = true #start playing
    player_cards = @player_hand.dealt_cards #var player_cars get the cards of the player to compare in the if statement down below
    value_of_ten = ['10', 'Jack', 'Queen', 'King'] #var represents all of the possible cards with a value of ten

    if value_of_ten.include?(player_cards.first.value) && player_cards.last.value == 'Ace' || #if player has a first card in hand valued at ten, and an Ace at last card in hand OR
       value_of_ten.include?(player_cards.last.value) && player_cards.first.value == 'Ace' #if player has last card in hand valued at ten, and an Ace at first card in hand
         @current_gamer = "Dealer" #change the current_gamer to Dealer from Player aka change turns
    end
  end

   #hit means deal an extra card to hand
   def hit
    if playing 
      if @current_gamer == "Player" #if the current_gamer is Player
        add_new_card @player_hand #add_new_card (a private method) to the @player_hand(the param). game is initialized with player starting
      elsif @current_gamer == "Dealer"
        add_new_card @dealer_hand
      end
    end
  end
  
  #stand means to hold your total and end turn
  #when its called three things should happen. 1) current gamer should go from player to dealer, dealer should hit if hand is below 17. all of dealers cards should be displayed
  def stand
    if playing 
      if @current_gamer == 'Player'
        @current_gamer == 'Dealer' #1
        @dealer_hand.dealt_cards.first.show = true
      end
      if @dealer_hand.get_card_value < 17 
        hit #2
      end
    end
  end

  def show
    "Player's hand: #{player_hand}\n Dealer's hand: #{dealer_hand}"
  end

  def set_result
    if @player_hand.get_card_value > 21
      @result = "Player busts"
    elsif @dealer_hand.get_card_value > 21
      @result = "Dealer busts"
    elsif @current_gamer == 'Dealer'
      if @player_hand.get_card_value == @dealer_hand.get_card_value
        @result = 'Tie'
      elsif @player_hand.get_card_value > @dealer_hand.get_card_value
        @result = "Player wins"
      elsif @player_hand.get_card_value < @dealer_hand.get_card_value
        @result = "Dealer wins"
      end
    end
  end

  #private methods are called inside the same class never outside of this class

  private
  
  def add_new_card hand #the hand is the param. not using () makes it hard to follow
    #Hand has method add_card_to_hand. This method takes a card as an argument. 
    hand.add_card_to_hand @deck.deal_card #@deck.deal_card is that argument
    if hand.get_card_value > 21
      @result = '#{@current_gamer} busted'
      @playing = false
    end
  end

end 
