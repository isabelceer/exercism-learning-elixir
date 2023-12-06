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
      accumulate_by_prepending(list, [])
      |> Enum.reverse()

  defp accumulate_by_prepending([], acc), do: acc
  defp accumulate_by_prepending([nil | tail], acc), do: accumulate_by_prepending(tail, acc)
  defp accumulate_by_prepending([[] | tail], acc), do: accumulate_by_prepending(tail, acc)

  defp accumulate_by_prepending([head | tail], acc) when is_list(head),
    do: accumulate_by_prepending(tail, accumulate_by_prepending(head, acc))

  defp accumulate_by_prepending([head | tail], acc),
    do: accumulate_by_prepending(tail, [head | acc])
end
