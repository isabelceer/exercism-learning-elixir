defmodule ResistorColorTrio do
  @colors %{
    black: 0,
    brown: 1,
    red: 2,
    orange: 3,
    yellow: 4,
    green: 5,
    blue: 6,
    violet: 7,
    grey: 8,
    white: 9
  }

  @doc """
  Calculate the resistance value in ohms from resistor colors
  """

  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}

  def label([color1, color2, color3 | _]) do
    ohms = (@colors[color1] * 10 + @colors[color2]) * 10 ** @colors[color3]

    cond do
      ohms < 1_000 -> {ohms, :ohms}
      ohms < 1_000_000 -> {ohms / 1_000, :kiloohms}
      ohms < 1_000_000_000 -> {ohms / 1_000_000, :megaohms}
      true -> {ohms / 1_000_000_000, :gigaohms}
    end
  end
end
