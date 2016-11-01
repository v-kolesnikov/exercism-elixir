defmodule School do
  @moduledoc """
  Simulate students in a school.

  Each student is in a grade.
  """

  @doc """
  Add a student to a particular grade in school.
  """
  @spec add(map, String.t, integer) :: map
  def add(db, name, grade), do: Map.put(db, grade, [name | db[grade] || []])

  @doc """
  Return the names of the students in a particular grade.
  """
  @spec grade(map, integer) :: [String.t]
  def grade(db, grade), do: db[grade] || []

  @doc """
  Sorts the school by grade and name.
  """
  @spec sort(map) :: [{integer, [String.t]}]
  def sort(db) do
    db
    |> Enum.sort(fn {k1, _}, {k2, _} -> k1 < k2 end)
    |> Enum.map(fn {k, v} -> {k, Enum.sort(v)} end)
  end
end
