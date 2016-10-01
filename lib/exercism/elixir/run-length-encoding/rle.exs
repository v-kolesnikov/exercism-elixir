defmodule RunLengthEncoder do
  @moduledoc"""
  Implement run-length encoding and decoding.

  Run-length encoding (RLE) is a simple form of data compression, where runs
  (consecutive data elements) are replaced by just one data value and count.
  """

  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(string) do
    string
    |> String.codepoints
    |> rle([])
    |> Enum.map(fn({chr, cnt}) -> "#{cnt}#{chr}" end)
    |> Enum.join
  end

  def rle([], out), do: Enum.reverse(out)
  def rle([x | src], [{x, c} | out]), do: rle(src, [{x, c + 1} | out])
  def rle([x | src], out), do: rle(src, [{x, 1} | out])

  @spec decode(String.t) :: String.t
  def decode(string) do
    ~r/(\d+)([^\d])/
    |> Regex.scan(string)
    |> Enum.map(fn ([_, cnt, chr]) ->
      String.duplicate(chr, String.to_integer(cnt))
    end)
    |> Enum.join
  end
end
