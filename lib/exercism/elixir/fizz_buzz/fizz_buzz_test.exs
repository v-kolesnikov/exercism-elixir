if !System.get_env("EXERCISM_TEST_EXAMPLES") do
  Code.load_file("fizz_buzz.exs", __DIR__)
end

ExUnit.start
ExUnit.configure exclude: :pending, trace: true

defmodule FizzBuzzTest do
  use ExUnit.Case

  test "from 1 to 2" do
    assert FizzBuzz.call(1..2) == [1, 2]
  end

  test "from 1 to 5" do
    assert FizzBuzz.call(1..5) == [1, 2, "Fizz", 4, "Buzz"]
  end

  test "from 9 to 15" do
    assert FizzBuzz.call(9..15) ==
      ["Fizz", "Buzz", 11, "Fizz", 13, 14, "FizzBuzz"]
  end

  test "only 15, 30, 45" do
    assert FizzBuzz.call([15, 30, 45]) ==
      ["FizzBuzz", "FizzBuzz", "FizzBuzz"]
  end
end
