defmodule NucleotideCount do
  @moduledoc """
  Given a DNA string, compute how many times each nucleotide occurs in the string.

  DNA is represented by an alphabet of the following symbols: 'A', 'C',
  'G', and 'T'.

  Each symbol represents a nucleotide, which is a fancy name for the
  particular molecules that happen to make up a large part of DNA.
  """

  @nucleotides [?A, ?C, ?G, ?T]

  @doc """
  Counts individual nucleotides in a NucleotideCount strand.

  ## Examples

  iex> NucleotideCount.count('AATAA', ?A)
  4

  iex> NucleotideCount.count('AATAA', ?T)
  1
  """
  @spec count([char], char) :: non_neg_integer
  def count(strand, nucleotide) do
    strand |> Enum.count(&(&1 === nucleotide))
  end


  @doc """
  Returns a summary of counts by nucleotide.

  ## Examples

  iex> NucleotideCount.histogram('AATAA')
  %{?A => 4, ?T => 1, ?C => 0, ?G => 0}
  """
  @spec histogram([char]) :: map
  def histogram(strand) do
    @nucleotides
    |> Enum.map(fn (n) -> {n, count(strand, n)} end)
    |> Enum.into(%{})
  end
end
