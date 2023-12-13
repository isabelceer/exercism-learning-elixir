defmodule Triangle do
  @type kind :: :equilateral | :isosceles | :scalene

  @doc """
  Return the kind of triangle of a triangle with 'a', 'b' and 'c' as lengths.
  """
  @spec kind(number, number, number) :: {:ok, kind} | {:error, String.t()}
  def kind(a, b, c) when a <= 0 or b <= 0 or c <= 0, do: {:error, "all side lengths must be positive"}
   def kind(a, b, c) do
  cond do 
    a + b >= c and b + c >= a and a + c >= b -> check_triangle_kind(a, b, c)  
    true -> {:error, "side lengths violate triangle inequality"}
end
end
  defp check_triangle_kind(a, b, c) when a == b and b == c, do: {:ok, :equilateral}
  defp check_triangle_kind(a, b, c) when a == b or b == c or a == c, do: {:ok, :isosceles}
  defp check_triangle_kind(a, b, c) when a != b and b != c and a != c, do: {:ok, :scalene}
end
