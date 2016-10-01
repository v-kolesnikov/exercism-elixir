defmodule Acronym do
  @moduledoc"""
  Convert a long phrase to its acronym

  Techies love their TLA (Three Letter Acronyms)!

  Help generate some jargon by writing a program that converts a long name
  like Portable Network Graphics to its acronym (PNG).
  """

  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    string
    |> String.split(~r/\s|-|(?<=[a-z])(?=[A-Z])/)
    |> Enum.map(&(String.first(&1)))
    |> Enum.map(&(String.upcase(&1)))
    |> Enum.join("")
  end
end
