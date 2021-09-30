class Card
  attr_accessor :suit, :value 
  @SUITS = ['Spades', 'Hearts', 'Clubs', 'Diamonds'] 
  @VALUES = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace']

  def initialize(suit, value)
    @show = true
    if SUITS.include?(suit) && VALUES.include?(value)
      @suit = suit 
      @value = value
    else
      @suit = 'unknown'
      @value = 'unknown'
    end
  end

  def show
    "#{value} of #{suit}"
  end

  def to_s #custom to string method so it outputs something like 3 of Spades
    if show
      "#{value} of #{suit}"
    else
      "card is face down"
    end
  end 
end
