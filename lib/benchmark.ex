defmodule Benchmark do
  def run(tests) when is_binary(tests) do
    run([tests])
  end

  def run(tests \\ ["a", "ab", "abc", "abcd", "abcde", "abcdef"]) do
    Enum.each(tests, fn word ->
      {time, _} = :timer.tc(fn -> Permute.permute(word) end)
      IO.puts("LIAM: Time for #{word}:\t\t\t#{time}")
    end)

    Enum.each(tests, fn word ->
      {time, _} = :timer.tc(fn -> Permute2.permute(word) end)
      IO.puts("ALEX: Time for #{word}:\t\t\t#{time}")
    end)

    # Enum.each(tests, fn word ->
    #   {time, _} = :timer.tc(fn -> Permute.Flow.permute(word) end)
    #   IO.puts("LIAM FLOW: Time for #{word}:\t\t\t#{time}")
    # end)
  end
end
