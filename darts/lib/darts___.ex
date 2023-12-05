defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer

  def score(coordinates), do: coordinates
      |> radius()
      |> zone()

  defp zone(in_inner_circle) when in_inner_circle <= 1, do: 10
  defp zone(in_middle_circle) when in_middle_circle <= 5, do: 5
  defp zone(in_outer_circle) when in_outer_circle <= 10 , do: 1
  defp zone(_outside), do: 0
  
  defp radius({x,y}), do: :math.sqrt(x ** 2 + y ** 2)

end
