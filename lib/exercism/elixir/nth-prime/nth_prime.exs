defmodule Prime do
  @primes []

  @doc """
  Generates the nth prime.
  """
  @spec nth(non_neg_integer) :: non_neg_integer
  def nth(n) when n > 0 do
    2
    |> Stream.iterate(&(&1 + 1))
    |> Stream.filter(&prime?/1)
    |> Enum.at(n - 1)
  end

  def prime?(2), do: true
  def prime?(x) when x > 2 do
    2
    |> Stream.iterate(&(&1 + 1))
    |> Enum.take_while(fn(i) -> i * i <= x end)
    |> Enum.all?(fn(i) -> rem(x, i) != 0 end)
  end
end
