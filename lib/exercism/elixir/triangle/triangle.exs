defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t}
  def kind(a, b, c) do
    [x, y, z] = Enum.sort([a, b, c])
    cond do
      Enum.any?([x, y, z], &(&1 <= 0)) ->
        {:error, "all side lengths must be positive"}
      !valid?(x, y, z) ->
        {:error, "side lengths violate triangle inequality"}
      true ->
        {:ok, type(x, y, z)}
    end
  end

  def type(x, x, x), do: :equilateral
  def type(x, x, _), do: :isosceles
  def type(_, x, x), do: :isosceles
  def type(_, _, _), do: :scalene

  def valid?(x, y, z), do: x + y > z
end
