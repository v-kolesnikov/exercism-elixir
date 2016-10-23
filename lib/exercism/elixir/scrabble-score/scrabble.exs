defmodule Scrabble do
  @doc """
  Calculate the scrabble score for the word.
  """
  @spec score(String.t) :: non_neg_integer
  def score(word) do
    word
    |> String.upcase
    |> String.split("", trim: true)
    |> Enum.map(&letter_score/1)
    |> Enum.sum()
  end

  defp letter_score(letter) when letter in ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"], do: 1
  defp letter_score(letter) when letter in ["D", "G"], do: 2
  defp letter_score(letter) when letter in ["B", "C", "M", "P"], do: 3
  defp letter_score(letter) when letter in ["F", "H", "V", "W", "Y"], do: 4
  defp letter_score(letter) when letter in ["K"], do: 5
  defp letter_score(letter) when letter in ["J", "X"], do: 8
  defp letter_score(letter) when letter in ["Q", "Z"], do: 10
  defp letter_score(_), do: 0
end
