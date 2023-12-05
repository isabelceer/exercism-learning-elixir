defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  
  def calc(input) when is_integer(input) and input > 0, do: steps_needed(input)  
 
defp steps_needed(input, target \\ 1, function \\ &collatz/1 , steps \\ 0)
defp steps_needed(target, target, _function, steps), do: steps
defp steps_needed(input, target, function, steps), do:
        steps_needed(function.(input), target, function, steps + 1)
  
  defp collatz(input) when rem(input, 2) == 0 and input > 1, do: div(input, 2)
  defp collatz(input) when input > 1, do: 3 * input + 1
end
