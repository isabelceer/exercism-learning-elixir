defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when is_list(a) and is_list(b) do
    case {contains?(a, b), contains?(b, a)} do
      {true, true} -> :equal
      {true, false} -> :superlist
      {false, true} -> :sublist
      {false, false} -> :unequal
    end
  end

  # determines if list a contains list b. restore_a is needed to restore
  # already "eaten" members of a, when b couldn't be matched completely
  defp contains?(a, b, current_b \\ :initial, restore_a \\ nil)
  defp contains?(a, b, :initial, nil), do: contains?(a, b, b, nil)
  defp contains?([ha | restore_a], b, b, nil), do: contains?()




#   def compare(a, b) when is_list(a) and is_list(b) do
#     cond do
#       a == b -> :equal
#       length(a) < length(b) -> if(is_sublist?(a, b), do: :sublist, else: :unequal)
#       length(a) > length(b) -> if(is_sublist?(b, a), do: :superlist, else: :unequal)
#       true -> :unequal
#     end
#   end

#   defp is_sublist?(list_a, list_b) when length(list_a) <= length(list_b) do
#     List.starts_with?(list_b, list_a) || is_sublist?(list_a, tl(list_b))
#   end

#   defp is_sublist?(_, _), do: false
# end
