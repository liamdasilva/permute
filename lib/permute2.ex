defmodule Permute2 do
  @doc """
  Given a word with unique letters, returns an unsorted list of all possible letter permutations
  of that word

  ## Examples

      iex> Permute.permute("abc") |> Enum.sort()
      ["abc", "acb", "bac", "bca", "cab", "cba"]

  """
  def permute(word) do
    permute_aux(String.graphemes(word), [])
  end

  def permute_aux([], results) do
    results
  end

  def permute_aux([head | tail], []) do
    permute_aux(tail, [head])
  end

  def permute_aux([head | tail], results) do
    results = Enum.flat_map(results, &plug_holes(head, &1))
    permute_aux(tail, results)
  end

  def plug_holes(letter, string) do
    plug_holes(letter, string, [], 0, String.length(string))
  end

  def plug_holes(letter, string, results, index, length) do
    case index do
      0 ->
        results = [letter <> string] ++ results
        plug_holes(letter, string, results, index + 1, length)

      ^length ->
        [string <> letter] ++ results

      _ ->
        front = String.slice(string, 0, index)
        back = String.slice(string, index, String.length(string))
        results = [front <> letter <> back] ++ results
        plug_holes(letter, string, results, index + 1, length)
    end
  end
end
