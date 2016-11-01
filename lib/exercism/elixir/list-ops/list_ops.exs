defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(__, size \\ 0)
  def count([], size), do: size
  def count([_ | xs], size), do: count(xs, size + 1)

  @spec reverse(list) :: list
  def reverse(__, acc \\ [])
  def reverse([], acc), do: acc
  def reverse([x | xs], acc), do: reverse(xs, [x | acc])

  @spec map(list, (any -> any)) :: list
  def map(l, f), do: reduce(l, [], fn(x, acc) -> [f.(x) | acc] end)

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do
    reduce(l, [], fn(x, acc) ->
      case f.(x) do
        true -> [x | acc]
        ____ -> acc
      end
    end)
  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _) when is_list(acc), do: acc |> reverse
  def reduce([], acc, _), do: acc
  def reduce([x | xs], acc, f), do: reduce(xs, f.(x, acc), f)

  @spec append(list, list) :: list
  def append(l1, []), do: l1
  def append([], l2), do: l2
  def append(l1, l2) do
    l1
    |> reverse
    |> reduce(l2, fn(x, acc) -> [x | acc] end)
    |> reverse
  end

  @spec concat([[any]]) :: [any]
  def concat(__, acc \\ [])
  def concat([], acc), do: acc |> reverse
  def concat([[] | xs], acc), do: concat(xs, acc)
  def concat([[x | xs] | ll], acc), do: concat([xs | ll], [x | acc])
end
