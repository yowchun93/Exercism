defmodule Roman do
  @doc """
  Convert the number to a roman number.
  """

  # i tried to match 1 by 1 , which of course failed

  @spec numerals(pos_integer) :: String.t()
  def numerals(number) do
    number
    |> process_numeral( number |> Integer.digits |> length )
  end

  defp process_numeral(number, digit = 3) do
    first_digit = number
      |> Integer.digits
      |> List.first
      |> hundreds_digit_conversion

    last_digit = number
      |> Integer.digits
      |> List.last
      |> single_digit_conversion

    first_digit <> "" <> last_digit
  end

  defp process_numeral(number, digit = 2) do
    first_digit = number
      |> Integer.digits
      |> List.first
      |> tens_digit_conversion

    last_digit = number
      |> Integer.digits
      |> List.last
      |> single_digit_conversion

    first_digit <> "" <> last_digit
  end

  defp process_numeral(number, digit = 1) do
    number |> single_digit_conversion
  end

  defp single_digit_conversion(number) do
    case number do
      1 -> "I"
      2 -> "II"
      3 -> "III"
      4 -> "IV"
      5 -> "V"
      6 -> "VI"
      7 -> "VII"
      8 -> "VIII"
      9 -> "IX"
    end
  end

  defp tens_digit_conversion(number) do
    case number  do
      0 -> "D"
      2 -> "XX"
      4 -> "XL"
      5 -> "L"
      9 -> "XC"
    end
  end

  defp hundereds_digit_conversion(number) do

  end

end
