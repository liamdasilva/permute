defmodule Permute.Flow do
  @doc """
  Given a word with unique letters, returns an unsorted list of all possible letter permutations
  of that word
  ## Examples

      iex> Permute.permute("abc") |> Enum.sort()
      ["abc", "acb", "bac", "bca", "cab", "cba"]

  """
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
    |> Flow.from_enumerable(stages: 8)
    |> Flow.map(fn l ->
      List.delete(list, l)
      |> Permute.permute_aux()
      |> Enum.map(&(l <> &1))
    end)
    |> Flow.reduce(fn -> [] end, fn list, results -> list ++ results end)
    |> Enum.to_list()
  end
end
