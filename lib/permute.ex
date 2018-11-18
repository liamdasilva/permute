defmodule Permute do
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
    Enum.map(list, fn l ->
      List.delete(list, l)
      |> permute_aux()
      |> Enum.map(&(l <> &1))
    end)
    |> Enum.concat()
  end
end
