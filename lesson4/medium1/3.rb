class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    quantity = updated_count if updated_count >= 0
  end
end

=begin
Alyssa noticed that this will fail when update_quantity is called. 
Since quantity is an instance variable, it must be accessed with the @quantity notation 
when setting it. One way to fix this is to change attr_reader to attr_accessor and 
change quantity to self.quantity.

Is there anything wrong with fixing it this way?

What could be wrong is purely changing from reader to accessor would also open the 
:product_name instance variable for reassigment as well, since it would add a setter method for 
that symbol in addition to :quantity

Also that the quantity can now be changed outside of the class without calling the update_quantity
method, less security
=end