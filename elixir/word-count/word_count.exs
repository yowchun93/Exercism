defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t()) :: map
  def count(sentence) do
    sentence
    |> String.split(~r/[^\p{L}\d-]/u, trim: true)
    |> count(%{})
  end

  defp count([], result), do: result

  defp count([h|t], result) do
    new_result = Map.update(result, h, 1, &(&1 + 1))
    count(t, new_result)
  end

end
