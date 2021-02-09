class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

=begin
Given the above code, what is the result of executing the below code?

oracle = Oracle.new will create a new object of the Oracle class
oracle.predict_the_future will return a string of 'you will ' plus a random choice
from the array in the choices method, since the return of that method is an array
=end

oracle = Oracle.new
p oracle.predict_the_future