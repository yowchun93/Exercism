defmodule Markdown do
  @doc """
    Parses a given string with Markdown syntax and returns the associated HTML for that string.

    ## Examples

    iex> Markdown.parse("This is a paragraph")
    "<p>This is a paragraph</p>"

    iex> Markdown.parse("#Header!\n* __Bold Item__\n* _Italic Item_")
    "<h1>Header!</h1><ul><li><em>Bold Item</em></li><li><i>Italic Item</i></li></ul>"
  """
  @spec parse(String.t()) :: String.t()
  def parse(string) do
    string
    |> String.split("\n", trim: true)
    |> Enum.map_join(&process_lines(&1))
    |> replace_tags
    |> patch_list_tags
  end

  defp process_lines(text = "#" <> _) do
    text
    |> parse_header
    |> enclose_with_header_tag
  end

  defp process_lines("*" <> text) do
    text
    |> parse_list
  end

  defp process_lines(text) do
    text
    "<p>#{text}</p>"
  end

  defp parse_header(text) do
    [h | t] = String.split(text)
    {to_string(String.length(h)), Enum.join(t, " ")}
  end

  defp enclose_with_header_tag({hl, htl}) do
    "<h#{hl}>#{htl}</h#{hl}>"
  end

  defp parse_list(text) do
    t = text
    |> String.trim_leading( "* ")
    |> String.split
    |> Enum.join(" ")
    "<li>#{t}</li>"
  end

  defp enclose_with_paragraph_tag(t) do
    "<p>#{join_words_with_tags(t)}</p>"
  end

  defp patch_list_tags(l) do
    String.replace_suffix(
      String.replace(l, "<li>", "<ul>" <> "<li>", global: false),
      "</li>",
      "</li>" <> "</ul>"
    )
  end

  defp replace_tags(str) do
    str
    |> String.replace( ~r/__([^_]+)__/, "<strong>\\1</strong>")
    |> String.replace( ~r/_([^_]+)_/, "<em>\\1</em>")
  end

end
