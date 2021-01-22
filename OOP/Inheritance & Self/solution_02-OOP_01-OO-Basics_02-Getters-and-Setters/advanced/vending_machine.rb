class VendingMachine
  # TODO: add relevant getter/setter to this class to make the scenarios pass.
  def initialize(snack_price_cents, snack_count)
    @user_balance_cents = 0
    @snack_count = snack_count
    @snack_price_cents = snack_price_cents
  end

  def insert_coin(input_cents)
    # TODO: what happens to `@snack_count, @user_balance_cents and @snack_price_cents when the user insert a coin?
    @user_balance_cents += input_cents
  end

  def buy_snack
    # TODO: what happens to `@snack_count, @user_balance_cents and
    # @snack_price_cents when the user pushes a button to buy a Snack?
    if @user_balance_cents >= @snack_price_cents && @snack_count.positive?
      @user_balance_cents -= @snack_price_cents
      @snack_count -= 1
    end
  end

  def refill(snack_count)
    @snack_count += snack_count unless snack_count <= 0
  end

  def display
    return "---> Amount: #{@user_balance_cents / 100.0}€" \
      " - 1 Snack = #{@snack_price_cents / 100.0}€" \
      " - Stock: #{@snack_count}"
  end
end
