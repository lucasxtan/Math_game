class Questions
  attr_accessor :num1, :num2

  def initialize
    @num1 = rand(1..20)
    @num2 = rand(1..20)
    @answer = @num1 + @num2
  end 

  def answer
    return @answer
  end
end