defmodule Hamming do
  @doc """
  Returns number of differences between two strands of DNA, known as the Hamming Distance.

  ## Examples

  iex> Hamming.hamming_distance('AAGTCATA', 'TAGCGATC')
  {:ok, 4}
  """
  @spec hamming_distance([char], [char]) :: non_neg_integer
  def hamming_distance(strand1, strand2) do
    case Enum.count(strand1) - Enum.count(strand2) do
      0 -> {:ok, distance(strand1, strand2)}
      _ -> {:error, "Lists must be the same length"}
    end
  end

  def distance(s1, s2) do
    s1
    |> Enum.zip(s2)
    |> Enum.reduce(0, &comp/2)
  end

  def comp({x, x}, acc), do: acc
  def comp({_, _}, acc), do: acc + 1
end
