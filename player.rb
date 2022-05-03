class Player 
  attr_accessor :life, :name
  @life

  def initialize(name)
    @life = 3
    @name = name
  end

  def remove_life
    @life -= 1
  end 
end


