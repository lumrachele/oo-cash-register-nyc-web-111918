class CashRegister
  attr_accessor :total, :discount, :title, :price, :last_transaction

  def initialize(discount = 0)
    @total = 0.0
    @discount = discount
    @items = []
    @last_transaction = 0.0

  end

  def add_item (title, price, quantity=1)
    @last_transaction = price * quantity
    @total += last_transaction

    quantity.times do
      @items << title
    end
    @last_transaction = price*quantity
  end

  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else
      @total = total -  total * discount/100
      "After the discount, the total comes to $#{@total.to_i}."
    end
  end

  def items
    @items#returns an array list of items
  end

  def void_last_transaction
    @items.delete_if{|item| item == @items[-1]}
    @total -= @last_transaction
  end


end

# don't forget about self
