defmodule PigLatin do
  @doc """
  Given a `phrase`, translate it a word at a time to Pig Latin.

  Words beginning with consonants should have the consonant moved to the end of
  the word, followed by "ay".

  Words beginning with vowels (aeiou) should have "ay" added to the end of the
  word.

  Some groups of letters are treated like consonants, including "ch", "qu",
  "squ", "th", "thr", and "sch".

  Some groups are treated like vowels, including "yt" and "xr".
  """
  @spec translate(phrase :: String.t()) :: String.t()
  def translate(phrase) do
    vowels = String.split("a,e,i,o,u",",")
    process(phrase, String.contains?(phrase, vowels))
  end

  defp process(phrase, true) do
    phrase <> "ay"
  end

  defp process(phrase, false) do
    String.slice(phrase, 1..-1) <> "ay"
  end

end
