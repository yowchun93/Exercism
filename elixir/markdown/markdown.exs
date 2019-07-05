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
    |> Enum.map(&process_lines(&1))
    |> Enum.join("")
    |> process_tags
    |> patch
  end

  defp process_lines(text = "#" <> _) do
    text
    |> parse_header_md_level
    |> enclose_with_header_tag
  end

  defp process_lines("*" <> text) do
    text
    |> parse_list_md_level
  end

  defp process_lines(text) do
    text
    |> String.split
    |> enclose_with_paragraph_tag
  end

  defp parse_header_md_level(hwt) do
    [h | t] = String.split(hwt)
    {to_string(String.length(h)), Enum.join(t, " ")}
  end

  defp enclose_with_header_tag({hl, htl}) do
    "<h#{hl}>#{htl}</h#{hl}>"
  end

  defp parse_list_md_level(l) do
    list = l
    |> String.trim_leading( "* ")
    |> String.split
    "<li>#{join_words_with_tags(list)}</li>"
  end

  defp join_words_with_tags(list) do
    list
    |> Enum.map(fn w -> replace_md_with_tag(w) end)
    |> Enum.join(" ")
  end

  defp replace_md_with_tag(w) do
    w
    |> replace_prefix_md
    |> replace_suffix_md
  end

  defp replace_prefix_md(w) do
    cond do
      w =~ ~r/^#{"__"}{1}/ -> String.replace(w, ~r/^#{"__"}{1}/, "<strong>", global: false)
      w =~ ~r/^[#{"_"}{1}][^#{"_"}+]/ -> String.replace(w, ~r/_/, "<em>", global: false)
      true -> w
    end
  end

  defp replace_suffix_md(w) do
    cond do
      w =~ ~r/#{"__"}{1}$/ -> String.replace(w, ~r/#{"__"}{1}$/, "</strong>")
      w =~ ~r/[^#{"_"}{1}]/ -> String.replace(w, ~r/_/, "</em>")
      true -> w
    end
  end

  defp enclose_with_paragraph_tag(t) do
    "<p>#{join_words_with_tags(t)}</p>"
  end

  defp patch(l) do
    String.replace_suffix(
      String.replace(l, "<li>", "<ul>" <> "<li>", global: false),
      "</li>",
      "</li>" <> "</ul>"
    )
  end

  defp process_tags(str) do
    str
    |> String.replace( ~r/__([^_]+)__/, "<strong>\\1</strong>")
    |> String.replace( ~r/_([^_]+)_/, "<em>\\1</em>")
  end

end
