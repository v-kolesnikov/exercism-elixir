defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    candidates
    |> Enum.filter(fn(x) -> anagram?(base, x) end)
  end

  defp anagram?(s1, s2) do
    String.downcase(s1) != String.downcase(s2) && letters(s1) == letters(s2)
  end

  defp letters(string) do
    string
    |> String.downcase
    |> String.codepoints
    |> Enum.sort
  end
end
