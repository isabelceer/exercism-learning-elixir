defmodule KitchenCalculator do
  def get_volume(volume_pair) do
    elem(volume_pair, 1) 
  end

  def to_milliliter(volume_pair) do
    cond do
    elem(volume_pair, 0) == :cup -> {:milliliter, get_volume(volume_pair) * 240} 
    elem(volume_pair, 0) == :fluid_ounce ->  {:milliliter, get_volume(volume_pair) * 30}
    elem(volume_pair, 0) == :teaspoon ->  {:milliliter, get_volume(volume_pair) * 5}
    elem(volume_pair, 0) == :tablespoon ->  {:milliliter, get_volume(volume_pair) * 15}
    elem(volume_pair, 0) == :milliliter ->  {:milliliter, get_volume(volume_pair) * 1}
    end
  end
  
  def from_milliliter({:milliliter, volume}, unit) do
    case unit do 
      :cup -> {:cup, volume / 240}
      :fluid_ounce -> {:fluid_ounce, volume / 30}
      :teaspoon -> {:teaspoon, volume / 5}
      :tablespoon -> {:tablespoon, volume / 15}
      :milliliter -> {:milliliter, volume / 1}
    end
  end
  def convert(volume_pair, unit) do
   volume_pair
    |> to_milliliter
    |> from_milliliter(unit)
  end
end
