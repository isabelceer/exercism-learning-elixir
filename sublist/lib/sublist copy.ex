defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when is_list(a) and is_list(b) do
    cond do
      a == b -> :equal
      length(a) < length(b) -> if(is_sublist?(a, b), do: :sublist, else: :unequal)
      length(a) > length(b) -> if(is_sublist?(b, a), do: :superlist, else: :unequal)
      true -> :unequal
    end
  end

  defp is_sublist?(list_a, list_b) when length(list_a) <= length(list_b) do
    List.starts_with?(list_b, list_a) || is_sublist?(list_a, tl(list_b))
  end

  defp is_sublist?(_, _), do: false
end
