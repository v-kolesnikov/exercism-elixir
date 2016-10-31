defmodule Roman do
  @romans %{
       1 => :I,   4 => :IV,
       5 => :V,   9 => :IX,
      10 => :X,  40 => :XL,
      50 => :L,  90 => :XC,
     100 => :C, 400 => :CD,
     500 => :D, 900 => :CM,
    1000 => :M
  }

  @multipliers @romans |> Map.keys |> Enum.reverse

  @doc """
  Convert the number to a roman number.
  """
  @spec numerals(pos_integer) :: String.t
  def numerals(number), do: to_romans(number, [])

  def to_romans(0, acc), do: acc |> Enum.reverse |> Enum.join
  def to_romans(n, acc) do
    m = Enum.find(@multipliers, fn(x) -> n >= x end)
    to_romans(n - m, [@romans[m] | acc])
  end
end
