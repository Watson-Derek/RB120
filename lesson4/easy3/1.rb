class Greeting
  def greet(message)
    puts message
  end
end

class Hello < Greeting
  def hi
    greet("Hello")
  end
end

class Goodbye < Greeting
  def bye
    greet("Goodbye")
  end
end

#Given the above code, what happens in each of the following cases?

hello = Hello.new
hello.hi
# hello is initialized as an object of the Hello class.
# the hi method is called on the hello object, which calls the greet method from the Greeting
# class, which puts the message passed to it, in this case "Hello"

hello = Hello.new
hello.bye
# hello is initialized as an object of the Hello class
# the bye method is called on the hello object. This method does not exist in the Hello class
# or the Greeting class, so this will result in a no method error

hello = Hello.new
hello.greet
# hello is initialized as an object of the Hello class
# the greet method is called on the hello object, but will result in an error since no argument is
# passed to the method and it expects 1

hello = Hello.new
hello.greet("Goodbye")
# hello is initialized as an object of the Hello class
# the greet method is called, which is in the Greeting class, and the message "Goodbye" is passed to
# it, so "Goodbye" will be output to the screen with the puts method

Hello.hi
# error, there is no class method hi for the Hello class
