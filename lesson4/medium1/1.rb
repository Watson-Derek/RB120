class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

=begin
Alyssa glanced over the code quickly and said - "It looks fine, except that you forgot to put 
the @ before balance when you refer to the balance instance variable in the body of the 
positive_balance? method."

"Not so fast", Ben replied. "What I'm doing here is valid - I'm not missing an @!"

Who is right, Ben or Alyssa, and why?

Ben is right, since there is a getter method for balance, the @ is not needed.
When there is a getter method (attr_reader or accessor as well), then that method is called to
retrieve the value
=end