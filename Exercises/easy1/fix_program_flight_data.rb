class Flight
  attr_accessor :database_handle

  def initialize(flight_number)
    @database_handle = Database.init
    @flight_number = flight_number
  end
end

=begin
To change this code to be resistant to future problems, change the 
attr_accessor to attr_reader. This will prevent the database handle, which is 
initialized when creating a new object of the Flight class, from being modified.
=end