defmodule ResistorColorTrio do
  @doc """
  Calculate the resistance value in ohms from resistor colors.
  """

  @spec label(colors :: [atom]) :: {number, :ohms | :kiloohms | :megaohms | :gigaohms}

  def label([ring1, ring2, ring3 | _]),
    do:
      digits(ring1, ring2)
      |> ohms_with_zeros(ring3)
      |> with_unit()

  defp digits(ring1, ring2), do: 10 * digit(ring1) + digit(ring2)

  defp digit(:black), do: 0
  defp digit(:brown), do: 1
  defp digit(:red), do: 2
  defp digit(:orange), do: 3
  defp digit(:yellow), do: 4
  defp digit(:green), do: 5
  defp digit(:blue), do: 6
  defp digit(:violet), do: 7
  defp digit(:grey), do: 8
  defp digit(:white), do: 9

  defp ohms_with_zeros(ohms, ring3), do: ohms * 10 ** digit(ring3)

  defp with_unit(ohms) when ohms < 1_000, do: {ohms, :ohms}
  defp with_unit(ohms) when ohms < 1_000_000, do: {ohms / 1_000, :kiloohms}
  defp with_unit(ohms) when ohms < 1_000_000_000, do: {ohms / 1_000_000, :megaohms}
  defp with_unit(ohms), do: {ohms / 1_000_000_000, :gigaohms}
end
