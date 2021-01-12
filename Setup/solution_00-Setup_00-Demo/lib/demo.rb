# frozen_string_literal: true

def circle_area(radius)
  if radius.positive?
    area = 3.14 * radius**2
    area
  else
    0
  end
end
