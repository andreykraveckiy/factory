require './factory'

Customer = Factory.new(:name, :address, :zip)

joe = Customer.new('Joe Smith', '123 Maple, Anytown NC', 12345)

puts joe.name
puts joe['name']
puts joe[:name]
puts joe[0]

Object.send(:remove_const, :Customer)

Customer = Factory.new(:name, :address) do
  def greeting
    "Hello #{name}!"
  end
end

puts Customer.new('Dave', '123 Main').greeting