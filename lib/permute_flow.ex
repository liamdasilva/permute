defmodule Permute.Flow do
  def permute(word) do
    permute_aux(String.graphemes(word))
  end

  def permute_aux([letter]) do
    [letter]
  end

  def permute_aux([l1, l2]) do
    [l1 <> l2, l2 <> l1]
  end

  def permute_aux(list) do
    list
    |> Flow.from_enumerable()
    |> Flow.map(fn l ->
      List.delete(list, l)
      |> Permute.permute_aux()
      |> Enum.map(&(l <> &1))
    end)
    |> Flow.reduce(fn -> [] end, fn list, results -> list ++ results end)
    |> Enum.to_list()
  end
end
