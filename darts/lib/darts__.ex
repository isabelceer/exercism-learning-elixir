defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer

  def score(coordinates) do
    case radius(coordinates) do
      in_inner_circle when in_inner_circle <= 1 -> 10
      in_middle_circle when in_middle_circle <= 5 -> 5
      in_outer_circle when in_outer_circle <= 10 -> 1
      _outside -> 0
    end
  end
  
defp radius({x,y}), do: :math.sqrt(x ** 2 + y ** 2)

end
