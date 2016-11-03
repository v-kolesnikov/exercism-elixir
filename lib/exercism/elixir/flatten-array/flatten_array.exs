defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(x), do: do_flatten(x, [])

  defp do_flatten([], acc), do: Enum.reverse(acc)
  defp do_flatten([[x | xs] | ll], acc), do: do_flatten([x, xs | ll], acc)
  defp do_flatten([[] | xs], acc), do: do_flatten(xs, acc)
  defp do_flatten([nil| xs], acc), do: do_flatten(xs, acc)
  defp do_flatten([x  | xs], acc), do: do_flatten(xs, [x | acc])
end
