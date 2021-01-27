class Expander
  def initialize(string)
    @string = string
  end

  def to_s
    expand(3)
  end

  private

  def expand(n)
    @string * n
  end
end

expander = Expander.new('xyz')
puts expander

=begin
What is wrong with the code above? What fix(es) would you make?
Either remove the private line, or remove the literal self. As private methods
cannot be called with a literal self

=end