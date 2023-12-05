defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
   def score(position), do: 
      position
      |> zone()
      |> points()

  defp zone(position), do: 
      position
      |> radius() 
      |> circle()

  defp radius({x,y}), do: :math.sqrt(x ** 2 + y ** 2)

  defp circle(radius) when radius <= 1, do: :inner_circle
  defp circle(radius) when radius <= 5, do: :middle_circle
  defp circle(radius) when radius <= 10, do: :outer_circle
  defp circle(_radius), do: :outside_the_circle

  defp points(:inner_circle), do: 10
  defp points(:middle_circle), do: 5
  defp points(:outer_circle), do: 1
  defp points(:outside_the_circle), do: 0

end
