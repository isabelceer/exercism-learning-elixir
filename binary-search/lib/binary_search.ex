defmodule BinarySearch do
  @doc """
    Searches for a key in the tuple using the binary search algorithm.
    It returns :not_found if the key is not in the tuple.
    Otherwise returns {:ok, index}.

    ## Examples

      iex> BinarySearch.search({}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 2)
      :not_found

      iex> BinarySearch.search({1, 3, 5}, 5)
      {:ok, 2}

  """

  @spec search(tuple, integer) :: {:ok, integer} | :not_found
  def search(numbers, key) when is_tuple(numbers) do
    search(numbers, key, 0, tuple_size(numbers) - 1)
  end

  defp search(_numbers, _key, first, last) when first > last do
    :not_found
  end

  defp search(numbers, key, first, last) do
    middle_elem = div(first + last, 2)

    case elem(numbers, middle_elem) do
      ^key -> {:ok, middle_elem}
      too_small when too_small < key -> search(numbers, key, middle_elem + 1, last)
      too_big when too_big > key -> search(numbers, key, first, middle_elem - 1)
    end
  end
end
