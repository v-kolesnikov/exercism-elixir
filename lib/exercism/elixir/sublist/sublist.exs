defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(list,  list), do: :equal
  def compare(list1, list2) do
    cond do
      length(list1) <= length(list2) && is_sublist?(list1, list2) ->
        :sublist
      is_sublist?(list2, list1) ->
        :superlist
      true ->
        :unequal
    end
  end

  defp is_sublist?(list1, list2) when length(list1) > length(list2), do: false

  defp is_sublist?(list1, list2) do
    list1 === Enum.take(list2, length(list1)) || is_sublist?(list1, tl(list2))
  end
end
