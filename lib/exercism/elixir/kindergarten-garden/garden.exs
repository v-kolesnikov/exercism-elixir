defmodule Garden do
  @names [
    :alice, :bob, :charlie, :david,
    :eve, :fred, :ginny, :harriet,
    :ileana, :joseph, :kincaid, :larry
  ]

  @doc """
    Accepts a string representing the arrangement of cups on a windowsill and a
    list with names of students in the class. The student names list does not
    have to be in alphabetical order.

    It decodes that string into the various gardens for each student and returns
    that information in a map.
  """
  @spec info(String.t(), list) :: map
  def info(info_string, student_names \\ @names) do
    info_string
    |> String.split("\n")
    |> Enum.map(&to_plants/1)
    |> transform
    |> assign_names(student_names)
  end

  defp to_plants(input) do
    input
    |> String.codepoints
    |> Enum.map(&plant/1)
  end

  defp plant("C"), do: :clover
  defp plant("G"), do: :grass
  defp plant("R"), do: :radishes
  defp plant("V"), do: :violets

  @doc """
    Transform:
      [[:a, :b, :c, :d, :e, :f],
       [:g, :h, :i, :j, :k, :l]]

    to:
      [{:a, :b,
        :g, :h},
       {:c, :d,
        :i, :j},
       {:e, :f,
        :k, :l}]
  """
  defp transform([row1, row2]) do
    Enum.chunk(row1, 2)
    |> Enum.zip(Enum.chunk(row2, 2))
    |> Enum.map(fn(x) ->
      x
      |> Tuple.to_list
      |> List.flatten
      |> List.to_tuple
    end)
  end

  defp assign_names(rows, names) do
    names
    |> Enum.sort
    |> do_assign(rows, [])
  end

  defp do_assign([], [], acc), do: acc |> Enum.into(%{})
  defp do_assign([x | xs], [], acc), do: do_assign(xs, [], [{x, {}} | acc])
  defp do_assign([x | sx], [y | ys], acc), do: do_assign(sx, ys, [{x, y} | acc])
end
