defmodule PopCount do
  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(bitstring()) :: non_neg_integer()
   def egg_count(<<1::1, rest::bitstring>>), do: 1 + egg_count(rest)
   def egg_count(<<0::1, rest::bitstring>>), do: egg_count(rest)
   def egg_count(<<>>), do: 0
   def egg_count(number), do: 
      number 
      |> decimal_to_binary 
      |> egg_count

  @spec decimal_to_binary(non_neg_integer()) :: bitstring()
  defp decimal_to_binary(0), do: <<>>
  defp decimal_to_binary(n) when n > 0, do: <<rem(n, 2)>> <> decimal_to_binary(div(n, 2))
end
