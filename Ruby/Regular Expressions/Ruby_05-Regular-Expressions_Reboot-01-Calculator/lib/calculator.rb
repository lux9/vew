def calculate(num1, num2, operator)
  # if operator == "+"
  #   result = num1 + num2
  #   return result
  # elsif operator == "-"
  #   result = num1 - num2
  #   return result
  # elsif operator == "*"
  #   result = num1 * num2
  #   return result
  # elsif operator == "/"
  #   result = num1.to_f / num2
  #   return result
  # else
  #   return nil
  # end

  # simplified:
  case operator
  when "+" then return num1 + num2
  when "-" then return num1 - num2
  when "*" then return num1 * num2
  when "/" then return num1.to_f / num2
  else
    return nil
  end
end
