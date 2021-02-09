class InvoiceEntry
  attr_reader :quantity, :product_name

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    # prevent negative quantities from being set
    quantity = updated_count if updated_count >= 0
  end
end

=begin
The above code is to keep track of items for a shopping cart application

There is a mistake spotted, this will fail when update_quantity is called

What is the mistake and how do you address it?

The error is because there is only a getter method for quantitiy, there is no setter method
The easiest way to address this would be to move the :quantity from the attr_reader method
and add it to an attr_accessor method, and use self.quantity
=end