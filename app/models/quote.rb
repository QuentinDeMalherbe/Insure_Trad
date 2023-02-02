class Quote < ApplicationRecord
  belongs_to :user

  def g_a(value)
    if value == "down"
      g_a_down
    elsif value == 'up'
      g_a_up
    elsif value == "normal"
      guarantie_a
    end
  end

  def prime_chose(value)
    if value == "down"
      prime_down
    elsif value == 'up'
      prime_up
    elsif value == "normal"
      prime
    end
  end
end
