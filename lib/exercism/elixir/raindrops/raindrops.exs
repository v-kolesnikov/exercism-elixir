defmodule Raindrops do
  @moduledoc"""
  Write a program that converts a number to a string,
  the contents of which depends on the number's factors.
  """

  @raindrops %{3 => "Pling", 5 => "Plang", 7 => "Plong"}

  @doc """
  Returns a string based on raindrop factors.

  - If the number contains 3 as a prime factor, output 'Pling'.
  - If the number contains 5 as a prime factor, output 'Plang'.
  - If the number contains 7 as a prime factor, output 'Plong'.
  - If the number does not contain 3, 5, or 7 as a prime factor,
    just pass the number's digits straight through.
  """
  @spec convert(pos_integer) :: String.t
  def convert(number) do
    @raindrops
    |> Map.keys
    |> Enum.filter(fn(factor) -> (rem number, factor) === 0 end)
    |> Enum.map(fn(factor) -> @raindrops[factor] end)
    |> Enum.join("")
    |> format(number)
  end

  defp format("", input), do: Integer.to_string(input)
  defp format(string, _), do: string
end
