defmodule BracketPush do
  @brackets %{
    "(" => ")",
    "[" => "]",
    "{" => "}",
  }

  @opening Map.keys(@brackets)
  @closing Map.values(@brackets)

  @doc """
  Checks that all the brackets and braces in the string are matched correctly,
  and nested correctly
  """
  @spec check_brackets(String.t) :: boolean
  def check_brackets(input) do
    input
    |> String.split("")
    |> Enum.filter(&bracket?/1)
    |> Enum.reduce([], &iter/2)
    |> Enum.empty?
  end

  defp bracket?(x), do: x in @opening || x in @closing

  defp iter(x, [x|s]), do: s
  defp iter(x, stack)  when x in @opening, do: [@brackets[x] | stack]
  defp iter(x, stack), do: [x | stack]
end
