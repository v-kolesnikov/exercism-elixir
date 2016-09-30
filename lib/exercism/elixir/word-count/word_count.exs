defmodule Words do
  @moduledoc"""
  Write a program that given a phrase can count the occurrences of each word in that phrase.

  For example for the input `"olly olly in come free"`

  ```plain
  olly: 2
  in: 1
  come: 1
  free: 1
  ```
  """

  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.replace(~r/[!|&|@|\$|%|\^|&|,]+/, "")
    |> String.split([" ", "_"])
    |> Enum.filter(&(String.match?(&1, ~r/\w+/)))
    |> Enum.reduce(%{}, fn (word, acc) -> Map.update(acc, word, 1, &(&1 + 1)) end)
  end
end
