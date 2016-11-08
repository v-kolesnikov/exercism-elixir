defmodule FizzBuzz do
  @doc """
  Returns whether 'year' is a leap year.

  A leap year occurs:

  on every year that is evenly divisible by 4
    except every year that is evenly divisible by 100
      unless the year is also evenly divisible by 400
  """
  # @spec call() :: []
  def call(range), do: range |> Enum.map(&fizz_buzz/1)

  defp fizz_buzz(x) when rem(x, 3) === 0 and rem(x, 5) === 0, do: "FizzBuzz"
  defp fizz_buzz(x) when rem(x, 3) === 0, do: "Fizz"
  defp fizz_buzz(x) when rem(x, 5) === 0, do: "Buzz"
  defp fizz_buzz(x), do: x
end
