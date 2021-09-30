require_relative 'card'

class Deck
  attr_accessor :suits, :values, :deck
  SUITS = ['Spades', 'Hearts', 'Clubs', 'Diamonds'] 
  VALUES = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']

  def initialize suits, values 
    @suits = suits 
    @values = values
    @deck= []
    create_shuffled_deck
  end 

  def replace_with new_deck #for when the game is finished, replace deck with a new deck
    @suits = [] #no longer have suits
    @values = [] #no longer have values
    @deck = new_deck #create a deck with new deck 

    new_deck.each do |card|
      add_suits_and_values(card) #this method is private set the new_decks suits and values attribute
    end
    self #this is returning that new_deck
  end

  def deal_card
    @deck.pop
  end

  private

  def create_shuffled_deck
    suits.each do |suit|
      values.each do |value|
        @deck.push(Card.new(suit, value))
      end
    end  
    @deck.shuffle!
  end

  def add_suits_and_valudes card
    suit = card.suit
    value - card.value

    @suits.push(suit) unless @suits.include? suit
    @values.push(value) unless @values.include? value
  end

end