defmodule Benchmark do
  @test_string "abcdefg"

  def run(word \\ @test_string) do
    {time, _} = :timer.tc(fn -> Permute.permute(word) end)
    IO.puts("LIAM: Time for #{word}:\t\t\t#{time / 1000}ms")

    {time, _} = :timer.tc(fn -> Permute2.permute(word) end)
    IO.puts("ALEX: Time for #{word}:\t\t\t#{time / 1000}ms")

    {time, _} = :timer.tc(fn -> Permute.Flow.permute(word) end)
    IO.puts("FLOW: Time for #{word}:\t\t\t#{time / 1000}ms")
  end

  def benchee(word \\ @test_string) do
    Benchee.run(
      %{
        "LIAM" => fn -> Permute.permute(word) end,
        "ALEX" => fn -> Permute2.permute(word) end,
        "FLOW" => fn -> Permute.Flow.permute(word) end
      },
      time: 10,
      memory_time: 2,
      formatters: [
        Benchee.Formatters.HTML,
        Benchee.Formatters.Console
      ]
    )
  end
end
