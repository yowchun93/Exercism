defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """

  def numerals(number, roman_accumulator) when number >= 1000 do
    numerals(number - 1000, roman_accumulator <> "M")
  end

  def numerals(number, roman_accumulator) when number >= 900 do
    numerals(number - 900, roman_accumulator <> "CM")
  end

  def numerals(number, roman_accumulator) when number >= 500 do
    numerals(number - 500, roman_accumulator <> "D")
  end

  def numerals(number, roman_accumulator) when number >= 400 do
    numerals(number - 400, roman_accumulator <> "CD")
  end

  def numerals(number, roman_accumulator) when number >= 100 do
    numerals(number - 100, roman_accumulator <> "C")
  end

  def numerals(number, roman_accumulator) when number >= 90 do
    numerals(number - 90, roman_accumulator <> "XC")
  end

  def numerals(number, roman_accumulator) when number >= 50 do
    numerals(number - 50, roman_accumulator <> "L")
  end

  def numerals(number, roman_accumulator) when number >= 40 do
    numerals(number - 40, roman_accumulator <> "XL")
  end

  def numerals(number, roman_accumulator) when number >= 10 do
    numerals(number - 10, roman_accumulator <> "X")
  end

  def numerals(number, roman_accumulator) when number >= 9 do
    numerals(number - 9, roman_accumulator <> "IX")
  end

  def numerals(number, roman_accumulator) when number >= 5 do
    numerals(number - 5, roman_accumulator <> "V")
  end

  def numerals(number, roman_accumulator) when number == 4 do
    roman_accumulator <> "IV"
  end

  def numerals(number, roman_accumulator) when number <= 3 do
    roman_accumulator <> String.duplicate("I", number)
  end

  def numerals(number) do
    numerals(number, "")
  end

end
