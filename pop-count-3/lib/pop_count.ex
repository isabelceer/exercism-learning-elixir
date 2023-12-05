defmodule PopCount do
  @doc """
  Given the number, count the number of eggs.
  """
  @spec egg_count(non_neg_integer() | bitstring()) :: non_neg_integer()
   def egg_count(<<1::1, rest::bitstring>>), do: 1 + egg_count(rest)
   def egg_count(<<0::1, rest::bitstring>>), do: egg_count(rest)
   def egg_count(<<>>), do: 0
   def egg_count(number), do: 
      number 
      |> to_bitstring()
      |> egg_count()

  @spec to_bitstring(non_neg_integer()) :: bitstring()
  defp to_bitstring(0), do: <<>>  
  defp to_bitstring(n), do: with(
      needed_bits = Enum.find(1..n, &(Integer.pow(2, &1) > n)),
      do: <<n::size(needed_bits)>>)
end
