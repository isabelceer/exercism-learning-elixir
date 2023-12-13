defmodule FlattenArray do
  @doc """
    Accept a list and return the list flattened without nil values.

    ## Examples

      iex> FlattenArray.flatten([1, [2], 3, nil])
      [1,2,3]

      iex> FlattenArray.flatten([nil, nil])
      []

  """

  @spec flatten(list) :: list
  def flatten(list),
    do:
      []
      |> accumulate_by_prepending(list)
      |> Enum.reverse()

  defp accumulate_by_prepending(acc, [head | tail]),
    do:
      acc
      |> accumulate_by_prepending(head)
      |> accumulate_by_prepending(tail)

  defp accumulate_by_prepending(acc, []), do: acc
  defp accumulate_by_prepending(acc, nil), do: acc
  defp accumulate_by_prepending(acc, item), do: [item | acc]
end
