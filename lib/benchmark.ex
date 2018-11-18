defmodule Benchmark do
  def run(tests \\ ["a", "ab", "abc", "abcd", "abcde", "abcdef"]) do
    Enum.each(tests, fn word ->
      {time, _} = :timer.tc(fn -> Permute.permute(word) end)
      IO.puts("NON FLOW: Time for #{word}:\t\t\t#{time}")
    end)

    Enum.each(tests, fn word ->
      {time, _} = :timer.tc(fn -> Permute.Flow.permute(word) end)
      IO.puts("FLOW: Time for #{word}:\t\t\t#{time}")
    end)
  end
end
