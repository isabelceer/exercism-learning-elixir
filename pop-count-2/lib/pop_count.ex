defmodule PopCount do
  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(number :: integer()) :: non_neg_integer()
 # def egg_count(number) when number >=0, do:
 #   Integer.to_string(number, 2)
 #   |> String.to_integer
 #   |> Integer.digits()
 #   |> Enum.count(& &1 == 1)


 #def egg_count(number) when number >=0, do:
 #   Integer.to_string(number, 2)
 #   |> String.replace("0", "")
 #   |> String.trim()
 #   |> String.length()

  def count_eggs(decimal), do: count_ones(decimal_to_binary(decimal))

  defp decimal_to_binary(0), do: []
  defp decimal_to_binary(n), do: [rem(n, 2) | decimal_to_binary(div(n, 2))]

  defp count_ones([]), do: 0
  defp count_ones([head | tail]), do: head + count_ones(tail)


  <<a::1, bits::bitstring>> = <<3152525525>>
end

