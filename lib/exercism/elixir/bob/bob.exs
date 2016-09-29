defmodule Bob do
  @moduledoc """
  Bob is a lackadaisical teenager. In conversation, his responses are very limited.

  Bob answers 'Sure.' if you ask him a question.

  He answers 'Whoa, chill out!' if you yell at him.

  He says 'Fine. Be that way!' if you address him without actually saying
  anything.

  He answers 'Whatever.' to anything else.
  """

  def hey(input) do
    cond do
      input |> String.strip === "" -> "Fine. Be that way!"
      input |> String.ends_with?("?") -> "Sure."
      input |> String.upcase === input && input |> String.downcase !== input -> "Whoa, chill out!"
      true -> "Whatever."
    end
  end
end
