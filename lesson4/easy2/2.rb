class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "romp in Rome"]
  end
end

=begin
What is the result of the below code?

the first line creates a new object of the RoadTrip class
The second line will use the predict_the_future method from the Oracle class, since RoadTrip inherits
from that class, but the choices called will frist look in the RoadTrip class, so the choice
will come from the array in the RoadTrip choices method instead of the Oracle class
=end

trip = RoadTrip.new
p trip.predict_the_future