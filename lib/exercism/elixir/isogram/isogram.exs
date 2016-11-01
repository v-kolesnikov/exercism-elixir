defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  """
  @spec isogram?(String.t) :: boolean
  def isogram?(sentence) do
    sentence
    |> String.replace(~r/[\s-]/, "")
    |> String.split("")
    |> all_uniq?
  end

  defp all_uniq?(s), do: s |> Enum.all?(fn(x) -> count(s, x) == 1 end)
  defp count(s, ch), do: s |> Enum.count(fn(x) -> x == ch end)
end
