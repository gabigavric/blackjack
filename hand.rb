require_relative 'card'

class Hand
  attr_accessor :dealt_cards

  #values hash is like js objects, keys are strings
  VALUES = {
    '2': 2, 
    '3': 3,
    '4': 4,
    '5': 5,
    '6': 6,
    '7': 7,
    '8': 8,
    '9': 9,
    '10': 10,
    'Jack': 10,
    'Queen': 10,
    'King': 10,
    'Ace': 1
  }
  
  def initialize
    @dealt_cards = []
  end

  def add_card_to_hand(card)
    @dealt_cards << card
  end

  def get_card_value
    card_values = @dealt_cards.map {|card| card.value}
    result = card_values.reduce(0) {|acc, value| acc + VALUES[value.to_sym]}
    if  card_values.include?('Ace') && @dealt_cards.first.show
      result += 10 if result + 10 <= 21 #this if will only add 10 to result if it will be less than or equal to 21
    end
    result
  end

  def to_s
    report = "" #build a string out and then just add to it as you go

    dealt_cards.each {|card| report += card.to_s + ", " if card.show}

    if dealt_cards.first.show == false
      first_value = VALUES[@dealt_cards.first.value.to_sym]
      report + "Total Value " + (get_card_value - first_value).to_s
    else
      report + "Total Value " + get_card_value.to_s
    end
  end

end